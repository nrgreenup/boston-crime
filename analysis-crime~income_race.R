### Open necessary packages
library(dplyr)
library(readxl)
library(ggplot2)
library(scales)
library(broom)
library(plotly)
library(httpuv)

### Set environment for plotly commands
Sys.setenv("plotly_username"="nrgreenup")
Sys.setenv("plotly_api_key"="4ukDZ3WoNLTcg9JABEA5")

### Read in data
crime <- read_excel("data-crime_with_demographics.xlsx")

### Normalize crime count by population size for each census tract
crime$crime_norm <- as.numeric((crime$COUNT) / (crime$Population_Estimate))

### Keep on variables of interest and omit observations with missing values
vars <- c("NAMELSAD", "COUNT", "crime_norm", "Percent_White", "Population_Estimate", "Median_income")
crime <- select(crime, one_of(vars))
crime <- na.omit(crime)

### Correlate and plot crime rates using full data
# X = Percent white
cor(crime$crime_norm, crime$Percent_White)
crime_plot_race_unfiltered_xRACE <-ggplot(crime, aes(x = crime$Percent_White, y = crime$crime_norm)) +
  geom_point(col = "red") +
  geom_smooth(method = "lm") +
  labs(title ="Crimes per Capita by Racial Composition", caption = "Correlation = -0.039", x = "Percent White", y = "Crimes per Capita") +
  theme(plot.title = element_text(hjust = 0.5)) 
print(crime_plot_race_unfiltered_xRACE)
ggsave("plot-crime_unfiltered_xRACE.png" , width = 5, height = 5)

# X = Median income
cor(crime$crime_norm, crime$Median_income)
crime_plot_race_unfiltered_xINCOME <-ggplot(crime, aes(x = crime$Median_income, y = crime$crime_norm)) +
  geom_point(col = "red") +
  geom_smooth(method = "lm") +
  labs(title ="Crimes per Capita by Median Income", caption = "Correlation = 0.203", x = "Median Income", y = "Crimes per Capita") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(labels = scales::comma)
print(crime_plot_race_unfiltered_xINCOME)
ggsave("plot-crime_unfiltered_xINCOME.png" , width = 5, height = 5)

### Subset data to omit high influence outliers
crime_filtered <- filter(crime, crime$crime_norm < 0.5)

### Correlate and plot crime rates using subsetted data
# X = Percent white
cor(crime_filtered$crime_norm, crime_filtered$Percent_White)
crime_plot_race_filtered_xRACE <-ggplot(crime_filtered, aes(x = crime_filtered$Percent_White, y = crime_filtered$crime_norm)) +
  geom_point(col = "red") +
  geom_smooth(method = "lm") +
  labs(title ="Crimes per Capita by Racial Composition", caption = "Correlation = -0.414", subtitle= "Observations where Crimes per Capita is less than 0.5", x = "Percent White", y = "Crimes per Capita") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.subtitle = element_text(hjust = 0.5))
print(crime_plot_race_filtered_xRACE)
ggsave("plot-crime_filtered_xRACE.png" , width = 5, height = 5)

# X = Median income
cor(crime_filtered$crime_norm, crime_filtered$Median_income)
crime_plot_race_filtered_xINCOME <-ggplot(crime_filtered, aes(x = crime_filtered$Median_income, y = crime_filtered$crime_norm)) +
  geom_point(col = "red") +
  geom_smooth(method = "lm") +
  labs(title ="Crimes per Capita by Median Income", caption = "Correlation = -0.299", subtitle= "Observations where Crimes per Capita is less than 0.5", x = "Median Income", y = "Crimes per Capita") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  scale_x_continuous(labels = scales::comma)
print(crime_plot_race_filtered_xINCOME)
ggsave("plot-crime_filtered_xINCOME.png" , width = 5, height = 5)

### Fit linear models on filtered data
crime_simple_lm <- lm(crime_norm ~ Median_income, data = crime_filtered)
summary(crime_simple_lm)
tidy_crime_simple_lm <- tidy(crime_simple_lm)
write.csv(tidy_crime_simple_lm, "table-tidy_crime_simple_lm.csv")

crime_multiple_lm <- lm(crime_norm ~ Median_income + Percent_White, data = crime_filtered)
summary(crime_multiple_lm)
tidy_crime_mult_lm <- tidy(crime_multiple_lm)
tidy_crime_mult_lm
write.csv(tidy_crime_mult_lm, "table-tidy_crime_multiple_lm.csv")

### 3d scatterplot of multiple linear model
scatterplot_3d <- plot_ly(crime_filtered, x= ~Median_income , y = ~Percent_White, z = ~crime_norm,
                          color = "red") %>% 
  add_markers() %>%
  layout(scene = list(xaxis = list(title = 'Median Income'),
                      yaxis = list(title = 'Percent White'),
                      zaxis = list(title = 'Crimes per Capita'))) 
scatterplot_3d

scatterplot_3d_link <- api_create(scatterplot_3d, filename="boston-crime_income_race_3d")
scatterplot_3d_link 
