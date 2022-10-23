#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using some 
# parameters passed in from the shell

Rscript -e "rmarkdown::render('analysis.Rmd',\
            params = list(state = 'Arizona',\
            data = 'data/raw_data/applemobilitytrends-2022-04-12.csv'))"
