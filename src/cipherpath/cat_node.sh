#!/usr/bin/env bash

TARGET=$1
BASE32=base32
BASE64=base64
INDEXFILE=index

touch ${INDEXFILE}


PRESENT=`./check_node.sh ${TARGET}`
if [ -z "${PRESENT}" ]
then
    echo "No such node"
    exit 1
fi

cat ${PRESENT}
