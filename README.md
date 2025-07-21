# Taiwan Surname Distribution by Township

This project visualizes the most common surnames in each township of a selected county in Taiwan using shapefile map data and official name distribution data.

## 📁 Files

- `縣市姓名分布圖.R` — Main R script that loads shapefile and name data, processes and visualizes surname distribution.
- `NAMe.jpg` — Output image showing the distribution of the most common surnames by township.
- `opendata10506N020.csv` — Raw dataset (possibly outdated or unused).
- `mapdata202303230423 (1).zip` — Compressed shapefile data (used by the script).

## 🗺️ What It Does

The R script:
1. Reads and crops shapefile map data of Taiwan townships.
2. Loads name frequency data from government open data.
3. Merges map and name data by matching township names.
4. Filters for one specific county and identifies the most common surname per township.
5. Visualizes the distribution using `ggplot2` with `geom_sf`.

## 🧾 Dependencies

You’ll need the following R packages:

```r
library(tidyverse)
library(readxl)
library(sf)
