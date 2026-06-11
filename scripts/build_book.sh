#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
cwdDir=$PWD
export PYTHONNOUSERSITE=1
export PYTHONUNBUFFERED=1
#export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH
export TS=$(date +%Y%m%d%H%M%S)
export DATE=`date "+%Y%m%d"`
export DATE_WITH_TIME=`date "+%Y%m%d-%H%M%S"` #add %3N as we want millisecond too

ALL_IN_ONE_MD=$baseDir/../book/_allinone.md

# functions

function read_md(){
    cd $baseDir/..
    cd $1
    for x in `find . -name "*.md"`; do
        echo "  read " $x;
        echo "" >> $ALL_IN_ONE_MD
        cat $x >> $ALL_IN_ONE_MD
    done
}

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return

cd $baseDir/..

echo "" > $ALL_IN_ONE_MD
read_md 01_Day_Introduction
read_md 02_Day_Variables_builtin_functions
read_md 03_Day_Operators
read_md 04_Day_Strings
read_md 05_Day_Lists
read_md 06_Day_Tuples
read_md 07_Day_Sets
read_md 08_Day_Dictionaries
read_md 09_Day_Conditionals
read_md 10_Day_Loops
read_md 11_Day_Functions
read_md 12_Day_Modules
read_md 13_Day_List_comprehension
read_md 14_Day_Higher_order_functions
read_md 15_Day_Python_type_errors
read_md 16_Day_Python_date_time
read_md 17_Day_Exception_handling
read_md 18_Day_Regular_expressions
read_md 19_Day_File_handling
read_md 20_Day_Python_package_manager
read_md 21_Day_Classes_and_objects
read_md 22_Day_Web_scraping
read_md 23_Day_Virtual_environment
read_md 24_Day_Statistics
read_md 25_Day_Pandas
read_md 26_Day_Python_web
read_md 27_Day_Python_with_mongodb
read_md 28_Day_API
read_md 29_Day_Building_API
read_md 30_Day_Conclusions


cd $baseDir/../book

# pandoc --pdf-engine=xelatex -i $ALL_IN_ONE_MD -o book.pdf
pandoc --pdf-engine=xelatex -i $ALL_IN_ONE_MD -o book_tmp.docx

echo "Done, generated file" `pwd`"/book_tmp.docx"