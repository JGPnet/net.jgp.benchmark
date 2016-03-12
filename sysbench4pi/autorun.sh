#!/bin/bash

# Loop
for each in 1 2 3 4 5 6 8 16 32 64
do 
  echo "--------------------------------------------------------------------------------"
  echo Running $each thread\(s\)...
  sysbench --test=cpu --cpu-max-prime=60000 --num-threads=$each run
done
