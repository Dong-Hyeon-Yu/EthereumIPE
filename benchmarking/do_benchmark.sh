#!/bin/sh
cd ~/dev/etherium/Geth/core/vm
go test -bench BenchmarkPrecompiled -benchtime 10s 1> ~/dev/etherium/benchmarking/rawdata/geth-$(date +'%y%m%d')-ydh.txt 2>&1
echo "benchmarking is done."
