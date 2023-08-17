# This is how you run EPI2ME
#
# Brings up help
# nextflow run epi2me-labs/wf-human-variation --help

# Genome reference
ref_fasta=/newvolume/EPI2ME_Analysis/GRCh37.primary_assembly.genome.fa


# Sample 1 (Proband): A23-BCH-001-P
sample_id=A23-BCH-001-P
input_BAM=/newvolume/F126728_2_lanes.bam
output_dir=/newvolume/EPI2ME_Analysis/A23-BCH-001-P/
mkdir -p $output_dir
mkdir -p $output_dir/tmp
export NXF_TEMP=$output_dir/tmp

# Tried running with awsbatch, got an error asking for bucket-dir, added that option, but then got error:
# Caused by:
#  User: arn:aws:iam::670823606926:user/phil.richmond is not authorized to perform: batch:DescribeJobDefinitions on resource: * (Service: AWSBatch; Status Code: 403; Error Code: AccessDeniedException; Request ID: db230053-c3ea-4d16-acd7-d41de7d232fd; Proxy: null)
    #-bucket-dir s3://alamya-prod-1/Processed_data/RunningNextflow/ \
    
#nextflow run epi2me-labs/wf-human-variation \
#    -w ${output_dir}/workspace \
#    -bucket-dir s3://alamya-prod-1/Processed_data/RunningNextflow/ \
#    -profile standard,awsbatch \
#    --snp --sv --cnv \
#    --bam $input_BAM \
#    --ref $ref_fasta \
#    --basecaller_cfg 'dna_r10.4.1_e8.2_400bps_hac@v4.1.0'  \
#    --sample_name $sample_id \
#    --out_dir ${output_dir}

# Running without awsbatch
nextflow run epi2me-labs/wf-human-variation \
    -resume \
    -w ${output_dir}/workspace \
    -profile standard \
    --snp --sv \
    --bam $input_BAM \
    --ref $ref_fasta \
    --basecaller_cfg 'dna_r10.4.1_e8.2_400bps_hac@v4.1.0'  \
    --sample_name $sample_id \
    --out_dir ${output_dir}
