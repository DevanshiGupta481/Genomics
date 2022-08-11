#                             Online Bash Shell.
#                 Code, Compile, Run and Debug Bash script online.
# Write your code in this editor and press "Run" button to execute it.


# Create a new folder titled your name
mkdir Devanshi

# Create another new directory titled biocomputing and change to that directory with one line of command
mkdir Biocomputing && cd Biocomputing

# Download files
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk

#  You have to move the .fna file to the folder titled your name directly
mv wildtype.fna ../Devanshi/

# OH No! The gbk file is a duplicate, they are actually the same thing. Please delete it
rm wildtype.gbk.1
 
# The files got mixed up and we are not sure which is wildtype and which is mutant. The mutant should have “tatatata” while the normal should have just “tata”. Can you confirm if the file is mutant or wild type
grep 'tatatata' wildtype.fna

# If it is mutant, print all the lines that show it is a mutant into a new file
grep 'tatatata' wildtype.fna > mutant

# Clear your terminal space and print all the commands you have used today
Clear && history

# List the files in the two folders and share a screenshot of your terminal below
ls && ls ../Biocomputing


#STORY2
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

# print name on different lines
Firstname="Devanshi"
Lastname="Gupta"
echo "$Firstname"
echo "$Lastname"

# print name on same lines
Firstname="Devanshi"
Lastname="Gupta"
echo "$Firstname $Lastname"





