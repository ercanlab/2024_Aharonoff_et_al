In this directory is an example run for Haemonchus contortus (ISE)

#

01_run-nextflow.sh will take...

samplesheet.csv
nextflow.config

and run the nf-core rna-seq (version 3.12.0) pipeline (see https://nf-co.re/rnaseq/3.14.0/). The workflow of the pipeline under 
our parameters is: catenate technical replicates, infer strandedness with Salmon (version 1.10.1), asses the sequencing quality 
with FastQC (version 0.11.9), remove rRNA reads with sortMeRNA (version 4.3.4), align with STAR (version 2.7.10a), quantify with Salmon 
(version 1.10.1), and summarize counts and TPM quantification at the gene level with tximport (version 1.16.0). It will spit out...

ISE_A_salmon.merged.gene_counts.tsv (counts per gene)
ISE_A_salmon.merged.gene_tpm.tsv (tmp per gene)

#

02_DESeq_master_ISE.Rmd will take the 

ISE_A_salmon.merged.gene_counts.tsv
ISE_A_salmon.merged.gene_tpm.tsv
A bed file of gene annotations (example files provide in directory)

and run DESeq2, make plots, as well as check for statistical significance. This script (as well as similar scripts for other species) was 
used to make the plots in Figures 4B, 4C, 4E, S11, S12, S13, and S14. I basically just copy pasted this script for each species and modified 
as needed (e.g., to include the PAR for B. malayi). It will also spit out...

hco_res.data.pc.rmLow.tsv (DESeq2 results for all expressed genes - Figure 4A, top)
hco_res.data.pc.rmLow.rmG.tsv (DESeq2 results for soma enriched expressed genes - Figure 4A, bottom)
ISE_pvalues.vs.tsv (results of one versus rest Wilcox Rank Sum test for each chromosome)

#

03_Log2_plot_all_species.Rmd catenates the *rmLow.tsv and *rmLow.rmG.tsv files for each species to make Figure 4A. 

#

04_pvals-vs_master.Rmd catenates the *pvalues.vs.tsv for each species to make the one vs rest plot shown in Figure 4D.
