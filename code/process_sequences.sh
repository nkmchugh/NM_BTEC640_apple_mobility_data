#!/bin/bash

set -euo pipefail

# Nicole McHugh
# October 29, 2022
# nkmchugh@dons.usfca.edu

# a bash script to parse SARS-CoV-2 sequence data from NCBI's GeneBank

# defensive programming to check command line argument
if [ $# -eq 0 ]
then
  echo "To run this script, supply path to the zipped fasta file"
  exit 1
fi

sequence_file="$1"

# count the number of sequences in the covid sequence data file
# the original code explicitly stated the path to the fasta sequence file:
	# zcat /blast-db/sars-cov-2-seq-data/2022-10-17_ncbi_sars-cov-2-sequences.fasta.gz | grep -c ">"
# fasta files are organized where a group of data starts off with the sequence identifier. This sequence identifier starts with ">" symbol, so using
# grep we can count how many ">" symbols there are in this file which correlate to the number of sequences in this file.
# cleaned version of the command with defensive programming integrated into it:
zcat "$sequence_file" | grep -c ">"

# tally the number of SARS-CoV-2 sequences in the data set from each country, and sort the output from largest to smallest. In the fasta file the
# country name is in the 21st column, the sort| uniq -c will keep count of all unique country names, sort -rn lists the countries in order of
# most frequent at the top to the least frequent at the bottom, and the last command will create a text file with all the data.
zcat "$sequence_file" | awk -F'|' '{print $21}'| sort | uniq -c | sort -rn > output/sequence_summary.txt
