# Boston Crime 
Description: This project contains analyses of Boston crime rates R and the ArcGIS suite (namely, ArcMap). These analyses were a part of a semester term project completed for a graduate-level geographic information systems course. R is used for cleaning crime data, producing 2- and 3-dimensional scatterplots, and fitting simple and multiple linear regression models. ArcMap is used for joining crime and demographic data with shapefiles - which contain spatial information about census tracts in Boston - and creating choropleth maps of crime rates, median income, and racial composition at the census tract level.

## Necessary Software 
You will need the following software and R packages installed to run code files and reproduce analyses.

Necessary software: `R` , `ArcGIS`

Necessary `R` packages: `broom` , `dplyr` , `ggplot2` , `httpuv` , `plotly` , `readxl` , `scales` 

## File Descriptions
Files names begin with a prefix according to their function:

      analysis- : R analysis file
      clean-    : R data cleaning file
      data-     : Data used for analyses
      map-      : PNG or MXD file of map created using ArcMap 
      plot-     : Plots created using R packages `ggplot2` or `plotly`
      table-    : Table containing linear regression parameters
  
## Installation and File Execution
To begin, download all files into a single folder. When using `R`, set this folder as the working directory using `setwd`. When using `ArcMap`, establish a [folder connection](http://desktop.arcgis.com/en/arcmap/10.3/map/working-with-arcmap/using-folder-connections.htm) to this folder. 

`R` script files are executable once a working directory to the folder containing data files is set. Running these scripts will reproduce all data cleaning procedures, plots, and regression analyses. 

To examine and alter the map documents using `ArcMap` , open the relevant MXD file. When using ArcMap, ensure that all of the files contained in the /shapefiles/ subdirectory have been downloaded into the folder that you establish a folder connection to. For further details, review the README file included in the /shapefiles/ subdirectory. 

## Data Sources 
[US Census Bureau American Factfinder](https://factfinder.census.gov/faces/nav/jsf/pages/searchresults.xhtml?refresh=t)

[US Census Bureau TIGER/Line Shapefiles](https://www.census.gov/geo/maps-data/data/tiger-line.html)

[City of Boston Crime Data](https://data.boston.gov/dataset/crime-incident-reports-august-2015-to-date-source-new-system)


