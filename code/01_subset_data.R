# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from the chosen state
# and then write out a csv file that only has that subset, using functions in 
# the code/function directory

# Nicole McHugh
# nkmchugh@dons.usfca.edu
# September 18, 2022

# load the function
source("code/functions/01_subset_data_to_a_state.R")

# run the subset function
subset_data_to_a_state(
  input_file_name = "data/raw_data/applemobilitytrends-2022-04-12.csv",
  state_name = "California")
