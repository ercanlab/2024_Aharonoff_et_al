# In this directory

# 01_run-nextflow RNA-seq will take a samplesheet.csv, nextflow.config, and fasta file(s), and run the nf-core rna-seq (version 3.12.0) 
# pipeline (see https://nf-co.re/rnaseq/3.14.0/). The workflow of the pipeline under our parameters was as follows: catenate technical 
# replicates, infer strandedness with Salmon (version 1.10.1), asses the sequencing quality with FastQC (version 0.11.9), remove rRNA 
# reads with sortMeRNA (version 4.3.4), align with STAR (version 2.7.10a), quantify with Salmon (version 1.10.1), and summarize counts 
# and TPM quantification at the gene level with tximport (version 1.16.0).

# 02_DESeq_master_ISE.Rmd will take the *_tpm.tsv and *_counts.tsv files from nf-core rna-seq and run DESeq2. This script was 
# written for Haemonchus contortus (ISE), but can be used for any species with appropriate modifications (e.g., chromosome number).

# 03_
