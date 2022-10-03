#!/bin/sh
path=$(pwd)/..
cd $path/Geth/core/vm
go test -bench BenchmarkPrecompiled -benchtime 5s -timeout 30m 1> $path/benchmarking/rawdata/geth-$(date +'%y%m%d-%H%M%S')-ydh.txt 2>&1
echo "benchmarking is done."
