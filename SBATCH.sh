#!/bin/sh
#SBATCH --partition=ficklin
#SBATCH --account=ficklin
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=7-00:00:00
#SBATCH --job-name=%jGEMmaker
#SBATCH --output=GS_ScaldGEMmaker%j.out
#SBATCH --error=GS_ScaldGEMmaker%j.err
#SBATCH --mail-user=john.hadish@wsu.edu
#SBATCH --mail-type=ALL
##SBATCH --mem=64000 

module add java nextflow singularity/2.4.2

#./gemmaker-record-directory-size/GEMmakerRecordDirectorySize.sh work &

nextflow run main.nf -profile slurm -with-singularity -with-report -with-timeline -with-trace # -resume
