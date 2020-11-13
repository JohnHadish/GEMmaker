#!/bin/bash

sample_id="$1"
task_cpus="$2"
params_input_reference_name="$3"

if [ -e ${sample_id}_2.fastq ]; then
  salmon quant \
    -i . \
    -l A \
    -1 ${sample_id}_1.fastq \
    -2 ${sample_id}_2.fastq \
    -p ${task_cpus} \
    -o ${sample_id}_vs_${params_input_reference_name}.Salmon.ga \
    --minAssignedFrags 1 > ${sample_id}.salmon.log 2>&1
else
  salmon quant \
    -i . \
    -l A \
    -r ${sample_id}.fastq \
    -p ${task_cpus} \
    -o ${sample_id}_vs_${params_input_reference_name}.Salmon.ga \
    --minAssignedFrags 1 > ${sample_id}.salmon.log 2>&1
fi
