# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from a state
# and then write out a csv file that only has that subset

# Nicole McHugh
# nkmchugh@dons.usfca.edu
# September 18, 2022

subset_data_to_a_state <- function(input_file_name, state_name) {
  # read in the complete .csv file
  all_covid_data <- read.csv(input_file_name)

  # Subset data to just a state of our choosing
  state_dataset <- all_covid_data[all_covid_data$sub.region == state_name, ]

  # Check that the subset data actually has data in it
  if (nrow(state_dataset) == 0) {
    stop("ERROR: no rows matching with the given state name. Check for typos.")
  }

  # save the state data to a new csv file in the output directory
  write.csv(state_dataset, file =
            paste0("output/",
                  state_name,
                  "_subset_",
                  basename(input_file_name)),
            row.names = FALSE)
}
