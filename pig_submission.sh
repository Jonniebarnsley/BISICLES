#!/bin/bash
#SBATCH --job-name=pig_test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=36
#SBATCH --cpus-per-task=1
#SBATCH --time=00:19:00
#SBATCH --account=n02-LDNDTP1
#SBATCH --partition=standard
#SBATCH --qos=short

module load PrgEnv-gnu
module load gcc
module load cray-hdf5-parallel
module load cray-netcdf-hdf5parallel
module load cray-python
module load petsc

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cray/pe/python/3.8.5.0/lib

srun --hint=nomultithread --distribution=block:block /work/n02/n02/jonnieb/BISICLES_trunk-070721/code/exec2D/driver2d.Linux.64.CC.ftn.DEBUG.OPT.MPI.GNU.ex inputs.pigv5.1km.ssa.l0 > sout.0 2>err.0