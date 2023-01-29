
#import word shapefile data
world_shp <- sf::st_as_sf(maps::map("world", plot = FALSE, fill = TRUE))
#save data
save(world_shp, file = "world.Rda")

eezs_shp <- read_sf(here("data","shapefiles","World_EEZ_v11_20191118", "eez_v11.shp")) %>%  clean_names()%>%
  filter(pol_type == '200NM')  # select the 200 nautical mile polygon layer

#### Load EEZ polygons
save(eezs_shp, file = "eezs.Rda")

# vessels data
vessels <- read_csv(here("data","fishing-vessels-v2.csv"))
save(vessels, file = "vessels.Rda")

# Filtering vessel data to have fishing effort in 2020
vessels_2020 <- vessels %>%
  dplyr::select(- c(fishing_hours_2012:fishing_hours_2019))
