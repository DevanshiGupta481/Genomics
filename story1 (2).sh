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




