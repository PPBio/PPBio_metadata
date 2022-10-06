################################################################
## Exploratory analysis of first round Brazilian elections- 2022
## Code author: Tainá Rocha 
## R version 4.2.1
################################################################

library(raster)
library(rgdal)
library(ggplot2)

## import shapefile

shap = sf::st_read("data-raw/Shapes/br_municipios_20200807/br_muni_election_2022_presid.shp")


####### Tmap

tm_shape(shap) +
  tm_polygons("Candidato",
              palette= c(
                "Bolsonaro" = "#000000",
                "Lula" = "#ff0000"))


######## Not run

## GGplot

shape = readOGR("data-raw/Shapes/br_municipios_20200807/br_muni_election_2022_presid.shp")

map = ggplot() + 
  geom_polygon(data = shap, aes(x = long, y = lat, group = shap$Candidato, size = 0.15), colour = "black", fill = NA)
#$
map + theme_void()

###############


gg