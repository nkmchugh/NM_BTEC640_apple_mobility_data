# The goal of this script is to use the dplyr package to count the number
# of cities and counties in a given state that have detailed Apple mobility
# data available and then eventually save it to a csv

# Nicole McHugh
# nkmchugh@dons.usfca.edu
# September 28, 2022

# load the "dplyr" package
library("readr")
library("dplyr")

# get a count of the number of cities and counties in a given state that have
# driving mobility data. The input to this will be the output of the previous
# script.

# start of the main function
counties_cities_count_function <- function(input_file_name) {

  # load in the dataset from the previous script
  state_data <- readr::read_csv(input_file_name)

  # Check that the subset data actually has data in it
  if (nrow(state_data) == 0) {
    stop("ERROR: no data in the input file. Check your file")
  }

  # starting with the dplyr chains
  count_cities_counties_by_type <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # write out the result of the dplyr chain
  readr::write_csv(count_cities_counties_by_type,
            file = paste0("output/",
                          "cities_counties_count",
                          "_",
                          basename(input_file_name)))
}
