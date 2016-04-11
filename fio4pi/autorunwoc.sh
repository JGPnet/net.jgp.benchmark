#!/bin/bash

plat=rpi$2

echo "Drive id ... " $1
echo "Platform ... " $plat
echo "Version .... " `uname -r`
if [ -z $1 ]
then
  echo "Must provide drive id"
  exit 1
fi
if [ -z $2 ]
then
  echo "Must provide platform id (2, 3)"
  exit 1
fi

mkdir -p /tmp/fio-testing/data 2>/dev/null

for testid in 1r 1w 2r 2w 4r 4w 6r 8r
do
  echo $testid
done

exit 0

echo "------------------------------------------------------------------------------------------"
echo "1 reader..."
/usr/local/bin/fio random-1reader-test.fio > results/$1-1r-$2-raspbian_v`uname -r`.log
cat results/$1-1r-$2-raspbian_v`uname -r`.log
echo "------------------------------------------------------------------------------------------"
echo "1 writer..."
/usr/local/bin/fio random-1writer-test.fio > results/$1-1w-$2-raspbian_v`uname -r`.log
cat results/$1-1w-$2-raspbian_v`uname -r`.log
echo "------------------------------------------------------------------------------------------"
echo "2 readers..."
/usr/local/bin/fio random-2readers-test.fio > results/$1-2r-$2-raspbian_v`uname -r`.log
cat results/$1-2r-$2-raspbian_v`uname -r`.log
echo "------------------------------------------------------------------------------------------"
echo "2 writers..."
/usr/local/bin/fio random-2writers-test.fio > results/$1-2w-$2-raspbian_v`uname -r`.log
cat results/$1-2w-$2-raspbian_v`uname -r`.log
echo "------------------------------------------------------------------------------------------"
echo "4 readers..."
/usr/local/bin/fio random-4readers-test.fio > results/$1-4r-$2-raspbian_v`uname -r`.log
cat results/$1-4r-$2-raspbian_v`uname -r`.log
echo "------------------------------------------------------------------------------------------"
echo "4 writers..."
/usr/local/bin/fio random-4writers-test.fio > results/$1-4w-$2-raspbian_v`uname -r`.log
cat results/$1-4w-$2-raspbian_v`uname -r`.log
echo "------------------------------------------------------------------------------------------"
echo "6 readers..."
/usr/local/bin/fio random-6readers-test.fio > results/$1-6r-$2-raspbian_v`uname -r`.log
cat results/$1-6r-$2-raspbian_v`uname -r`.log
echo "------------------------------------------------------------------------------------------"
echo "8 readers..."
/usr/local/bin/fio random-8readers-test.fio > results/$1-8r-$2-raspbian_v`uname -r`.log
cat results/$1-8r-$2-raspbian_v`uname -r`.log

