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

#read shapefile into uk_landslides
uk_landslides_sf <- read_sf("LANDSLIDE_INDEX/LANDSLIDE_INDEX.shp")
uk_landslides_sp <- as_Spatial(uk_landslides_sf)

#uk_landslides_sf_2025 <- filter(uk_landslides_sf, FIRST_KNOW == "2025")

#plot landslide points - all years
ggplot(uk_landslides_sf) +
  geom_sf(color = "black", size = 1) +
  theme_minimal() +
  labs(title = "Landslides")

