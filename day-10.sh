#!/bin/bash
cp -f day-10.input cur

while grep -q -E '\(\)|\[]|\{}|<>' cur; do
    sed -i '' -E 's/\(\)|\[]|\{}|<>//g' cur
done

sed -i '' -E '^[\([{<]+' cur

expr `grep -c -E '^\)' cur` \* 3 + \
     `grep -c -E '^]' cur` \* 57 + \
     `grep -c -E '^}' cur` \* 1197 + \
     `grep -c -E '^>' cur` \* 25137
