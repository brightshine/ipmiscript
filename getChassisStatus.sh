#!/bin/sh
#
# Given BMC IP, use ipmitool to get chassis status

USER='ADMIN'
PASSWD='ADMIN'
OEM_RAW_CMD='0x30 0x2D '

if [  "$#" -le 0 ]; then
	echo " Usage : $0 IP "
	exit 1
fi

IP=$1
input='Chassis Intru'
SENSOR_CMD=$( echo "${input}" | tr -d "\n" | od -An -t x1  | sed 's/[ ]/&0x/g' )
CMD_LENGTH=$( echo ${SENSOR_CMD} | wc -w )

ipmitool -H ${IP} -U ${USER} -P ${PASSWD} raw ${OEM_RAW_CMD} ${CMD_LENGTH} ${SENSOR_CMD}

