#!/bin/bash

cut -d \| -f2 day-8.input | sed 's/^ //; s/ /\n/g' | grep -cE '^(..|...|....|.......)$'
