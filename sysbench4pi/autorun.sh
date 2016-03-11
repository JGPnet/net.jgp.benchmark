#!/bin/bash
for each in 1 2 4 8 16 32 64; do sysbench --test=cpu --cpu-max-prime=20000 --num-threads=$each run; done
