#!/bin/bash

if [ $# != 1 ]; then
    echo "usage: "$0" [Target directory path]"
    exit
fi


TARGET_DIR=$1
#echo ${TARGET_DIR}

MOV_FILES=$(find ${TARGET_DIR} -name "*.MOV")
#echo ${MOV_FILES}

for MOV_FILE in ${MOV_FILES}
do
    if [ ! -f ${MOV_FILE}.org ]; then
        mv ${MOV_FILE} ${MOV_FILE}.org
        ffmpeg -i ${MOV_FILE}.org -profile:v baseline -level:v 4.1 -strict -2 ${MOV_FILE}

        touch -r ${MOV_FILE}.org ${MOV_FILE}
    else
        echo ${MOV_FILE}".org found!"
    fi
done

