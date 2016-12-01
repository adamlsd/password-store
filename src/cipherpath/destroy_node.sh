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

echo "removing old"

#echo "Flatname: " ${FLATNAME}
#echo ${NEWNAME} "<= mangled name"

rm realname.${PRESENT}
rm ${PRESENT}
echo ${PRESENT}
cat ${INDEXFILE} | grep -v ${PRESENT} > tmp.${INDEXFILE}
mv tmp.${INDEXFILE} ${INDEXFILE}
