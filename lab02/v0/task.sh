#!/bin/bash
#PBS -N Kushnir_mpi
#PBS -l walltime=00:02:00
#PBS -l nodes=2:ppn=2
#PBS -o /mnt/work/$USER/ -e /mnt/work/$USER/

cd /mnt/work/$USER

ml icc
ml openmpi
mpirun -output-filename "./out/task_$arg1" $PBS_O_WORKDIR/hello

if [[! -d "$PBS_O_WORKDIR/out"]]
then
mkdir $PBS_O_WORKDIR/out
fi

cp -R ./out/task_$arg1 $PBS_O_WORKDIR/out/task_$arg1