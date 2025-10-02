In this directory

01_run-nextflow RNA-seq will take a samplesheet.csv, nextflow.config, and fasta file(s), and run the nf-core rna-seq (version 3.12.0) 
pipeline (see https://nf-co.re/rnaseq/3.14.0/). The workflow of the pipeline under our parameters was as follows: catenate technical 
replicates, infer strandedness with Salmon (version 1.10.1), asses the sequencing quality with FastQC (version 0.11.9), remove rRNA 
reads with sortMeRNA (version 4.3.4), align with STAR (version 2.7.10a), quantify with Salmon (version 1.10.1), and summarize counts 
and TPM quantification at the gene level with tximport (version 1.16.0).

02_DESeq_master_ISE.Rmd will take the *_tpm.tsv and *_counts.tsv files from nf-core rna-seq, and a bed file of gene annotations, and run
DESeq2 as well as make some plots. This script was written for Haemonchus contortus (ISE), but can be used for any species with 
appropriate modifications (e.g., chromosome number). Thisspits out some violin plots and some tsv files for two scripts below. A script
like this (for a selected species) was used to make Figures 4B, 4C, 4E, S11, S12, S13, and S14. I basically just copy pasted this script 
for each species and modified as needed (e.g., to include the PAR for B. malayi).

03_Log2_plot_all_species.Rmd catenates the results (as *.tsv files) from the DESeq analysis for each species to make Figure 4A.

04_pvals-vs_master.Rmd catenates the statistical analysis done for each species in the DESeq script, and plots
the one vs rest shown in Figure 4D.
