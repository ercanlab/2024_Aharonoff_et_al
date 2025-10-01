# create variables
proj=rhabditids_18 # the project name to be used in generating the run directories (also the project name for OrthoFinder results)
prot=SDC-1 # the protein of interest to be used in generating the run directories
fasta=OG0001775 # this is the name of the orthogroup with the orthologs (you find this by looking at the OrthoFinder results)
date=Nov06 # the date OrthoFinder was run, which is how they name their directories

# create run directories
mkdir -p out_${proj}
mkdir -p out_${proj}/${prot}

# enter run directory
cd ./out_${proj}/${prot}

# copy fasta file with orthogroup sequences to run  directory
cp -a /scratch/aa7013/OrthoFinder/${proj}/primary_transcripts/OrthoFinder/Results_${date}/Orthogroup_Sequences/${fasta}.fa ./

# run mafft
mafft --localpair --maxiterate 1000 ./${fasta}.fa > MSA-local_${fasta}.fasta

# move log file into run directory
mv ../../slurm_* ./

echo done

# Inspect MSA with an MSA viewer. For example: https://www.ncbi.nlm.nih.gov/projects/msaviewer/
