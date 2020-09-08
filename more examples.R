#More small examples
# vertiginous spiral
library(tidyverse)
df <- data.frame(x=0, y=0)
for (i in 2:500){
  df[i,1] <- df[i-1,1]+((0.98)^i)*cos(i)
  df[i,2] <- df[i-1,2]+((0.98)^i)*sin(i)   
}
ggplot(df, aes(x,y)) + 
  geom_polygon()+
  theme_void()

# marine creature
library(tidyverse)
seq(from=-10, to=10, by = 0.05) %>%
  expand.grid(x=., y=.) %>%
  ggplot(aes(x=(x^2+pi*cos(y)^2), y=(y+pi*sin(x)))) +
  geom_point(alpha=.1, shape=20, size=1, color="black")+
  theme_void()+coord_fixed()

# summoning cthultu
library(tidyverse)
seq(-3,3,by=.01) %>%
  expand.grid(x=., y=.) %>%
  ggplot(aes(x=(x^3-sin(y^2)), y=(y^3-cos(x^2)))) +
  geom_point(alpha=.1, shape=20, size=0, color="white")+
  theme_void()+
  coord_fixed()+
  theme(panel.background = element_rect(fill="black"))+
  coord_polar()

#naive sunflower
library(ggplot2)
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