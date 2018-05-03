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
  
## Installation
To begin, download all files into a single folder. When using R, set this folder as the working directory using `setwd`. When using ArcMap, establish a [folder connection](http://desktop.arcgis.com/en/arcmap/10.3/map/working-with-arcmap/using-folder-connections.htm). 


