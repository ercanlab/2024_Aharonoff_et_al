# make a directory with all of the fasta files you want to run

# enter directory
cd /path/to/directory

# extract the longest transcript variant per gene with the primary_transcript.py script provided by OrthoFinder (version 2.5.4)
for f in *fa* ; do python /path/to/primary_transcript.py $f ; done

# output is a fasta file for each input. Run OrthoFinder on all outputs with the next script.
