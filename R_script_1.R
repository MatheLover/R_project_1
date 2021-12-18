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
       x = "Year")+ 
    theme_minimal()
    
#2. For univariate bar chart, select regions, year, and its GDP percapita growth
ggplot(subset(df.gdp, ( Entity=="East Asia & Pacific" | Entity == "Africa Eastern and Southern" | Entity == "European Union" ) & Year == 2017), aes(x=Entity, y=`GDP per capita growth (annual %)`))+
  geom_bar(stat="identity", fill="steelblue", width=0.2)+
  labs(title = "GDP per capita growth (annual%) in different regions in 2017",
       x = "Region")+
  geom_text(aes(label= (round(`GDP per capita growth (annual %)`,2))), vjust=-0.3, size=3)+
  scale_x_discrete(expand=c(0.1,0.1),limits=c("East Asia & Pacific", "Africa Eastern and Southern", "European Union")) + 
  scale_color_brewer(palette="Dark2")+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank())+
  theme(panel.background = element_blank())+
  theme_classic()

#3. For multivariate bar chart, select several areas in different years and its GDP percapita growth
uni_bar_chart_1 <- filter(df.gdp, (Entity=="Hong Kong" | Entity=="United States" | Entity=="United Kingdom" | Entity=="Japan") & (Year == 2017 | Year == 2018 | Year == 2019)  ) 
ggplot(uni_bar_chart_1, aes(fill=Entity, y=`GDP per capita growth (annual %)`, x=Year, label=`GDP per capita growth (annual %)`))+
  labs(title = "GDP per capita growth (annual%) in different areas from 2017 to 2019")+
  geom_bar(position="dodge", stat="identity")+
  geom_text(position = position_dodge(width= 0.9), vjust= -0.2, aes(label=round(`GDP per capita growth (annual %)`, 2)))+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.ticks.x = element_blank())+
  theme(panel.background = element_blank())+
  scale_fill_brewer(palette = "Pastel1")
    