#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --mem=64GB
#SBATCH --job-name=OF8
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=aa7013@nyu.edu

module purge

./orthofinder -f ./rhabditids_11/primary_transcripts

echo done
