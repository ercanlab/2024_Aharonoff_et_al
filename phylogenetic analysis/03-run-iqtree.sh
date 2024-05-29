#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --time=2:00:00
#SBATCH --mem=32GB
#SBATCH --job-name=iqtree
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=aa7013@nyu.edu

module purge

msa=MSA-local_OG0001299

cd ./rhabditids-10

../iqtree-2.2.0-Linux/bin/iqtree2 -s ./${msa}.fasta \
    --seqtype AA \
    -m MFP \
    -B 1000 \
    --prefix ${msa}

echo done
