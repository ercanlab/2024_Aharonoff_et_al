#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --time=00:30:00
#SBATCH --mem=32GB
#SBATCH --job-name=mafft
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=aa7013@nyu.edu

module purge
module load mafft/intel/7.475

fasta=OG0001299

cd ./rhabditids-10

mafft --localpair --maxiterate 1000 ./${fasta}.fa > MSA-local_${fasta}.fasta

echo done
