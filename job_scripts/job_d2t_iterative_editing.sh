#!/bin/bash
#SBATCH --job-name=gpu_train
#SBATCH --account=Project_2003138
#SBATCH --partition=gpu
#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=8000
#SBATCH --gres=gpu:v100:1
#SBATCH --mail-type=BEGIN,FAIL,END

module load python-data/3.7.6-1
module load tensorflow/1.15-hvd
module load pytorch/1.6
srun ./run.sh webnlg
