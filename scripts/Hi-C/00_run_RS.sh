#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:60:00
#SBATCH --mem=8GB
#SBATCH --job-name=cr_DpnII
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=aa7013@nyu.edu

module purge
module load python/intel/3.8.6

# python /path_to/generate_site_positions.py 'Restrction Site ID' 'Genome ID' /path_to/reference_genome.fa

python /scratch/cgsb/ercan/Avrami/juicer/restriction_sites/generate_site_positions_Arima2.py 'DpnII' 'PX506' /scratch/cgsb/ercan/Avrami/juicer/references/GCF_010183535.1_CRPX506_genomic_chr-only.fna

echo done