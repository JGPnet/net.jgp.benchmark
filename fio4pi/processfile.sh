#!/bin/bash

if [ -z $1 ]
then
  echo "Please specify drive to process"
  exit 1
fi

if [ -z $2 ]
then
  echo "Please specify platform"
  exit 1
fi

files=results/$1-*-$2*
for rf in `ls $files` 
do 
  echo "Processing file ..... " $rf

  nbpr=`cat $rf | grep  "Starting " | awk '{print $2}'`
  echo "Number of process ... " $nbpr

  cat $rf | grep -v "maxt" | grep  ": io=" | awk -F= '{print $2}' | awk -F[K,M] '{print $1}'
  cat $rf | grep -v "maxt" | grep  ": io=" | awk -Fbw= '{print $2}' | awk -FK '{print $1}'
  cat $rf | grep -v "maxt" | grep  ": io=" | awk -Fiops= '{print $2}' | awk -F, '{print $1}'
  cat $rf | grep -v "maxt" | grep  ": io=" | awk -Frunt= '{print $2}' | awk -Fm '{print $1}'
  cat $rf | grep  "sys=" | awk -Fsys= '{print $2}' | awk -F, '{print $1}'
done
