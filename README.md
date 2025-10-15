This repository contains scripts used in 

Aharonoff, A., Kim, J., Washington, A., & Ercan, S. Parallel evolution of X chromosome specific SMC complexes in two nematode lineages. Preprint at https://doi.org/10.1101/2024.05.21.595224

as well as a rescaffolded genome for Pristionchus pacificus (PS312), lifted over annotations for protein coding genes, and detailed collection protocols for each species of worm used in this study.

**Update to P. pacificus chromosome scale assembly**  
We used the genome PRJNA12644 (WBPS16), and rescaffolded using YaHS (version 1.1) with our Hi-C data. YaHS placed pbcontig517 on the left arm of chromosome X (see Figure S4). Via manual curation in Juicebox Assembly Tools, we fixed several misjoins and inversions on chromosomes V and X (see Figure S4 in prepring). As it stands, we have provided the 6 chromosomes of the rescaffolded and curated genome. For the lifted over annotations, we provide a lift over of the protein coding genes only. We were able to lift all but 8 protein coding genes using the LiftOff (version 1.6.3). The genes that were not lifted over are provided in unmapped_features.txt. 

**Enter scripts directory for code used in this study**  
phylogenetic_analysis contains scripts used to generate trees in Figures 1C, S2, S3, and S10 as well as Figures 1B and 1C.  RNA-seq contains scripts used for Figures 4, and S11-S14.

**Detailed protocols for sample collection can be found in the sample_collection directory**

This page is a work in progress, if you don't see something, be patient, it will be up soon. 
