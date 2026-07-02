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

# Step 4: Convert Vec<ark Transaction> to Vec<mirror Transaction> for transaction_history
python3 -c "
with open('$FILE', 'r') as f:
    lines = f.readlines()
for i, line in enumerate(lines):
    if 'ArkWallet::transaction_history' in line:
        for j in range(i+1, min(i+10, len(lines))):
            if '.await?' in lines[j]:
                lines[j] = lines[j].replace('.await?', '.await.map(|v| v.into_iter().map(|t| -> crate::api::simple::ArkTransaction { t.into() }).collect::<Vec<_>>())?')
                break
with open('$FILE', 'w') as f:
    f.writelines(lines)
"

echo "Post-processed $FILE"
