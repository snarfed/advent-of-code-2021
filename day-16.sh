#!/bin/bash
#
# Usage: convert to binary, zero-pad
#
# export hex=`cat day-16.input`
# echo $(printf %0`expr 4 \* ${#hex}`s `echo "ibase=16;obase=2;$hex" | BC_LINE_LENGTH=99999 bc`) | ./day-16.sh
set -e
# set -x

num=${1:-99999}
skip=0

read data

while [[ ! $data =~ ^0*$ && (( $num > 0 )) ]]; do
    ver=${data:0:3}
    # echo version `echo "ibase=2;obase=A;${ver}" | bc`
    type=${data:3:3}
    data=${data:6}

    if [[ $type == '100' ]]; then
        # scalar
        bits=''
        while true; do
            bits=${bits}${data:1:4}
            sign=${data:0:1}
            data=${data:5}
            if [[ $sign == '0' ]]; then break; fi
        done
        if (( $skip <= 0 )); then
            echo -n `echo "ibase=2;obase=A;$bits" | bc`,
        fi

    else
        # operator and subpackets
        sign=${data:0:1}
        data=${data:1}

        case `echo "ibase=2;obase=A;${type}" | bc` in
            0 ) ops='sum([' ; ope='])' ;;
            1 ) ops='math.prod([' ; ope='])' ;;
            2 ) ops='min([' ; ope='])' ;;
            3 ) ops='max([' ; ope='])' ;;
            5 ) ops='int(operator.gt(' ; ope='))'  ;;
            6 ) ops='int(operator.lt(' ; ope='))'  ;;
            7 ) ops='int(operator.eq(' ; ope='))'
        esac
        if [[ $ops == '' ]]; then
            echo "UNKNOWN TYPE $type"
            exit 1
        fi
        # echo TYPE $type

        if [[ $sign == '0' ]]; then
            len=`echo "ibase=2;obase=A;${data:0:15}" | bc`
            # echo "$len bits of subpackets"
            data=${data:15}
            if (( $skip <= 0 )); then
                python3 -c "import operator, math; print(${ops}`echo ${data:0:${len}} | ./day-16.sh`${ope}, end=',')"
            fi
            data=${data:${len}}
        else
            num_subs=`echo "ibase=2;obase=A;${data:0:11}" | bc`
            # echo "$num_subs subpackets"
            data=${data:11}
            if (( $skip <= 0 )); then
                python3 -c "import operator, math; print(${ops}`echo ${data} | ./day-16.sh $num_subs`${ope}, end=',')"
            fi
            skip=$(( $skip + $num_subs + 1 ))  # + 1 because we - 1 below
            # exit
        fi
    fi
    num=$(( num - 1 ))
    if (( $skip > 0 )); then
        skip=$(( skip - 1 ))
    fi
done
