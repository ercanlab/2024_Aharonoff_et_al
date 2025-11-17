#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:10:00
#SBATCH --mem=2GB
#SBATCH --job-name=track
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=aa7013@nyu.edu

base_dir=/scratch/aa7013 # base directory
working_dir=ChIP_EVO2024_CEW1 # working directory
reg="X:6,656,756-6,717,416" # region to plot
chrom=X # chromosome
outName=H4K20me1_H3K4me3_IgG_all-reps_subset_CEW1_L-24hrs_oscheius_tipulae.PRJNA644888.WBPS16.genomic_inputsubtract # out file name

mkdir -p tracks

/scratch/work/public/singularity/run-hicexplorer-3.6.bash hicPlotTADs \
    --tracks ${base_dir}/${working_dir}/track.ini \
    --region ${reg} \
    --dpi 300 \
    --fontSize 17 \
    --outFileName ${base_dir}/${working_dir}/tracks/track_${chrom}_${outName}.pdf

echo done
