#!/bin/bash

set -euo pipefail

# A bash script to drive the rendering of an Rmarkdown file using some 
# parameters passed in from the shell

# This script expects two command line parameters
# the first should be a US state, and the second is the raw apple mobility
# data csv file downloaded from apple.com

# Nicole McHugh
# November 6, 2022
# nkmchugh@dons.usfca.edu

if [ $# -eq 0 ]
then
  echo "To run this script, supply three arguments:"
  echo "The first is the name of the state to be analyzed."
  echo "The second is the path to the mobility data csv file."
  echo "The third is the path to the sequence summary report text file."
  exit 1
fi

state=$1
state=${state// /_}

RMD_PARAMS="params = list(state = '$1', data = '$2', seqdata = '$3')"
RMD_OUTPUT="output_dir = 'output', output_file = 'analysis_$state'"

Rscript -e "rmarkdown::render('analysis.Rmd', $RMD_PARAMS, $RMD_OUTPUT)"
