library(sf)
library(tidyverse)

census_tract <- read_rds("Data/2016_census_tract.rds")

census_tract_van <- census_tract %>% 
	filter(`GEO_CODE (POR)` %>%	str_detect("^933"), GEO_LEVEL == 2) %>% 
	select(`GEO_CODE (POR)`, `DIM: Profile of Census Tracts (2247)`:`Dim: Sex (3): Member ID: [3]: Female`, -`Notes: Profile of Census Tracts (2247)`)
census_tract_van %>% write_rds("Data/census_tract_van.rds", compress = "xz", compression=9L)

ct_bndry <- st_read("../C407-2019/data/lct_000b16a_e/lct_000b16a_e.shp")
ct_bndry_van <- ct_bndry %>% filter(CMAUID == 933) %>% select(CTUID)
ct_bndry_van %>% write_rds("Data/ct_bndry_van.rds", "xz", compression = 9L)

csd_bndry <- st_read("../../../data/lcsd000b16a_e/lcsd000b16a_e.shp")
csd_bndry_van <- csd_bndry %>% filter(CMAUID == "933")

csd_bndry_van %>% write_rds("Data/csd_bndry_van.rds", "xz", compression = 9L)
