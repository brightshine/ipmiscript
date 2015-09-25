#                                                                                                                                                                                                       [1554/1864]
# Given BMC IP, use ipmi raw 0x30 0x03 to clear chassis status

USER='ADMIN'
PASSWD='ADMIN'
OEM_RAW_CMD='0x30 0x03 '

echo "$#"
if [  $# -lt 1 ]; then
        echo " Usage : $0 IP "
        exit 1
fi

IP=$1

ipmitool -H ${IP} -U ${USER} -P ${PASSWD} raw ${OEM_RAW_CMD}

[ $? -eq 0 ] && echo "success" || echo "failed"

