#!/usr/bin/env bash

BASE32=base32
BASE64=base64
INDEXFILE=index

touch ${INDEXFILE}

for file in `ls realname.*`
do
    REALNAME=`cat $file | tr '[:lower:]' '[:upper:]' | ${BASE32} -d -`
    echo "Realname: " ${REALNAME}
done
