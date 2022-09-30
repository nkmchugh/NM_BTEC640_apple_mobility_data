# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from a state
# and then write out a csv file that only has that subset

# Nicole McHugh
# nkmchugh@dons.usfca.edu
# September 28, 2022

# load the readr package
library("readr")
library("dplyr")

subset_data_to_a_state <- function(input_file_name, state_name) {
  # read in the complete .csv file
  # use readr function to prevent column names from changing
  all_covid_data <- readr::read_csv("data/raw_data/applemobilitytrends-2022-04-12.csv")

  # Subset data to just a state of our choosing
  state_data <- all_covid_data %>% 
    dplyr::filter(`sub-region` == state_name)

  # Check that the subset data actually has data in it
  if (nrow(state_data) == 0) {
    stop("ERROR: no rows matching with the given state name. Check for typos.")
  }
  
  # editing code that fixes spaces in state names in output file
  state_no_space <- gsub(state_name, pattern = " ", replacement = "_")

  # save the state data to a new csv file in the output directory
  readr::write_csv(state_data, file =
            paste0("output/",
                  state_no_space,
                  "_subset_",
                  basename(input_file_name)))
 # line of code to get output of function into environment
   return(state_data)
}
