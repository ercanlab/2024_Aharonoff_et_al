msa=MSA-local_OG0001299

../iqtree-2.2.0-Linux/bin/iqtree2 -s ./${msa}.fasta \
    --seqtype AA \
    -m MFP \
    -B 1000 \
    --prefix ${msa}
