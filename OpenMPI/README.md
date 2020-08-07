## Folder description:

Here we can find 5 different files and a subfolders which contain their own description files. mxn-mpi.sbatch is our shell and slurm file which manage the reserving resourse part on Guane. mpi_mxm.c is our modification of a matrix mutiplication program. comparing.txt is a file in which they will show the comparison of times for three different experiences, all made in GUANE-1: run time of the solution in serial (original file), run time in time of the solution in OpenMP and the run time of the solution with message passing. output_mxn_code_mpi.txt is our outcome after executing the implementation code in GUANE with n1=45000, n2=45000 and n3=45000 as arguments. 

## Local execution steps:

Firstly, we must launch our compiler using the gcc instruction as follow below:

- mpicc -np xxx mpi_mxm.c -o mpi_mxm

Where:

* mpicc-> Our MPIcompiler related to C language.
* -np xxx ->A flag provided to fixe the number of proccess.
* mpi_mxm -> An output once we compile correctly our code. 
* mpi_mxm.c-> An implementation using mpi directives.

Lastly, once we get our outcome, it's just to execute it by typing the next line in the relative path: 
mpirun ./mpi_mxm 45000 45000 45000


## Guane execution steps:  

To execute properly our code in a Guane node we must log in first, once inside the front-end, we gotta enter to a guane node assigned randomly by typing "ssh guane".

All settings are contained in the sbatch file so it's just to launch it by typing "sbatch mxn-mpi.sbatch". It's extremely necessary to note that we have to modify the .sbatch file at the very end since according to the scaled part,we can change it by changing the arguments, some examples of this are: "mpirun ./mpi_mxm 100 100 100","mpirun ./mpi_mxm 200 200 200", "mpirun ./mpi_mxm 10000 10000 10000", "mpirun ./mpi_mxm 30000 30000 30000"

## Future improvements: 

We will be able to improve the Pragma regions by using numerical methods or algebra techniques. For more information visit the next [wikipedia's link](https://en.wikipedia.org/wiki/Matrix_multiplication_algorithm).

## Additional information:

We used as tutorial guide the [OpenMPI online page](https://computing.llnl.gov/tutorials/mpi/). This source was truly important at the moment of building our implementation in OpenMPI. 

For correctly execute the implementation code with the resources nedeed in guane , we used the slurm guide provided by this [link](https://slurm.schedmd.com/documentation.html)
