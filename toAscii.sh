#!/bin/sh
#
# Convert given name to ascii code

input=$@
echo "${input}" | tr -d "\n" | od -An -t x1 | sed 's/[ ]/&0x/g'
