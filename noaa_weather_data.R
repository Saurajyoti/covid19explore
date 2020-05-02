
 # steps from: https://cran.r-project.org/web/packages/countyweather/vignettes/countyweather.html

install.packages('countyweather')
library(countyweather)

Sys.getenv('noaakey')
options('noaakey' = Sys.getenv('noaakey'))

d <- daily_fips(fips="42101", date_min = "2020-01-01", date_max = "2020-04-10", var = c('tmin', 'tmax'))
