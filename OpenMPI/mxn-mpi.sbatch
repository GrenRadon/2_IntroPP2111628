#!/bin/bash

#SBATCH --partition=normal
#SBATCH --job-name=predador
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-node=1
#SBATCH --output=salida_predador_%j.out
#SBATCH --error=errores_predador_%j.err

module load devtools/gcc/6.2.0

if [ -n "$SLURM_CPUS_PER_TASK" ]; then
  omp_threads=$SLURM_CPUS_PER_TASK
else
  omp_threads=1
fi

export OMP_NUM_THREADS=$omp_threads

./predador

