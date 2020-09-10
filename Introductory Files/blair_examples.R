# Load packages
library(tidyverse)
library(colourlovers)
library(gsubfn)
library(stringr)
library(dplyr)
library(ggplot2)
library(ggforce)

#################################
# Saving Plots
#################################

#################################
# Basic Circles
#################################
# TIME: 

n <- 200 # number of circles

# coordinates are relative to each other
xsd <- 10 # sd for x coordinates
ysd <- 10 # sd for y coordinates
rmin <- 0.2 # min size of circles
rmax <- 10 # max size of circles

# make picture
ggplot() +
  geom_circle(aes(
    x0 = rnorm(n,mean=0,sd=xsd), # sample x coords
    y0 = rnorm(n,mean=0,sd=ysd), # sample y coords
    r = runif(n, min=rmin, max=rmax), # sample radii
    color = as.factor(1:n) # different colour for each
  )) +
  coord_fixed() + # make circles instead of ovals
  theme_void() + # no axis
  theme(legend.position  = "none", # no legend
        panel.background = element_rect(fill="gray20"), # dark background
        plot.background  = element_rect(fill="gray20"),
        axis.ticks       = element_blank(), # no axis
        panel.grid       = element_blank(),
        axis.title       = element_blank(),
        axis.text        = element_blank())
  scale_color_hue(l=55, c=40) # set colour scale

