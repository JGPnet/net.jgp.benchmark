#!/bin/bash

# Loop
for each in 1 2 3 4 5 6 8 16 32 64
do 
  echo "--------------------------------------------------------------------------------"
  echo Running $each thread\(s\)...
  for rec in [1..3]
  do
    echo "Test #$rec (threads: $each)"
    sysbench --test=cpu --cpu-max-prime=200 --num-threads=$each run
    sleep 20s
  done
done
