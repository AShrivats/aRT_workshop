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
  
  
  ########
  # vertiginous spiral doesn't seem to work - ask blair to check if its just me
  # vertiginous spiral
  df <- data.frame(x=0, y=0)
  for (i in 2:500){
    df[i,1] <- df[i-1,1]+((0.98)^i)*cos(i)
    df[i,2] <- df[i-1,2]+((0.98)^i)*sin(i)
  }
  ggplot(df, aes(x,y)) +
    geom_polygon()+
    theme_void()
  
  # vertiginous spiral
  numcoords <- 10 # number of coordinates
  numvert <- 8 # number of vertices
  
  xmult <- 30
  ymult <- 14
  
  ids <- as.factor(1:numcoords) 
  values <- data.frame(
    id = ids,
    value = seq(1,2,1/(numcoords-1))
  ) 
  
  xvals <- numeric(numcoords*numvert)
  yvals <- numeric(numcoords*numvert)
  for (i in 2:(numcoords*numvert)){
    xvals[i] <- xvals[i-1] + ((xmult)^i)*cos(i)
    yvals[i] <- yvals[i-1] + ((ymult)^i)*sin(i)   
  }
  
  coords <- data.frame(
    id = rep(ids, each = numvert),
    x = xvals,
    y = yvals
  )
  
  datapoly <- merge(values, coords, by = c("id"))
  
  ggplot(datapoly, aes(x = x, y = y)) +
    geom_polygon(aes(fill = value, group = id))


