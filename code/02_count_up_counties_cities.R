# The goal of this script is to use the dplyr package to count the number
# of cities and counties in a given state that have detailed Apple mobility
# data available and then eventually save it to a csv

# Nicole McHugh
# nkmchugh@dons.usfca.edu
# September 24, 2022

# load the "dplyr" package
library("dplyr")

# get a count of the number of cities and counties in a given state that have 
# driving mobility data. The input to this will be the output of the previous 
# script.

# load in the dataset from the previous script 
input_file_name <- "output/California_subset_applemobilitytrends-2022-04-12.csv"
state_data <- read.csv(input_file_name)

# starting with the dplyr chains
count_of_cities_counties_by_transportaion_type <- state_data %>%
  select(geo_type, region, transportation_type) %>%
  group_by(geo_type, transportation_type) %>%
  tally()

write.csv(count_of_cities_counties_by_transportaion_type, 
          "output/california_cities_counties_count.csv")
