#!/bin/bash

#SBATCH --partition=guane_24_cores
#SBATCH --job-name=MPI_mxm
#SBATCH --nodes=2
#SBATCH --ntasks=4 #This option advises the Slurm controller that
  #job steps run within the allocation will launch a maximum of number
  #tasks and to provide for sufficient resources.
  #If used with the --ntasks option, the --ntasks option will take precedence
  #and the --ntasks-per-node will be treated as a maximum count of tasks per node.
#SBATCH --cpus-per-task=8 #Advise the Slurm controller that ensuing job steps will
  #require ncpus number of processors per task.
#SBATCH --ntasks-per-node=2
#SBATCH --output=salida_MPI_MXM_%j.out
#SBATCH --error=errores_MPI_MXM_%j.err
#SBATCH -D /home/class/icp_2020_1/jevillamizarp/OpenMPI/2_IntroPP2111628/OpenMPI #Directory where we have our project


module load devtools/gcc/6.2.0
module load devtools/mpi/openmpi/3.1.4


if [ -f mpi_mxm ]; then
        rm -r mpi_mxm
fi
mpicc mpi_mxm.c -o mpi_mxm

if [ -n "$SLURM_CPUS_PER_TASK" ]; then
  omp_threads=$SLURM_CPUS_PER_TASK
else
  omp_threads=1
fi

export OMP_NUM_THREADS=$omp_threads

mpirun ./mpi_mxm 100 100 100
