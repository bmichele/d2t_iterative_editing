#!/bin/bash
#SBATCH --job-name=cpu_train
#SBATCH --account=Project_2003138
#SBATCH --partition=small
#SBATCH --time=70:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=1600
#SBATCH --mail-type=BEGIN,FAIL,END

module load python-data/3.7.6-1
srun ./run.sh webnlg
