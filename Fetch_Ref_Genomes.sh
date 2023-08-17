genome_dir=/newvolume/Genomes/
mkdir -p $genome_dir
cd $genome_dir

# GRCh37
wget -c -q https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_44/GRCh37_mapping/GRCh37.primary_assembly.genome.fa.gz
gunzip -c GRCh37.primary_assembly.genome.fa.gz > GRCh37.primary_assembly.genome.fa

# GRCh38
wget -c -q https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_44/GRCh38.primary_assembly.genome.fa.gz
gunzip -c GRCh38.primary_assembly.genome.fa.gz > GRCh38.primary_assembly.genome.fa
