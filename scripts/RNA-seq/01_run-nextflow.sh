#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16GB
#SBATCH --time=72:00:00
#SBATCH --job-name=nextflow
#SBATCH --output=slurm_%j.out
#SBATCH --mail-user=aa7013@nyu.edu
#SBATCH --mail-type=END

module load nextflow/23.04.1

out=./out_adults

nextflow run nf-core/rnaseq \
    -profile singularity \
    --input ./samplesheet.csv \
    -c ./nextflow.config \
    --remove_ribo_rna \
    --save_non_ribo_reads \
    --save_reference \
    --skip_umi_extract \
    --skip_trimming \
    --skip_bbsplit_reads \
    --skip_biotype_qc \
    --skip_stringtie \
    --skip_deseq2_qc \
    --outdir ${out}

echo done
