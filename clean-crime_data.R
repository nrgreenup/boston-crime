# Load necessary packages
library(dplyr)

# Read in data
crime <- read.csv("data-crime_incidents.csv")

# Ascertain number of different criminal offenses in data
unique(crime$OFFENSE_CODE_GROUP)

# Remove observations with missing information (N/A)
crime <- na.omit(crime)

# Remove observations with missing spatial information (missing latitude or longitude coded as -1)
crime_filtered <- filter(crime, crime$Lat > -1 & crime$Long < -1)

# Specify crimes of interest for analysis
crimes_interested <- c("Auto Theft", "Aggravated Assault", "Larceny From Motor Vehicle",
                       "Larceny", "Drug Violation", "Robbery",
                       "Simple Assault", "Residential Burglary",
                       "Firearm Violations", "Homicide", "HOME INVASION",
                       "Offenses Against Child / Family", "Other Burglary", "Commercial Burglary",
                       "Criminal Harassment", "Explosives", "HUMAN TRAFFICKING", "Manslaughter",
                       "Burglary - No Property Taken", "Arson")

# Keep only observations with crimes of interest
crime_clean <- crime_filtered[crime_filtered$OFFENSE_CODE_GROUP %in% crimes_interested,]

# Ensure that only the 20 crimes of interest are included
unique(crime_clean$OFFENSE_CODE_GROUP)

# Export data
write.csv(crime_clean, "data-crime_incidents_cleaned.csv")