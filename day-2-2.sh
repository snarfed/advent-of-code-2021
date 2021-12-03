#!/bin/bash
#
# Usage: ./day-2-2.sh < day-2.input

set -x

declare -i horiz=0 depth=0 aim=0
while read -r op num; do
    if [[ $op == 'forward' ]]; then
        horiz+=num
        depth+=`expr $aim \* $num`
    elif [[ $op == 'down' ]]; then
        aim+=num
    else
        aim=aim-num
    fi
done
echo $horiz $depth $aim `expr $horiz \* $depth`
