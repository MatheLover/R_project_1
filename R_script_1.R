## Set up working directory
setwd("/Users/benchiang/R_project_1")

## Prepare libraries
library(pacman)
p_load("ggplot2", "tidyverse", "knitr", "viridis", "hrbrthemes", "gganimate", "ggrepel", "scales", "beepr", "tidytext", "babynames", "ggtext", "glue", "waterfalls", "extrafont", "sysfonts", "devtools", "colorspace", "ggthemes", "gsheet", "lubridate", "ggupset", "readstata13", "UpSetR", "treemapify", "magrittr", "ggiraph", "patchwork", "showtext", "HH")

## Import Data
df.gdp = read_csv("gdp-per-capita-growth.csv")
summary(df.gdp)

## Data Cleaning 
#1. For simple bar chart, select specific country/region and its GDP percapita

# Select Hong Kong 
uni_bar_chart <- filter(df.gdp, Entity=="Hong Kong") 
uni_bar_chart <- dplyr::select(uni_bar_chart, Year, `GDP per capita growth (annual %)`)

# Select Asia  
uni_bar_chart_1 <- df.gdp %>%
  filter(Entity=="East Asia & Pacific") %>%
  dplyr::select(Year,`GDP per capita growth (annual %)` )


## Data Visualization 
#1. Plot GDP growth in HongKong
ggplot(uni_bar_chart, aes(x=Year, y=`GDP per capita growth (annual %)`)) + 
    geom_bar(stat="identity", fill="steelblue") +
    theme_classic() 