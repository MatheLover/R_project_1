## Set up working directory
setwd("/Users/benchiang/R_project_1")

## Prepare libraries
library(pacman)
p_load("ggplot2", "tidyverse", "knitr", "viridis", "hrbrthemes", "gganimate", "ggrepel", "scales", "beepr", "tidytext", "babynames", "ggtext", "glue", "waterfalls", "extrafont", "sysfonts", "devtools", "colorspace", "ggthemes", "gsheet", "lubridate", "ggupset", "readstata13", "UpSetR", "treemapify", "magrittr", "ggiraph", "patchwork", "showtext", "HH")

## Import Data
df.gdp = read_csv("gdp-per-capita-growth.csv")
summary(df.gdp)

## Data Cleaning and Data Visualization 
#1. For line chart, select specific country/region and its GDP percapita
# Select HongKong
uni_bar_chart <- filter(df.gdp, Entity=="Hong Kong") 
uni_bar_chart <- dplyr::select(uni_bar_chart, Year, `GDP per capita growth (annual %)`)

# Plot line chart 
ggplot(uni_bar_chart, aes(x=Year, y=`GDP per capita growth (annual %)`)) + 
    geom_line(stat="identity", color="blue") +
    labs(title = "GDP per capita growth (annual%) by year",
       x = "Year")
    theme_minimal()
    
#2. For univariate bar chart, select regions, year, and its GDP percapita
# Select Asia & Pacific, African Eastern and Southern, and Europe Union
# uni_bar_chart_1 <- df.gdp %>%
 # filter(Entity=="East Asia & Pacific" | Entity == "Africa Eastern and Southern" | Entity == "European Union", Year == 2019) %>% 
  # dplyr::select(uni_bar_chart_1, Year, `GDP per capita growth (annual %)`)


ggplot(subset(df.gdp, ( Entity=="East Asia & Pacific" | Entity == "Africa Eastern and Southern" | Entity == "European Union" ) & Year == 2017), aes(x=Entity, y=`GDP per capita growth (annual %)`))+
  geom_bar(stat="identity", color="blue", fill="white", width=0.2)+
  scale_x_discrete(limits=c("East Asia & Pacific", "Africa Eastern and Southern", "European Union"))

    