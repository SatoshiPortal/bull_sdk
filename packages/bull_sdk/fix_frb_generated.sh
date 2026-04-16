#!/bin/bash
# Post-process frb_generated.rs to wrap external crate error types in FrbWrapper
FILE="rust/src/frb_generated.rs"

# Step 1: Change type parameter from Error to FrbWrapper<Error>
sed -i '' 's/transform_result_dco::<_, _, lwk::api::error::LwkError>/transform_result_dco::<_, _, FrbWrapper<lwk::api::error::LwkError>>/g' "$FILE"
sed -i '' 's/transform_result_dco::<_, _, boltz::api::error::BoltzError>/transform_result_dco::<_, _, FrbWrapper<boltz::api::error::BoltzError>>/g' "$FILE"

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

echo "Post-processed $FILE"
