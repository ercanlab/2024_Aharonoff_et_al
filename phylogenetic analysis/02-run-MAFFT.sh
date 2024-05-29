fasta=OG0001299

mafft --localpair --maxiterate 1000 ./${fasta}.fa > MSA-local_${fasta}.fasta
