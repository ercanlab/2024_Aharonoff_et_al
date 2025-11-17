#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=24:00:00
#SBATCH --job-name=chip
#SBATCH --output=slurm_%j.out
#SBATCH --mail-user=aa7013@nyu.edu
#SBATCH --mail-type=END

echo ...load modules
module purge
module load bowtie2/2.4.2
module load samtools/intel/1.11
module load deeptools/3.5.0

echo ...set variables
fasta_dir=/home/aa7013/genomes/O-tipulae # reference genome directory
work_dir=/scratch/aa7013/ChIP_EVO2024_CEW1 # working directory
mito=M # name of mitochondrial genome (eg., chrM)

# fastq files
a=(\
	"H4K20me1_ab8051_CEW1_L-24hrs_ext790_AA89_input_AA96" \
        "H3K4me3_ab8580_CEW1_L-24hrs_ext790_AA90_input_AA96" \
        "IgG_ab46540_CEW1_L-24hrs_ext790_AA91_input_AA96" \
	"input_AA96_CEW1_L-24hrs_ext790")

# reference genome
a3=(\
	"oscheius_tipulae.PRJNA644888.WBPS16.genomic")

##  do not edit below this line unless necessary

cd ${work_dir}

mkdir -p temp
mkdir -p coverage

for j in ${a3[@]}
do \
for i in ${a[@]}
do \

cd ${work_dir}

echo ...align
bowtie2 -p8 -x ${fasta_dir}/"$j" \
       -U ./fastq/"$i".fastq.gz -S ./temp/"$i"_"$j".sam

cd ${work_dir}/temp

echo ...samtools
samtools view -bS "$i"_"$j".sam > "$i"_"$j".bam

samtools sort -o "$i"_"$j"_sorted.bam "$i"_"$j".bam

samtools index "$i"_"$j"_sorted.bam

echo ...coverage
bamCoverage -b "$i"_"$j"_sorted.bam \
        -o "$i"_"$j".bw \
        --binSize 10 \
        --minMappingQuality 20 \
        --extendReads 200 \
        --outFileFormat bigwig \
        --ignoreDuplicates \
        --normalizeUsing CPM \
        --exactScaling \
        --ignoreForNormalization ${mito}

mv "$i"_"$j".bw ${work_dir}/coverage/.

done
done

echo done
