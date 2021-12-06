#!/bin/bash

# Unfinished, switched to SQL
grep -E '(.+),.+ -> \1,.+' day-5.input | gsort -t, -n > day-5.input.horiz
grep -E '.+,(.+) -> .+,\1$' day-5.input | gsort -t, -n > day-5.input.vert
