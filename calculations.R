rm(list = ls()); gc(); gc()
# options(java.parameters = "-Xmx4096m")#8192
# options(java.parameters = "-XX:-UseConcMarkSweepGC")
# options(java.parameters = "-XX:-UseGCOverheadLimit")
options(bitmapType='cairo')
options(scipen = 999)
#library(bbbi)
library(ggplot2)
#library(RODBC)
library(dplyr)
#library(tidyr)
#library(data.table)

# Define your workspace: "X:/xxx/"
#wd <- "D:/github/statistics101/"
wd <- path.expand("~/Documents/github/statistics101")
setwd(wd)


set.seed(42)

## colour-blind palettes: 
# The palette with grey:
cbgPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# The palette with black:
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# x values for plotting
x <- seq(-5, 5, by = 0.01)


ggplot()+
  # poisson distribution
  geom_point(
    aes(x=unique(as.integer(x)), y=dpois(unique(as.integer(x)), 2)), size = 3.5, colour = cbgPalette[2]
  )+
  # exponential distribution
  geom_line(
    aes(x=x[x>0], y=dexp(x[x>0], 0.5)), size = 1.5, colour = cbgPalette[3]
  )+
  # uniform distribution
  geom_line(
    aes(x=x, y=dunif(x, -4, 4)), size = 1.5, colour = cbgPalette[4]
  )+
  # normal distribution
  geom_line(
    aes(x=x, y=dnorm(x)), size = 1.5, colour = cbgPalette[6]
  )+
#   # lognormal distribution
#   geom_line(
#     aes(x=x, y=dlnorm(x)), size = 1.5, colour = cbgPalette[6]
#   )+
  labs(x = "", y = "", title = "Statistical distributions")
  

set.seed(1001);poisson <- rpois(50, 5)+10
hist(poisson)

ggplot()+
  geom_point(aes(x=poisson, y=1), position = position_jitter(w = 0.01, h = 0.05))

set.seed(1001);exp <- rexp(50, 5)+10
hist(exp)

load("commute-distances.Rdata")

dta.distance %>% 
  filter(minutes < 120) %>% 
  ggplot()+
  geom_histogram(aes(x=minutes))

mean(dta.distance$minutes)
median(dta.distance$minutes)



library(readr)
library(dplyr)
library(tidyr)

f.sum.sec <- function(t){
  time <- strsplit(trimws(t), split = ":")
  sapply(time, function(x){tt <- as.integer(x); return((tt[1]*60+tt[2])/3600)})
}



sspy <- readr::read_csv("steamspy-2016-chart.csv") %>% 
  setNames(make.names(names(.))) %>% 
  tidyr::separate(Playtime..Median., c("playtime_avg", "playtime_med"), sep = "\\(", remove = FALSE) %>% 
  mutate(
    playtime_avg_h = f.sum.sec(playtime_avg),
    playtime_med_h = f.sum.sec(gsub(")", "", playtime_med))
  )











