#install packages
install.packages("tidyverse")
install.packages("sf")
install.packages("sp")
install.packages("spdep")
install.packages("ggplot2")
install.packages("dplyr")


library(sf)
library(sp)
library(spdep)
library(ggplot2)
library(dplyr)

#read csv
it_landslides_sf <- read_sf("italica.geojson")

#plot landslide points - all years
ggplot(it_landslides_sf) +
  geom_sf(color = "black", size = 0.5) +
  theme_minimal() +
  labs(title = "Landslides")

ggplot(it_landslides_sf) +
  geom_sf(color = "black", size = 0.1) +
  facet_wrap(vars(year)) +
  theme_minimal() +
  labs(title = "Landslides")


it_landslides_sf$slope <- as.numeric(it_landslides_sf$slope)
it_landslides_sf$elevation <- as.numeric(it_landslides_sf$elevation)
it_landslides_sf$cumulated_rainfall <- as.numeric(it_landslides_sf$cumulated_rainfall)

