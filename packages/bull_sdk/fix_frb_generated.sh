#!/bin/bash
# Post-process frb_generated.rs to wrap external crate error types in FrbWrapper
FILE="rust/src/frb_generated.rs"

# Portable in-place sed (works on both GNU/Linux and BSD/macOS)
sedi() { sed -i.bak "$@" && rm -f "${@: -1}.bak"; }

# Step 1: Change type parameter from Error to FrbWrapper<Error>
sedi 's/transform_result_dco::<_, _, lwk::api::error::LwkError>/transform_result_dco::<_, _, FrbWrapper<lwk::api::error::LwkError>>/g' "$FILE"
sedi 's/transform_result_dco::<_, _, boltz::api::error::BoltzError>/transform_result_dco::<_, _, FrbWrapper<boltz::api::error::BoltzError>>/g' "$FILE"

# Step 2: For those calls, the closure result needs .map_err(FrbWrapper)
# The pattern is })()) at the end of the transform_result_dco block
# We use awk to find lines after transform_result_dco::<_, _, FrbWrapper< and add .map_err(FrbWrapper) before the closing )
python3 -c "
import re
with open('$FILE', 'r') as f:
    content = f.read()

# Find transform_result_dco with FrbWrapper and add .map_err(FrbWrapper) to the closure result
# Pattern: })()) — closure end, becomes }).map_err(FrbWrapper))
# But we need to only do this for the FrbWrapper variants

# Strategy: find all transform_result_dco::<_, _, FrbWrapper< blocks
# and in each, find the matching })()) and change to })().map_err(FrbWrapper))

lines = content.split('\n')
in_frb_wrapper_block = False
brace_depth = 0
result = []

for line in lines:
    if 'transform_result_dco::<_, _, FrbWrapper<' in line:
        in_frb_wrapper_block = True
        # Count opening parens in this line
        brace_depth = line.count('(') - line.count(')')
        result.append(line)
        continue

    if in_frb_wrapper_block:
        brace_depth += line.count('(') - line.count(')')
        if brace_depth <= 0:
            # This is the closing line — add .map_err(FrbWrapper)
            # Replace })()) with })().map_err(FrbWrapper))
            line = line.replace('})())', '})().map_err(FrbWrapper))')
            in_frb_wrapper_block = False
        result.append(line)
    else:
        result.append(line)

with open('$FILE', 'w') as f:
    f.write('\n'.join(result))
"

# Step 3: Convert mirrored TxFee to boltz::TxFee via .into()
sedi 's/api_miner_fee,/api_miner_fee.into(),/g' "$FILE"

echo "Post-processed $FILE"

# Step 4: Bound the unsigned 64-bit encoders on the Dart side.
# FRB emits toSigned(64).toInt(), which wraps modulo 2^64 rather than failing,
# so an out-of-range amount reached Rust as a different number. Rust cannot
# detect this: the wrapping happens before the call.
DART_FILE="lib/src/rust/frb_generated.io.dart"

python3 - "$DART_FILE" <<'PY'
import sys

path = sys.argv[1]
with open(path) as f:
    source = f.read()

import_anchor = "import 'frb_generated.dart';"
import_line = "import '../checked_u64.dart';"
encoders = [
    ("cst_encode_u_64", "int cst_encode_u_64(BigInt raw) {"),
    ("cst_encode_usize", "int cst_encode_usize(BigInt raw) {"),
]
body = "    // Codec=Cst (C-struct based), see doc to use other codecs\n    return raw.toSigned(64).toInt();"
patched = "    // Codec=Cst (C-struct based), see doc to use other codecs\n    return checkedU64ToNativeInt(raw);"

if import_line not in source:
    if source.count(import_anchor) != 1:
        sys.exit(f"expected exactly one {import_anchor!r} in {path}")
    source = source.replace(import_anchor, f"{import_anchor}\n{import_line}", 1)

for name, signature in encoders:
    if source.count(signature) != 1:
        sys.exit(f"expected exactly one {name} in {path}")
    already = f"{signature}\n{patched}"
    if already in source:
        continue
    target = f"{signature}\n{body}"
    if target not in source:
        sys.exit(f"{name} in {path} does not match the expected generated body")
    source = source.replace(target, f"{signature}\n{patched}", 1)

with open(path, "w") as f:
    f.write(source)
PY

echo "Post-processed $DART_FILE"
