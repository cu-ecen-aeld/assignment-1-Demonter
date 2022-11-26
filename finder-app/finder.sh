#!/bin/bash

if [ $# != 2 ]
then
    echo ERROR: Invalid Number of Arguments.
    echo Total number of arguments should be 2.
    echo The order of the arguments should be:
    echo "  1) Path to the file"
    echo "  2) String to be written in the specified file"
    exit 1
fi

if [ ! -d $1 ]
then
    echo "Directory $1 doesn't exist"
    exit 1
fi

NUM_FILES=$(find $1 -type f | wc -l)
COUNT_MATCH=$(cd $1 && grep -r "$2" | wc -l)

echo "The number of files are ${NUM_FILES} and the number of matching lines are ${COUNT_MATCH}"

