#!/bin/bash
#PBS -N Kushnir_mpi_statisticss
#PBS -l walltime=00:01:00
#PBS -l nodes=1:ppn=1

cd #PBS_O_WORKDIR
sleep 10

for i in {1..100}
do
	for j in {0..3}
	do
		cat ./out/runTask_$i/1/rank.$j/stdout >> ./out_statistics
	done
done

cat ./out_statistics >> statistics_out.out
echo "Statistics:" >> statistics_out.out

for k in {1..10}
do	
	echo "s$k = `cat ./statistics_out.out | grep -o "s\"$k".cluster" | wc -l`" >> statistics_out.out
done