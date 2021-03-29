#!/bin/bash -login
#SBATCH -p bmm # partition, or queue, to assign to
#SBATCH -J dogCancer # name for job
#SBATCH -N 1                   # one "node", or computer
#SBATCH -n 1                   # one task for this node
#SBATCH -c 16                  # cores per task
#SBATCH -t 2-0                 # ask for 5 days
#SBATCH --mem=150000             # memory (30,000 mb = 30gb)
#SBATCH --mail-type=ALL
#SBATCH --mail-user=abhijna.anand@gmail.com

# initialize conda
. ~/miniconda3/etc/profile.d/conda.sh

# activate your desired conda environment
conda activate snakemake


# go to the directory you ran 'sbatch' in, OR just hardcode it...
#cd $SLURM_SUBMIT_DIR
cd ~/dogCancer/snakemake_pipeline

# run the snakemake!
snakemake --cores all --use-conda

# print out various information about the job
env | grep SLURM            # Print out values of the current jobs SLURM environment variables

scontrol show job ${SLURM_JOB_ID}     # Print out final statistics about resource uses before job exits

sstat --format 'JobID,MaxRSS,AveCPU' -P ${SLURM_JOB_ID}.batch




