#!/usr/bin/env bash

TARGET=$1
BASE32=base32
BASE64=base64
INDEXFILE=index

touch ${INDEXFILE}

FLATNAME=`echo ${TARGET} | ${BASE32} | tr '[:upper:]' '[:lower:]'`

#echo ${FLATNAME}

#echo grep '"'^${FLATNAME} '"' ${INDEXFILE}
MAPPING=`grep "^${FLATNAME} " ${INDEXFILE}`

if [ -n "${MAPPING}" ]
then
    ALIAS=`echo ${MAPPING} | awk '{print $3}'`
    [ -n "${ALIAS}" ] && echo $ALIAS
fi
