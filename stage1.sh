#                             Online Bash Shell.
#                 Code, Compile, Run and Debug Bash script online.
# Write your code in this editor and press "Run" button to execute it.


# dowload file in terminal
wget https://raw.githubusercontent.com/HackBio-Internship/wale-home-tasks/main/DNA.fa

#count no of sequences
wc -c DNA.fa

#one-line command in Bash to get the total A, T, G & C counts for the sequence in the file above
grep -v "^" DNA.fa | wc -c

# installation of software(fastqc,multiqc,fastp)
sudo apt-get install fastqc
sudo apt-get install multiqc
sudo apt-get install fastp

#download some datasets
mkdir raw_reads
cd raw_reads
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/ACBarrie_R1.fastq.gz
 
#Create a folder called output
mkdir output

#Implement the three software on the downloaded files (ACBarrie_R1.fastq.gz) and send all outputs to the output folder
fastqc RAW_READS/ACBarrie_R1.fastq.gz -o output/
multiqc output/
#using fastp
touch trim.sh 
nano trim.sh
#!/bin/Bash
mkdir trimmed_reads
sample = (
   "ACBarrie_R1"
   )
   for sample in "${sample[@]}"; do
    fastp\
     -i "$PWD/${sample}_R1.fastq.gz"\
    - I "$PWD/${sample}_R2.fastq.gz"\
     -o "trimmed_reads/${sample}_R1.fastq.gz"\
     -O "trimmed_reads/${sample}_R2.fastq.gz"\
     --html "trimmed_reads/${sample}_fastp.html"
    done
    
# moving fastp result file to output folder
mv devanshigupta1973/trim.sh output/
