#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using some 
# parameters passed in from the shell

# This script expects two command line parameters
# the first should be a US state, and the second is the raw apple mobility
# data csv file downloaded from apple.com

# Nicole McHugh
# October 22, 2022
# nkmchugh@dons.usfca.edu

if [ $# -eq 0 ]
then
  echo "To run this script, supply two arguments:"
  echo "The first is the name of the state to be analyzed."
  echo "The second is the path to the mobility data csv file."
  exit 1
fi

Rscript -e "rmarkdown::render('analysis.Rmd',\
            params = list(state = '$1',\
            data = '$2'))"
