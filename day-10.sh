#!/bin/bash

#
# PART 1
#
cp -f day-10.input cur

while grep -q -E '\(\)|\[]|\{}|<>' cur; do
    sed -i '' -E 's/\(\)|\[]|\{}|<>//g' cur
done

sed -i '' -E '^[\([{<]+' cur

expr `grep -c -E '^\)' cur` \* 3 + \
     `grep -c -E '^]' cur` \* 57 + \
     `grep -c -E '^}' cur` \* 1197 + \
     `grep -c -E '^>' cur` \* 25137


#
# PART 2
#
cp -f day-10.input cur

while grep -q -E '\(\)|\[]|\{}|<>' cur; do
    sed -i '' -E 's/\(\)|\[]|\{}|<>//g' cur
done

grep -E '^[\([{<]+$' cur | sed 's/(/1/g; s/\[/2/g; s/{/3/g; s/</4/g; s/$/0/' | sed -E 's/([0-9])/(\1 + 5 * /g; s/$/0/' | bc | sort -n

# middle score is line 25
