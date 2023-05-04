mkdir Datasets
cd ~/Datasets
mkdir -p data/ref_genome
wget https://zenodo.org/record/2582555/files/SLGFSK-N_231335_r1_chr5_12_17.fastq.gz
gunzip data/ref_genome/SLGFSK-N_231335_r1_chr5_12_17.fastq.gz
head data/ref_genome/SLGFSK-N_231335_r1_chr5_12_17.fastq.gz
curl -L -o sub.tar.gz https://ndownloader.figshare.com/files/14418248
tar xvf sub.tar.gz
mv sub/ ~/Datasets/data/trimmed_fastq_small
mkdir -p results/sam results/bam results/bcf results/vcf
bwa index data/ref_genome/ecoli_rel606.fasta

#align reads to reference genome
bwa mem ref_genome.fasta input_file_R1.fastq input_file_R2.fastq > output.sam
bwa mem data/ref_genome/ecoli_rel606.fasta data/trimmed_fastq_small/SRR2584866_1.trim.sub.fastq data/trimmed_fastq_small/SRR2584866_2.trim.sub.fastq > results/sam/SRR2584866.aligned.sam

samtools view -S -b results/sam/SRR2584866.aligned.sam > results/bam/SRR2584866.aligned.bam
samtools sort -o results/bam/SRR2584866.aligned.sorted.bam results/bam/SRR2584866.aligned.bam 
samtools flagstat results/bam/SRR2584866.aligned.sorted.bam

bcftools mpileup -O b -o results/bcf/SRR2584866_raw.bcf \
-f data/ref_genome/ecoli_rel606.fasta results/bam/SRR2584866.aligned.sorted.bam 

#calculate single nucleotide variant
bcftools call --ploidy 1 -m -v -o results/vcf/SRR2584866_variants.vcf results/bcf/SRR2584866_raw.bcf 
vcfutils.pl varFilter results/vcf/SRR2584866_variants.vcf  > results/vcf/SRR2584866_final_variants.vcf

bcftools stats results/bcf/SRR2584866_variants.vcf | grep TSTV
# TSTV, transitions/transversions:
# TSTV	[2]id	[3]ts	[4]tv	[5]ts/tv	[6]ts (1st ALT)	[7]tv (1st ALT)	[8]ts/tv (1st ALT)
TSTV	0	628	58	10.83	628	58	10.83
bcftools stats results/vcf/SRR2584866_final_variants.vcf | grep TSTV
# TSTV, transitions/transversions:
# TSTV	[2]id	[3]ts	[4]tv	[5]ts/tv	[6]ts (1st ALT)	[7]tv (1st ALT)	[8]ts/tv (1st ALT)
TSTV	0	621	54	11.50	621	54	11.50

#explore VCF format
less -S results/vcf/SRR2584866_final_variants.vcf

#visualization
samtools index results/bam/SRR2584866.aligned.sorted.bam
samtools tview results/bam/SRR2584866.aligned.sorted.bam data/ref_genome/ecoli_rel606.fasta

#viewing with IGV
mkdir ~/Desktop/files_for_igv
cd ~/Desktop/files_for_igv

scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/bam/SRR2584866.aligned.sorted.bam ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/bam/SRR2584866.aligned.sorted.bam.bai ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/data/ref_genome/ecoli_rel606.fasta ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/vcf/SRR2584866_final_variants.vcf ~/Desktop/files_for_igv


#with second dataset
cd ~/Datasets
mkdir -p data/ref_genome
wget https://zenodo.org/record/2582555/files/SLGFSK-N_231335_r2_chr5_12_17.fastq.gz
gunzip data/ref_genome/SLGFSK-N_231335_r2_chr5_12_17.fastq.gz
head data/ref_genome/SLGFSK-N_231335_r2_chr5_12_17.fastq.gz
curl -L -o sub.tar.gz https://ndownloader.figshare.com/files/14418248
tar xvf sub.tar.gz
mv sub/ ~/Datasets/data/trimmed_fastq_small
mkdir -p results/sam results/bam results/bcf results/vcf
bwa index data/ref_genome/ecoli_rel606.fasta

#align reads to reference genome
bwa mem ref_genome.fasta input_file_R1.fastq input_file_R2.fastq > output.sam
bwa mem data/ref_genome/ecoli_rel606.fasta data/trimmed_fastq_small/SRR2584866_1.trim.sub.fastq data/trimmed_fastq_small/SRR2584866_2.trim.sub.fastq > results/sam/SRR2584866.aligned.sam

samtools view -S -b results/sam/SRR2584866.aligned.sam > results/bam/SRR2584866.aligned.bam
samtools sort -o results/bam/SRR2584866.aligned.sorted.bam results/bam/SRR2584866.aligned.bam 
samtools flagstat results/bam/SRR2584866.aligned.sorted.bam

bcftools mpileup -O b -o results/bcf/SRR2584866_raw.bcf \
-f data/ref_genome/ecoli_rel606.fasta results/bam/SRR2584866.aligned.sorted.bam 

#calculate single nucleotide variant
bcftools call --ploidy 1 -m -v -o results/vcf/SRR2584866_variants.vcf results/bcf/SRR2584866_raw.bcf 
vcfutils.pl varFilter results/vcf/SRR2584866_variants.vcf  > results/vcf/SRR2584866_final_variants.vcf

bcftools stats results/bcf/SRR2584866_variants.vcf | grep TSTV
# TSTV, transitions/transversions:
# TSTV	[2]id	[3]ts	[4]tv	[5]ts/tv	[6]ts (1st ALT)	[7]tv (1st ALT)	[8]ts/tv (1st ALT)
TSTV	0	628	58	10.83	628	58	10.83
bcftools stats results/vcf/SRR2584866_final_variants.vcf | grep TSTV
# TSTV, transitions/transversions:
# TSTV	[2]id	[3]ts	[4]tv	[5]ts/tv	[6]ts (1st ALT)	[7]tv (1st ALT)	[8]ts/tv (1st ALT)
TSTV	0	621	54	11.50	621	54	11.50

#explore VCF format
less -S results/vcf/SRR2584866_final_variants.vcf

#visualization
samtools index results/bam/SRR2584866.aligned.sorted.bam
samtools tview results/bam/SRR2584866.aligned.sorted.bam data/ref_genome/ecoli_rel606.fasta

#viewing with IGV
mkdir ~/Desktop/files_for_igv
cd ~/Desktop/files_for_igv

scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/bam/SRR2584866.aligned.sorted.bam ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/bam/SRR2584866.aligned.sorted.bam.bai ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/data/ref_genome/ecoli_rel606.fasta ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/vcf/SRR2584866_final_variants.vcf ~/Desktop/files_for_igv

#third dataset
cd ~/Datasets
mkdir -p data/ref_genome
wget https://zenodo.org/record/2582555/files/SLGFSK-T_231336_r1_chr5_12_17.fastq.gz
gunzip data/ref_genome/SLGFSK-T_231336_r1_chr5_12_17.fastq.gz
head data/ref_genome/SLGFSK-T_231336_r1_chr5_12_17.fastq.gz
curl -L -o sub.tar.gz https://ndownloader.figshare.com/files/14418248
tar xvf sub.tar.gz
mv sub/ ~/Datasets/data/trimmed_fastq_small
mkdir -p results/sam results/bam results/bcf results/vcf
bwa index data/ref_genome/ecoli_rel606.fasta

#align reads to reference genome
bwa mem ref_genome.fasta input_file_R1.fastq input_file_R2.fastq > output.sam
bwa mem data/ref_genome/ecoli_rel606.fasta data/trimmed_fastq_small/SRR2584866_1.trim.sub.fastq data/trimmed_fastq_small/SRR2584866_2.trim.sub.fastq > results/sam/SRR2584866.aligned.sam

samtools view -S -b results/sam/SRR2584866.aligned.sam > results/bam/SRR2584866.aligned.bam
samtools sort -o results/bam/SRR2584866.aligned.sorted.bam results/bam/SRR2584866.aligned.bam 
samtools flagstat results/bam/SRR2584866.aligned.sorted.bam

bcftools mpileup -O b -o results/bcf/SRR2584866_raw.bcf \
-f data/ref_genome/ecoli_rel606.fasta results/bam/SRR2584866.aligned.sorted.bam 

#calculate single nucleotide variant
bcftools call --ploidy 1 -m -v -o results/vcf/SRR2584866_variants.vcf results/bcf/SRR2584866_raw.bcf 
vcfutils.pl varFilter results/vcf/SRR2584866_variants.vcf  > results/vcf/SRR2584866_final_variants.vcf

bcftools stats results/bcf/SRR2584866_variants.vcf | grep TSTV
# TSTV, transitions/transversions:
# TSTV	[2]id	[3]ts	[4]tv	[5]ts/tv	[6]ts (1st ALT)	[7]tv (1st ALT)	[8]ts/tv (1st ALT)
TSTV	0	628	58	10.83	628	58	10.83
bcftools stats results/vcf/SRR2584866_final_variants.vcf | grep TSTV
# TSTV, transitions/transversions:
# TSTV	[2]id	[3]ts	[4]tv	[5]ts/tv	[6]ts (1st ALT)	[7]tv (1st ALT)	[8]ts/tv (1st ALT)
TSTV	0	621	54	11.50	621	54	11.50

#explore VCF format
less -S results/vcf/SRR2584866_final_variants.vcf

#visualization
samtools index results/bam/SRR2584866.aligned.sorted.bam
samtools tview results/bam/SRR2584866.aligned.sorted.bam data/ref_genome/ecoli_rel606.fasta

#viewing with IGV
mkdir ~/Desktop/files_for_igv
cd ~/Desktop/files_for_igv

scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/bam/SRR2584866.aligned.sorted.bam ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/bam/SRR2584866.aligned.sorted.bam.bai ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/data/ref_genome/ecoli_rel606.fasta ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/vcf/SRR2584866_final_variants.vcf ~/Desktop/files_for_igv

#fourth dataset
cd ~/Datasets
mkdir -p data/ref_genome
wget https://zenodo.org/record/2582555/files/SLGFSK-T_231336_r2_chr5_12_17.fastq.gz
gunzip data/ref_genome/SLGFSK-T_231336_r2_chr5_12_17.fastq.gz
head data/ref_genome/SLGFSK-T_231336_r2_chr5_12_17.fastq.gz
curl -L -o sub.tar.gz https://ndownloader.figshare.com/files/14418248
tar xvf sub.tar.gz
mv sub/ ~/Datasets/data/trimmed_fastq_small
mkdir -p results/sam results/bam results/bcf results/vcf
bwa index data/ref_genome/ecoli_rel606.fasta

#align reads to reference genome
bwa mem ref_genome.fasta input_file_R1.fastq input_file_R2.fastq > output.sam
bwa mem data/ref_genome/ecoli_rel606.fasta data/trimmed_fastq_small/SRR2584866_1.trim.sub.fastq data/trimmed_fastq_small/SRR2584866_2.trim.sub.fastq > results/sam/SRR2584866.aligned.sam

samtools view -S -b results/sam/SRR2584866.aligned.sam > results/bam/SRR2584866.aligned.bam
samtools sort -o results/bam/SRR2584866.aligned.sorted.bam results/bam/SRR2584866.aligned.bam 
samtools flagstat results/bam/SRR2584866.aligned.sorted.bam

bcftools mpileup -O b -o results/bcf/SRR2584866_raw.bcf \
-f data/ref_genome/ecoli_rel606.fasta results/bam/SRR2584866.aligned.sorted.bam 

#calculate single nucleotide variant
bcftools call --ploidy 1 -m -v -o results/vcf/SRR2584866_variants.vcf results/bcf/SRR2584866_raw.bcf 
vcfutils.pl varFilter results/vcf/SRR2584866_variants.vcf  > results/vcf/SRR2584866_final_variants.vcf

bcftools stats results/bcf/SRR2584866_variants.vcf | grep TSTV
# TSTV, transitions/transversions:
# TSTV	[2]id	[3]ts	[4]tv	[5]ts/tv	[6]ts (1st ALT)	[7]tv (1st ALT)	[8]ts/tv (1st ALT)
TSTV	0	628	58	10.83	628	58	10.83
bcftools stats results/vcf/SRR2584866_final_variants.vcf | grep TSTV
# TSTV, transitions/transversions:
# TSTV	[2]id	[3]ts	[4]tv	[5]ts/tv	[6]ts (1st ALT)	[7]tv (1st ALT)	[8]ts/tv (1st ALT)
TSTV	0	621	54	11.50	621	54	11.50

#explore VCF format
less -S results/vcf/SRR2584866_final_variants.vcf

#visualization
samtools index results/bam/SRR2584866.aligned.sorted.bam
samtools tview results/bam/SRR2584866.aligned.sorted.bam data/ref_genome/ecoli_rel606.fasta

#viewing with IGV
mkdir ~/Desktop/files_for_igv
cd ~/Desktop/files_for_igv

scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/bam/SRR2584866.aligned.sorted.bam ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/bam/SRR2584866.aligned.sorted.bam.bai ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/data/ref_genome/ecoli_rel606.fasta ~/Desktop/files_for_igv
scp dcuser@ec2-34-203-203-131.compute-1.amazonaws.com:~/Datasets/results/vcf/SRR2584866_final_variants.vcf ~/Desktop/files_for_igv

