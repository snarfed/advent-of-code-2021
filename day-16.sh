#!/bin/bash
#
# Usage: convert to binary, zero-pad
#
# export hex=`cat day-16.input`
# echo $(printf %0`expr 4 \* ${#hex}`s `echo "ibase=16;obase=2;$hex" | BC_LINE_LENGTH=99999 bc`) | ./day-16.sh
set -e
# set -x

num=${1:-9999}
read data

while [[ ! $data =~ ^0*$ && (( num > 0 )) ]]; do
    ver=${data:0:3}
    echo `echo "ibase=2;obase=A;${ver}" | bc`
    type=${data:3:3}
    data=${data:6}
    if [[ $type == '100' ]]; then
        bits=''
        while true; do
            bits=${bits}${data:1:4}
            sign=${data:0:1}
            data=${data:5}
            if [[ $sign == '0' ]]; then break; fi
        done
        # echo num `echo "ibase=2;obase=A;$bits" | bc`
    else
        sign=${data:0:1}
        data=${data:1}
        if [[ $sign == '0' ]]; then
            len=`echo "ibase=2;obase=A;${data:0:15}" | bc`
            data=${data:15}
            # echo "$len bits of subpackets"
            echo ${data:0:${len}} | ./day-16.sh
            data=${data:${len}}
        else
            subs=`echo "ibase=2;obase=A;${data:0:11}" | bc`
            data=${data:11}
            # echo "$subs subpackets"
            # echo ${data} | ./day-16.sh $subs
            # exit
        fi
    fi
    num=$(( num - 1 ))
done
