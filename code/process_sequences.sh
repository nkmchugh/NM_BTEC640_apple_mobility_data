#!/bin/bash

set -euo pipefail

# Nicole McHugh
# November 6, 2022
# nkmchugh@dons.usfca.edu

# a bash script to parse SARS-CoV-2 sequence data from NCBI's GeneBank

# defensive programming to check command line argument
if [ $# -eq 0 ]
then
  echo "To run this script, supply at least one argument:"
  echo "Neccesary: supply path to the zipped fasta file"
  echo "For additional ouput, add 'ALL' to argument"
  exit 1
fi

sequence_file="$1"

# if "ALL" is not added to the command line and the user of this script just wants the output and no additional labels, this code will run
if [ $# -eq 1 ]
then
        zcat "$sequence_file" | awk -F'|' '{print $21}'| sort | uniq -c | sort -rn
fi

if [ "$2" = "ALL" ]
then
    # count the number of sequences in the covid sequence data file
    # the original code explicitly stated the path to the fasta sequence file:
	# zcat /blast-db/sars-cov-2-seq-data/2022-10-17_ncbi_sars-cov-2-sequences.fasta.gz | grep -c ">"
    # fasta files are organized where a group of data starts off with the sequence identifier. This sequence identifier starts with ">" symbol, so using grep we can count how many ">"
    # symbols there are in this file which correlate to the number of sequences in this file. To make the result of this script interpretable, the first line beginning wwith echo was added.
    # cleaned version of the command with defensive programming integrated into it
	echo "Number of sequences found:"
	zcat "$sequence_file" | grep -c ">"

    # tally the number of SARS-CoV-2 sequences in the data set from each country, and sort the output from largest to smallest. In the fasta file the
    # country name is in the 21st column, the sort| uniq -c will keep count of all unique country names, and sort -rn lists the countries in order of
    # most frequent at the top to the least frequent at the bottom.
	echo "Country and Frequency Data Table:"
	zcat "$sequence_file" | awk -F'|' '{print $21}'| sort | uniq -c | sort -rn
fi
