#!/bin/sh

VALUE=$(sh -c "${PLUGIN_SH_CMD}")

cd eve

grep -H -o -r "${PLUGIN_VARIABLE} .*$" * | while read LINE
do
	FILE=`echo $LINE | cut -d":" -f1`
	OLD=`echo $LINE | cut -d" " -f2`

	echo "${FILE} : ${PLUGIN_VARIABLE} : ${OLD} -> ${VALUE}"
	sed -i -e "s/${PLUGIN_VARIABLE} .*\$/${PLUGIN_VARIABLE} ${VALUE}/1" ${FILE}

done
