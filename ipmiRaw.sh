#!/bin/sh
#
# Given BMC IP and sensor name, use ipmitool to get raw response
# Ex : ipmiRaw.sh 192.168.0.1 FAN1 => ipmitool -H ${IP} .....  raw 0x30 0x2D 4 0x46 0x41 0x4E 0x31


USER='ADMIN'
PASSWD='ADMIN'
OEM_RAW_CMD='0x30 0x2D '
IP=$1

shift
input=$@

SENSOR_CMD=$( echo "${input}" | tr -d "\n" | od -An -t x1  | sed 's/[ ]/&0x/g' )
CMD_LENGTH=$( echo ${SENSOR_CMD} | wc -w )

echo " Send ipmi raw '${OEM_RAW_CMD} ${CMD_LENGTH} ${SENSOR_CMD}' to ${IP} ... "
ipmitool -H ${IP} -U ${USER} -P ${PASSWD} raw ${OEM_RAW_CMD} ${CMD_LENGTH} ${SENSOR_CMD}

