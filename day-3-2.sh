#!/bin/bash
set -x

cp day-3.input most
cp day-3.input least
oxy=
co2=
digit='cut -c $i $which | sort | uniq -c | sort -n $arg | head -n 1 | cut -c9'
for i in `seq 1 12`; do
  oxy=${oxy}`arg=-r which=most eval $digit`
  co2=${co2}`arg=- which=least eval $digit`

  cp -f most prev
  grep -E ^$oxy prev > most
  cp -f least prev
  grep -E ^$co2 prev > least
done

expr `echo "ibase=2;obase=A;$oxy" | bc` \* `echo "ibase=2;obase=A;$co2" | bc`
