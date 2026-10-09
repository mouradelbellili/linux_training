#!/bin/sh

if [ "$#" -lt 2 ]; then
    echo "Error: filesdir and searchstr are required" >&2
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory" >&2
    exit 1
fi

case $filesdir in
    /*) ;;
    *) filesdir=./$filesdir ;;
esac

num_files=$(find "$filesdir" -type f -print | wc -l | tr -d '[:space:]')
num_matching_lines=$(find "$filesdir" -type f -exec grep -F -h -e "$searchstr" {} + | wc -l | tr -d '[:space:]')

echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"