msa=MSA-local_OG0001775 # multiple sequence alignment (MSA) file is the input
proj=out_rhabditids_18/SDC-1 # run directory

# enter run directory
cd ./${proj}

# run iqtree
../../iqtree-2.2.0-Linux/bin/iqtree2 -s ./${msa}.fasta \
    --seqtype AA \ # the sequences are amino acids
    -m MFP \ # run ModelFinder and choose appropriate model (see iqtree documentation)
    -B 1000 \ # the number of bootstrap replicates
    --prefix ${msa}

echo done
