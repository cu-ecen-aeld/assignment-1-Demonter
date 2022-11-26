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

DIRNAME=$(dirname $1)

if [ ! -d ${DIRNAME} ]
then
    mkdir ${DIRNAME}
    if [ $? != 0 ]
    then
        echo "ERROR: Can't create ${DIRNAME}"
        exit 1
    fi
fi

touch $1
if [ $? != 0 ]
then
    echo "ERROR: Can't write to file $1"
    exit 1
fi

echo $2 > $1
