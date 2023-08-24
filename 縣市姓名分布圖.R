library(tidyverse)
library(readxl)
library(sf)

twmap <- st_read("C:/Users/USER/Documents/R/TOWN_MOI_1120317.shp")
twmap<- st_crop(twmap, xmin = 119, xmax = 124, ymin = 20.5, ymax = 26)  


cdata <- read_csv("C:/Users/USER/Documents/R/opendata10706L010.csv") 

twmap <- twmap %>% mutate(fullname = str_c(COUNTYNAME, TOWNNAME))

merged_data <- inner_join(twmap, cdata, by = c("fullname"="site_id"))


county_of_interest <- "·s¥_¥«"


most_common_name <- merged_data %>%
    filter(COUNTYNAME == county_of_interest) %>%
    group_by(TOWNNAME) %>%
    filter(row_number() == 1) 

ggplot() +
    geom_sf(data = most_common_name, aes(fill = family_name)) +
    geom_sf_text(data = most_common_name, aes(label = TOWNNAME), family = "STHeiti") +
    theme(text = element_text(family = "STHeiti"))


ggsave("NAMe.jpg", width = 12, height =10)