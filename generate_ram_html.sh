#!/bin/bash
OUTPUT=fs.html
echo "<!DOCTYPE HTML>" >> $OUTPUT
echo "<HTML>" >> $OUTPUT
echo "<HEAD>" >> $OUTPUT
echo "<TITLE>ram utilization</TITLE>" >> $OUTPUT
echo "</HEAD>" >> $OUTPUT
echo "<body>" >> $OUTPUT
cat hc.log | grep ram >> $OUTPUT
echo "</body>" >> $OUTPUT
echo "</HTML>" >> $OUTPUT