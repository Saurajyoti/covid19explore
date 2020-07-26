
 # steps from: https://cran.r-project.org/web/packages/countyweather/vignettes/countyweather.html

# The countyweather package is not working. gives a dplyr related error
#library(devtools)
#install_github("leighseverson/countyweather")
#library(countyweather)

#Sys.getenv('noaakey')
#options('noaakey' = Sys.getenv('noaakey'))

#d <- countyweather::daily_fips(fips="42101", date_min = "2020-01-01", date_max = "2020-04-10", var = c('tmin', 'tmax'))



# Using rnoaa package

#install.packages("https://cran.r-project.org/src/contrib/rgdal_0.9-1.tar.gz", repos = NULL, type="source", configure.args = "--with-gdal-config=/Library/Frameworks/GDAL.framework/Versions/1.10/unix/bin/gdal-config --with-proj-include=/Library/Frameworks/PROJ.framework/unix/include --with-proj-lib=/Library/Frameworks/PROJ.framework/unix/lib")

#install.packages("rnoaa")

library('rnoaa')

#Sys.getenv('noaakey')
options('noaakey' = Sys.getenv('noaakey'))


ncdc_locs(locationcategoryid='CITY', sortfield='name', sortorder='desc')

ncdc_stations(datasetid='GHCND', locationid='FIPS:12017', stationid='GHCND:USC00084289')

out <- ncdc(datasetid='NORMAL_DLY', stationid='GHCND:USW00014895', 
            datatypeid='dly-tmax-normal', 
            startdate = '2009-05-01', enddate = '2010-05-10')

head( out$data )

with_units <- ncdc(datasetid='GHCND', stationid='GHCND:USW00014895', 
                   datatypeid='PRCP', 
                   startdate = '2010-05-01', enddate = '2010-10-31', 
                   limit=500, add_units = TRUE)
head( with_units$data )

out <- ncdc(datasetid='GHCND', stationid='GHCND:USW00014895', 
            datatypeid='PRCP', 
            startdate = '2010-05-01', enddate = '2010-10-31', 
            limit=500)
ncdc_plot(out, breaks="1 month", dateformat="%d/%m")

out1 <- ncdc(datasetid='GHCND', stationid='GHCND:USW00014895', 
             datatypeid='PRCP', 
             startdate = '2010-03-01', enddate = '2010-05-31', 
             limit=500)
out2 <- ncdc(datasetid='GHCND', stationid='GHCND:USW00014895', 
             datatypeid='PRCP', 
             startdate = '2010-09-01', enddate = '2010-10-31', 
             limit=500)
ncdc_plot(out1, out2, breaks="45 days")

ncdc_datasets()
