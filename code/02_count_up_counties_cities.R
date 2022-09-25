# The goal of this script is to use the dplyr package to count the number
# of cities and counties in a given state that have detailed Apple mobility
# data available and then eventually save it to a csv

# Nicole McHugh
# nkmchugh@dons.usfca.edu
# September 24, 2022

# load the function
source("code/functions/02_counties_cities_count_function.R")

# run the subset function with the for loop function
for (subset_data_files in
     c("output/Alaska_subset_applemobilitytrends-2022-04-12.csv",
       "output/Arizona_subset_applemobilitytrends-2022-04-12.csv",
       "output/California_subset_applemobilitytrends-2022-04-12.csv",
       "output/Hawaii_subset_applemobilitytrends-2022-04-12.csv",
       "output/Washington_subset_applemobilitytrends-2022-04-12.csv")){
  counties_cities_count_function(
    input_file_name = subset_data_files
  )
}
