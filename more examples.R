# More small examples
library(ggplot2)
library(tidyverse)

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

# marine creature
seq(from=-10, to=10, by = 0.05) %>%
  expand.grid(x=., y=.) %>%
  ggplot(aes(x=(x^2+pi*cos(y)^2), y=(y+pi*sin(x)))) +
  geom_point(alpha=.1, shape=20, size=1, color="black")+
  theme_void()+coord_fixed()

# summoning cthultu
seq(-3,3,by=.01) %>%
  expand.grid(x=., y=.) %>%
  ggplot(aes(x=(x^3-sin(y^2)), y=(y^3-cos(x^2)))) +
  geom_point(alpha=.1, shape=20, size=0, color="white")+
  theme_void()+
  coord_fixed()+
  theme(panel.background = element_rect(fill="black"))+
  coord_polar()

# naive sunflower
a=pi*(3-sqrt(5))
n=500
ggplot(data.frame(r=sqrt(1:n),t=(1:n)*a),
       aes(x=r*cos(t),y=r*sin(t)))+
  geom_point(aes(x=0,y=0),
             size=190,
             colour="violetred")+
  geom_point(aes(size=(n-r)),
             shape=21,fill="gold",
             colour="gray90")+
  theme_void()+theme(legend.position="none")