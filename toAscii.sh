#!/bin/sh
#
# Convert given name to ascii code

input=$@
echo "${input}" | tr -d "\n" | od -An -t dC
