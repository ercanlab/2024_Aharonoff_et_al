In this directory is an example run with O. tipulae (CEW1)

#

01-run_ChIP_aligh.sh takes one or more fastq files and a reference genome, and produces a bam and bigwig file. 

02-run_bigwigCompare.sh takes compares two bigwig files and finds the ratio or difference in reads per bin. In this case, we are subtracting or dividing sample treated with antibody by the input (not treated with antibody). The output of this script is used in all downstream steps.

03-run_bigwigMerge.sh takes will merge replicates.

04-pyGenomeTracks.sh takes on or more bigwig files and a track.ini configuration file, and plots one or more tracks at a specificed location. This script was used to make the tracks in Figures 5A, 5B, and S15.

05-run_multiBigwigSummary.sh takes one a bigwig file, and a bed file for transcription start sites (TSS), protein coding genes, and intergenic locations, and computes the average score at each genomic region as specificed by the bed file (e.g., at each TSS) in the bigwig file. The output is a tab delimeted file with four columns: chromosome, start, end, and score. 

06-run_multiBigwigSummary_bins.sh is similar to 05-run_multiBigwigSummary.sh, but computes the average score for each 10 kb bin along the genome.

07-zscores_master_CEW1.Rmd takes the outputs of 05-run_multiBigwigSummary.sh and 06-run_multiBigwigSummary_bins.sh and makes the violin plots in Figures 5C, S16, S17, and S18. It also outputs a tab delimited file with the following columns: chromosome, start, end score, log2score, and zscore. This is done for H4K20me1, H3K4me3, and IgG at TSS, gene bodies, intergenic regions, and at 10 kb bins.

08-H4K20me1_stats bins.Rmd takes the tab delimted file output by 07-zscores_master_CEW1.Rmd and runs the one-vs-rest statistic described in the paper for H4K20me1 at 10 kb bins. Similar files were used for other antibodies and regions. It outputs the plots in Figure 5D, S16, S17, and S18.

