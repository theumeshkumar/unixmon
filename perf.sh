#prerequisits systat bc
HOST=$(hostname)
cpu_sle{

CPU=$(sar 1 2 | grep Average| awk '{ print $8 }')
BCPU=$(echo "100 - $CPU" | bc)
echo "$HOST : cpu : $BCPU % used" >> /tmp/perf.log

}


mem_sle{

UNIT=$(cat /proc/meminfo | grep -i MemTotal| awk '{ print $3}')
MTOTAL=$(cat /proc/meminfo | grep -i MemTotal| awk '{ print $2}')
MAVL=$(cat /proc/meminfo | grep -i MemAvailable| awk '{ print $2}')
MUTIL=$(echo " $MAVL * 100 / $MTOTAL " | bc)

STOTAL=$(cat /proc/meminfo | grep -i SwapTotal| awk '{ print $2}')
SAVL=$(cat /proc/meminfo | grep -i SwapFree| awk '{ print $2}')
SUTIL=$(echo " $SAVL * 100 / $STOTAL " | bc)

echo "$HOST : mem : $MUTIL % used, swap $SUTIL % used >>  /tmp/perf.log

}


fs_sle{

df -k | awk '{x=$5;sub ("%","",x)}x>75' | grep -v Available| awk '{ $HOST : fs : $6 : $5 used}'


}