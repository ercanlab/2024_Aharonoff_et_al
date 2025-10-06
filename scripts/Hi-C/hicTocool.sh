#!/bin/bash
#SBATCH --job-name=hicTocool
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --time=2:00:00
#SBATCH --mail-user=aa7013@nyu.edu
#SBATCH --mail-type=END

declare -a bin=("5000") # this is the resolution
out_file_name=QG2082_caenorhabditis-becei-QG2082_30 #strain_submissionID_genome_30

export JUICER_PATH=/scratch/cgsb/ercan # path to juicer directory
export HIC_FILE=Avrami/juicer/C-becei_QG2082_wd/aligned/inter_30.hic # path to hic file within juicer directory
export OUT_DIR=QG2082_caenorhabditis-becei-QG2082 # same as out_file_name without the resolution

mkdir -p $OUT_DIR

for i in "${bin[@]}"
do
 
echo "in: $JUICER_PATH/$HIC_FILE"
echo "resolution: ${bin}"
echo "out: $OUT_DIR/${out_file_name}_"$i".cool"
echo "out: $OUT_DIR/${out_file_name}_"$i"_raw.cool"
 
# hic to cool
/scratch/work/public/singularity/run-hicexplorer-3.6.bash \
	hicConvertFormat -m $JUICER_PATH/$HIC_FILE \
	--inputFormat hic \
	--outputFormat cool \
	--resolutions "$i" \
	-o $OUT_DIR/${out_file_name}.cool # it will append resolution to output name

# remove normalization
/scratch/work/public/singularity/run-hicexplorer-3.6.bash \
        hicConvertFormat \
        -m $OUT_DIR/${out_file_name}_"$i".cool \
        --inputFormat cool \
        --outputFormat cool \
        --load_raw_values \
        -o $OUT_DIR/${out_file_name}_"$i"_raw.cool

# matrix balancing
/scratch/cgsb/ercan/shared_python/cooltools.bash \
        cooler balance $OUT_DIR/${out_file_name}_"$i"_raw.cool \
        --max-iters 500 \
        --mad-max 5 \
        --ignore-diags 2 # no output file

done
echo done
