#!/usr/bin/env bash


TARGET=$1
BASE32=base32
BASE64=base64
INDEXFILE=index

touch ${INDEXFILE}


PRESENT=`./check_node.sh ${TARGET}`
if [ -n "${PRESENT}" ]
then
    echo "found old: " ${PRESENT}
    exit
fi


FLATNAME=`echo ${TARGET} | ${BASE32} | tr '[:upper:]' '[:lower:]'`

echo "making new"

NEWNAME=`dd status=none if=/dev/random bs=32 iflag=fullblock count=1 | ${BASE32} | tr '[:upper:]' '[:lower:]'`

#echo "Flatname: " ${FLATNAME}
#echo ${NEWNAME} "<= mangled name"

echo ${FLATNAME} > realname.${NEWNAME}
touch ${NEWNAME}
echo "${FLATNAME} => ${NEWNAME}" >> ${INDEXFILE}
