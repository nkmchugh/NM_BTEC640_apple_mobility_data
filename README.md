# Analysis of Apple Mobility Data In the U.S. During the COVID Pandemic

Nicole McHugh  
nkmchugh@dons.usfca.edu

The aim of this project is to analyze the mobility data made available by Apple.

The data was available from the following URL:
https://covid19.apple.com/mobility

It currently uses dplyr to work with some of the tabular data, and also includes the use of ggplot to visualize 
the dataset.

## Change Log

* 2022-10-29: Parse the zip file containing the SARS-CoV-2 data up to October 17th, 2022. Create a bash script 
with defensive programming to count the total number of sequence data in the file, and tally and sort the number 
of dataset from each country from largest to smallest
* 2022-10-22: Parameterize Rmd and add bash script to drive knitting
* 2022-10-09: Rename and modify scripts accordingly to suggestions made, and
create an Rmd file to combine the entire analysis project.
* 2022-09-29: Add third function produce long data, and implemented readr 
function on other scripts.
* 2022-09-24: Added second script to use dplyr to tally up the count of cities
and counties in a given state that have data from the different transportation 
types.
* 2022-09-21: Add git infrastructure to project and push to GitHub.
* 2022-09-18: A new version of the code was created to refractor the 
code to be more general and allow for any state to be subsetted from the 
larger file.
* 2022-04-12: The data was downloaded for analysis.
