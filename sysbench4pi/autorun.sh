#!/bin/bash
for each in 1 2 3 4 5 6 8 16 32 64; do sysbench --test=cpu --cpu-max-prime=60000 --num-threads=$each run; done
