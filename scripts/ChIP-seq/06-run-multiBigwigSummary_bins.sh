#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=00:30:00
#SBATCH --mem=1GB
#SBATCH --job-name=mbwsum
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=aa7013@nyu.edu

echo ...load modules
module purge
module load deeptools/3.5.0

echo ...set variables
in_dir=/scratch/aa7013/ChIP_EVO2024_CEW1/coverage
suff=bins
out_dir=/scratch/aa7013/ChIP_EVO2024_CEW1/bw_summary

mkdir -p ./bw_summary

echo "...bins"
for i in "$in_dir"/*ratio*.bw
do
filename=$(basename "$i" .bw)
echo "in: $i"
multiBigwigSummary bins \
        -b "$i" \
        -o ${out_dir}/${filename}_${suff}.npz \
        -p 1 \
        --outRawCounts ${out_dir}/${filename}_${suff}.tab
echo ...done
done

rm ${out_dir}/*npz

echo "...run complete"
