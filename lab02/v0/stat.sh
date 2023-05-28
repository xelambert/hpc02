#!/bin/bash
#PBS -N Kushnir_mpi_stats
#PBS -l walltime=00:01:00
#PBS -l nodes=1:ppn=1

cd #PBS_O_WORKDIR
sleep 10

for i in {1..100}
do
	for j in {0..3}
	do
		cat ./out/task_$i/1/rank.$j/stdout >> ./out_stat
	done
done

cat ./out_stat >> stat_out.out
echo "Statistics:" >> stat_out.out

for k in {1..10}
do	
	echo "s$k = `cat ./stat_out.out | grep -o "s\"$k\".cluster" | wc -l`" >> stat_out.out
done