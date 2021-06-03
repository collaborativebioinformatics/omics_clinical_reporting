#!/bin/bash
# File: sra_fetch_paired.sh
# Purpose: Iterate over SRA Accessions and retrieve fastq files
#          for studies using paired end sequencing
# Created: Jun2 2, 2021
# Author: Adam Faranda
###############################################################################


for f in $(gawk -v FS="," '(NR>1) {print $1}' $1)
do
   ck=${f}_1.fastq.gz
   if [ -f $ck ]
   then
	echo already fetched $f
   else	
	echo fetching $f
	fastq-dump --split-files --gzip $f &
    fi
done
