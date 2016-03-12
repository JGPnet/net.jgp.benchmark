#!/bin/bash

platform=`cat /proc/cmdline | awk -v RS=" " -F= '/boardrev/ { print $2 }'`
version=`uname -r`
echo "Platform ...... " $platform
echo "OS Version .... " $version

rm results/cpu-$platform-$version.log 2 > /dev/null

./sensetemp.sh > results/cputemp-$platform-$version.log &

# Loop
for thread in 1 2 3 4 5 6 8 16 32 64
do 
  echo "--------------------------------------------------------------------------------"
  echo Running $thread thread\(s\)...
  for rec in {1..3}
  do
    echo "Test #$rec (threads: $thread)"
    echo `date +%s`";--------------------------------------------------------------------------------" >> results/cputemp-$platform-$version.log
    echo `date +%s`";$thread-$rec" >> results/cputemp-$platform-$version.log
    sync
    sysbench --test=cpu --cpu-max-prime=200 --num-threads=$thread run > results/cpu-$platform-$version-$thread-$rec.log
    cat results/cpu-$platform-$version-$thread-$rec.log
    echo "--------------------------------------------------------------------------------" >> results/cpu-$platform-$version.log
    cat results/cpu-$platform-$version-$thread-$rec.log >> results/cpu-$platform-$version.log
    rm results/cpu-$platform-$version-$thread-$rec.log
    echo `date +%s`";--------------------------------------------------------------------------------" >> results/cputemp-$platform-$version.log
    sync
    sleep 5s
  done
done

echo [done]
