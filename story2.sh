#                             Online Bash Shell.
#                 Code, Compile, Run and Debug Bash script online.
# Write your code in this editor and press "Run" button to execute it.

# Use the figlet command to draw a graphical representation of your name
sudo apt install figlet
figlet DEVANSHI

# In your home directory, create a folder called compare
mkdir compare && cd compare
wget https://www.bioinformatics.babraham.ac.uk/training/Introduction%20to%20Unix/unix_intro_data.tar.gz

#Unzip using gunzip command
gunzip -S .zip unix_intro_data.tar.gz
 
#Then, untar the .tar file with tar command
tar xvzf unix_intro_data.tar.gz
 
#Get into seqmonk_genomes/Saccharomyces cerevisiae/EF4 and identify the rRNAs present in Mito.dat
cd seqmonk_genomes
cd 'Saccharomyces cerevisiae'
cd 'EF4'
less Mito.dat

#Using cp copy Mito.dat into the compare directory
cp EF4/Mito.dat compare/

#Use nano to Change Mito to Mitochondrion in the ID and AC header lines
nano Mito.dat

#Rename the file from Mito.dat to Mitochondrion.txt
mv Mito.dat Mitochondrion.txt
 
cd ..
cd compare
cd 'FastQ_Data'
#Calculate the total number of lines in lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
cd lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
wc -l
wc -l < lines_count.txt






