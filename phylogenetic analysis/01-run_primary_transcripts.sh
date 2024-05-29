# extract the longest transcript variant per gene
for f in *fa* ; do python /scratch/aa7013/OrthoFinder/tools/primary_transcript.py $f ; done
