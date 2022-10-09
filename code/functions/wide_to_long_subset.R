# The goal of this script is to use the tidyr package to convert one subset
# output data from wide to long format

# Nicole McHugh
# nkmchugh@dons.usfca.edu
# September 29, 2022

# load the "readr" and tidyr" package
library("readr")
library("tidyr")

# start of the function
wide_to_long_subset <- function(input_file_name){
  
  # read the subset file
  state_data <- readr::read_csv(input_file_name)
  
  #pipeline to edit the subset file to long format
  long_subset_data <- state_data %>%
    tidyr::pivot_longer(cols = starts_with("20"),
                        names_to = "date",
                        values_to = "relative_mobility")

  # write the pivot longer function to a csv file
  readr::write_csv(long_subset_data,
                   file = paste0("output/subsetted_state_long/",
                                 "long_",
                                 basename(input_file_name)))
}
