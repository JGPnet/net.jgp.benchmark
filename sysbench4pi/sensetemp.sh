#!/bin/bash
while true
do
  echo -n `date +%s`";"
  vcgencmd measure_temp | awk -F= ' { print $2 }'| awk -F\' ' { print $1 }'
  sync
  sleep 2s
done
