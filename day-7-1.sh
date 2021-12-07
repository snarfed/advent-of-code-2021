#!/bin/bash

median=`sort -n day-7.input.vert | tail -n $(($(wc -l < day-7.input.vert) / 2 + 1)) | head -n 1`
xargs -n 1 expr $median - < day-7.input.vert | sed 's/-//; s/^/+ /' | xargs expr 0
