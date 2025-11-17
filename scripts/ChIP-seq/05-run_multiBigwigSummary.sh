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
bed_1=/home/aa7013/annotations/O-tipulae/oscheius_tipulae.PRJNA644888.WBPS16.protein-coding.TSS_250bp_flank.bed 
bed_2=/home/aa7013/annotations/O-tipulae/oscheius_tipulae.PRJNA644888.WBPS16.annotations_protein-coding.bed
bed_3=/home/aa7013/annotations/O-tipulae/oscheius_tipulae.PRJNA644888.WBPS16.annotations_intergenic.bed
suff_1=TSS_250bp_flank
suff_2=gene_body
suff_3=intergenic
out_dir=/scratch/aa7013/ChIP_EVO2024_CEW1/bw_summary

mkdir -p bw_summary

#echo "...TSS"
#for i in "$in_dir"/*AA74*.bw
#do
#filename=$(basename "$i" .bw)
#echo "file: $i"
#multiBigwigSummary BED-file \
#	-b "$i" \
#	--BED ${bed_1} \
#	-o ${out_dir}/${filename}_${suff_1}.npz \
#	-p 1 \
#	--outRawCounts ${out_dir}/${filename}_${suff_1}.tab
#echo ...done
#done

#echo "...gene body"
#for i in "$in_dir"/*AA74*.bw
#do
#filename=$(basename "$i" .bw)
#echo "file: $i"
#multiBigwigSummary BED-file \
#        -b "$i" \
#        --BED ${bed_2} \
#        -o ${out_dir}/${filename}_${suff_2}.npz \
#        -p 1 \
#        --outRawCounts ${out_dir}/${filename}_${suff_2}.tab
#echo ...done
#done

echo "...intergenic"
for i in "$in_dir"/*ratio*.bw
do
filename=$(basename "$i" .bw)
echo "file: $i"
echo "file $bed_3"
multiBigwigSummary BED-file \
        -b "$i" \
        --BED ${bed_3} \
        -o ${out_dir}/${filename}_${suff_3}.npz \
        -p 1 \
        --outRawCounts ${out_dir}/${filename}_${suff_3}.tab
echo ...done
done

rm ${out_dir}/*npz

echo "...run complete"
