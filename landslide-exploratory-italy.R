#install packages
install.packages("tidyverse")
install.packages("sf")
install.packages("sp")
install.packages("spdep")
install.packages("ggplot2")
install.packages("dplyr")
install.packages('tidyr')


library(sf)
library(sp)
library(spdep)
library(ggplot2)
library(dplyr)
library(tidyr)

#read csv
it_landslides_sf <- read_sf("italica.geojson")



it_landslides_sf$slope <- as.numeric(it_landslides_sf$slope)
it_landslides_sf$elevation <- as.numeric(it_landslides_sf$elevation)
it_landslides_sf$cumulated_rainfall <- as.numeric(it_landslides_sf$cumulated_rainfall)
it_landslides_sf$duration <- as.numeric(it_landslides_sf$duration)

#clean
it_landslides_clean_sf <- it_landslides_sf %>%
  drop_na(elevation, cumulated_rainfall, duration, slope)
  


#plot landslide points - all years
ggplot(it_landslides_clean_sf) +
  geom_sf(color = "black", size = 0.5) +
  theme_minimal() +
  labs(title = "Landslides")

#plot facet by year
ggplot(it_landslides_clean_sf) +
  geom_sf(color = "black", size = 0.1) +
  facet_wrap(vars(year)) +
  theme_minimal() +
  labs(title = "Landslides")




#Spatial statistics
#Point data spatial relationships could be nearest neighbour or distance based
# Create neighbor list based on k nearest neighbors (e.g., 8 neighbors)
coords <- st_coordinates(it_landslides_clean_sf)
knn <- knearneigh(coords, k = 8)
nb <- knn2nb(knn)

# Convert to spatial weights - W = row standardised weights
listw <- nb2listw(nb, style = "W")

#Moran's I statistics
moran_test_slope <- moran.test(it_landslides_clean_sf$slope, listw)
moran_plot_slope <- moran.plot(it_landslides_clean_sf$slope, listw)


