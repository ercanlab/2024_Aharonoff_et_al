#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --mem=16GB
#SBATCH --job-name=mergebw
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=aa7013@nyu.edu

echo ...load modules
module purge
module load kent/385

echo ...set variables
in_dir=/scratch/aa7013/ChIP_EVO2024_CEW1/coverage
bw_1=IgG_ab46540_CEW1_L-24hrs_ext649_AA75_input_AA77_oscheius_tipulae.PRJNA644888.WBPS16.genomic_inputratio.bw
bw_2=IgG_ab46540_CEW1_L-24hrs_ext759_AA84_input_AA85_oscheius_tipulae.PRJNA644888.WBPS16.genomic_inputratio.bw
out_dir=/scratch/aa7013/ChIP_EVO2024_CEW1/coverage
outName=IgG_ab46540_CEW1_L-24hrs_merged_AA75_AA84_oscheius_tipulae.PRJNA644888.WBPS16.genomic_inputratio
chrom_file=/home/aa7013/genomes/O-tipulae/oscheius_tipulae.PRJNA644888.WBPS16.genomic.chrom.sizes

mkdir -p ${out_dir}/bedGraph

echo "file 1: ${bw_1}"
echo "file 2: ${bw_2}"

echo ...merge 
bigWigMerge ${in_dir}/${bw_1} ${in_dir}/${bw_2} ${out_dir}/bedGraph/${outName}.bedGraph
echo ...done

echo ...bedGraph to bigwig
bedGraphToBigWig ${out_dir}/bedGraph/${outName}.bedGraph ${chrom_file} ${out_dir}/${outName}.bw
echo ...done

echo "out: ${outName}.bw"

echo ...run complete
