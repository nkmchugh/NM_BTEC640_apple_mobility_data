# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from the five chosen states 
# and then write out a csv files that only has that subset, using functions in 
# the code/function directory

# Nicole McHugh
# nkmchugh@dons.usfca.edu
# September 24, 2022

# load the function
source("code/functions/01_subset_data_to_a_state.R")

# run the subset function with the for loop function
for (sub_region in c("California", "Hawaii", "Alaska", "Arizona", 
                     "Washington")) {
  subset_data_to_a_state(input_file_name = paste0("data/raw_data/",
                                                 "applemobilitytrends-2022",
                                                 "-04-12.csv"),
                         state_name = sub_region)
}
