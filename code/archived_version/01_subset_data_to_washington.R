# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from Washington
# and then write out a csv file that only has that subset

# Nicole McHugh
# nkmchugh@dons.usfca.edu
# September 4, 2022

# read in the complete .csv file
all_covid_data <- read.csv("data/raw data/applemobilitytrends-2022-04-12.csv")

# Subset the dataset to only include rows where the sub.region column has
# "Washington" in it but we want all columns
washington_data <- all_covid_data[all_covid_data$sub.region == "Washington", ]

# save the Washington data to a new csv file in the output directory
write.csv(washington_data, file = "output/washington_apple_mobility_data.csv")
