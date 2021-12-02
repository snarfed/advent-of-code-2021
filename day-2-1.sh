#!/bin/bash
#
# Usage: day-2-1.sh day-2-1.input

set -x

expr `grep forward $1 | sed s/forward/+/ | xargs expr 0` \* \
  `grep -E 'down|up' $1 | sed s/down/+/ | sed s/up/-/ | xargs expr 0`
