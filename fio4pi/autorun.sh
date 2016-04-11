#!/bin/bash
echo "Drive id ... " $1
echo "Platform ... " $2
echo "Version .... " `uname -r`
if [ -z $1 ]
then
  echo "Must provide drive id"
  exit 1
fi
if [ -z $2 ]
then
  echo "Must provide platform id (rpi2, rpi3)"
  exit 1
fi

mkdir -p /tmp/fio-testing/data 2>/dev/null

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

