#install.packages('tidycensus')

library(tidycensus)

#census_api_key('d3ea46368bad8adc9fd421d286aeb82d8a9f7bfc', install = TRUE)

us_pop <- get_estimates(geography = 'county', product = 'population')
