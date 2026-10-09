#!/bin/sh

if [ "$#" -lt 2 ]; then
    echo "Error: writefile and writestr are required" >&2
    exit 1
fi

writefile=$1
writestr=$2
write_dir=$(dirname "$writefile")

if [ ! -d "$write_dir" ] && ! mkdir -p "$write_dir"; then
    echo "Error: could not create directory '$write_dir'" >&2
    exit 1
fi

if ! printf '%s' "$writestr" > "$writefile"; then
    echo "Error: could not write to '$writefile'" >&2
    exit 1
fi