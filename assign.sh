#! /bin/bash
# creating a dircetory named ProjectData
cd
dict_name=ProjectData
if [ ! -d "$dict_name" ];then
  mkdir "$dict_name"
  ls
else
   echo "directory created"
   ls
fi
cd ProjectData
echo "creating subdirectories under the created directory $dict_name"
if [ ! -d Reports ] ||  [ ! -d Logs ] ||  [ ! -d Data ];then 
  mkdir Reports
  mkdir Logs
  mkdir Data
  ls
else
  echo "sub directories created"
  ls
fi
cd Data
if [ !  -d Data ];then
  echo "creating files under subdirectory Data"
  touch file1.txt file2.txt file3.txt file4.txt file5.txt file6.txt file7.txt file8.txt file9.txt file10.txt
  echo "Files created"
  ls
else
  echo "Failed to create files"
  ls
fi
random_data="python programming language"
for i in {1..10}
 do
   echo "$random_data" > file$i.txt
   cat file$i.txt

 done
cd ..
cd Reports
#creating a summary.txt file in Reports for appending no.of lines in each file
echo "creating a summary.txt file in Reports for appending no.of lines in each file"
if [ ! -e summary.txt ]; then
   touch  summary.txt
else
   rm summary.txt
   touch summary.txt 
   echo "summary.txt is created"
fi
cd ..
cd Data
#counting no of lines in each file and append those into summary.txt
for i in {1..10}
 do
  echo "no of lines in each file is $(wc -l file$i.txt)" >> ~/ProjectData/Reports/summary.txt
 done
cat ~/ProjectData/Reports/summary.txt
cd ..
cd Logs
echo "creating a file for recording date and time when the file processing script was run"
if [ -e logfile ];then
   touch logfile
else
   echo "Logfile created"
fi
variable1=$(date)
echo "file processing script was run: $variable1" >> logfile
cat logfile
