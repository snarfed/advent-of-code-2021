#!/bin/bash

rate='seq 1 12 | xargs -n 1 -I %% bash -c "cut -c %% day-3.input | sort | uniq -c | sort -n $arg | head -n 1 | cut -c9" | xargs echo | tr -d " " | sed "s/^/ibase=2;obase=A;/" | bc'
expr `arg= eval $rate` \* `arg=-r eval $rate`
