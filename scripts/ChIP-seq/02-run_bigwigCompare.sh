#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=ratsub
#SBATCH --output=slurm_%j.out
#SBATCH --mail-type=END
#SBATCH --mail-user=aa7013@nyu.edu

echo ...load modules
module purge
module load deeptools/3.5.0

echo ...set variables
work_dir=/scratch/aa7013/ChIP_EVO2024_CEW1/coverage
input_id=AA77
genome=oscheius_tipulae.PRJNA644888.WBPS16.genomic
input_fileName=input_AA77_CEW1_L-24hrs_ext649_oscheius_tipulae.PRJNA644888.WBPS16.genomic

## name format
# {target}_{antibody}_{strain}_{stage}_{ext#}_{subID}

declare -a query=(\
	"H4K20me1_ab9051_CEW1_L-24hrs_ext649_AA73" \
	"H3K4me3_ab8580_CEW1_L-24hrs_ext649_AA74" \
	"IgG_ab46540_CEW1_L-24hrs_ext649_AA75")

echo ...run bigwigCompare
for i in "${query[@]}"
do

cd ${work_dir}
echo ...ratio
bigwigCompare -b1 ${work_dir}/"$i"_input_${input_id}_${genome}.bw \
        -b2 ${input_fileName}.bw \
        --operation "ratio" \
        --binSize 10 \
        -o "$i"_input_${input_id}_${genome}_inputratio.bw
echo ...done

echo ...subtract
bigwigCompare -b1 ${work_dir}/"$i"_input_${input_id}_${genome}.bw \
        -b2 ${input_fileName}.bw \
        --operation "subtract" \
        --binSize 10 \
        -o "$i"_input_${input_id}_${genome}_inputsubtract.bw
echo ...done

done

echo ...completed
