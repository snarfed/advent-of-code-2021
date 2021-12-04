#!/bin/bash

# Ran this, got 2576 * 1518 == 3910368 as the answer, but adventofcode.com says
# that's incorrect. Debugged, haven't yet figured out where I went wrong.

rate='seq 1 12 | xargs -n 1 -I %% bash -c "cut -c %% day-3.input | sort | uniq -c | sort -n $arg | head -n 1 | cut -c9" | xargs echo | tr -d " "'
least=`arg= eval $rate`
most=`arg=-r eval $rate`

search="xargs -n 1 -I %% bash -c 'grep -E ^\${base::%%} day-3.input' | head -n 1 | sed 's/^/ibase=2;obase=A;/' | bc"
# Got 101000010000 for oxygen (most common bits) with all digits,
# 010111101110 for CO2 (least common bits) with 11 out of 12 digits.
expr `seq 12 -1 1 | base=$most eval $search` \* \
  `seq 12 -1 1 | base=$least eval $search`
