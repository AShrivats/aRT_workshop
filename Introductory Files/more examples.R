# More small examples
# need tidyverse for all of these

#################################
# Naive Sunflower
#################################

a = pi*(3-sqrt(5)) # amount of spiral overlap (try changing parameters, but notice it is cyclical)
n = 500 # number of circles to plot
ggplot(data.frame(r=sqrt(1:n),t=(1:n)*a), aes(x=r*cos(t),y=r*sin(t))) + # coordinates of interior circles
  geom_point(aes(x=0,y=0), size=190, colour="violetred") + # plot large exterior circle
  geom_point(aes(size=(n-r)), shape=21,fill="gold", colour="gray90") + # plot interior circles
  theme_void() + theme(legend.position="none") # no background or legend

#################################
# Marine Creature
#################################

xylim <- 5 # grid endpoints (larger endpoints -> longer "tail" of creature)
xyfine <- 0.05 # fineness of grid (smaller number -> increased runtime but more detailed image)

grid.points <- seq(from=-xylim, to=xylim, by = xyfine) %>% expand.grid(x=., y=.) %>% # make grid within xy endpoints at desired fineness
  mutate(sx = x^2 + pi*cos(y)^2, sy = y + pi*sin(x)) %>% # transform grid.points to overlap in squiggly shapes (try changing exponents on any terms)
  select(-x,-y) %>% rename(x=sx, y=sy) # drop original grid coordinates

# plot image
ggplot(data=grid.points, aes(x,y)) + 
  geom_point(alpha=0.5, shape=20, size=1, aes(color=as.factor(x))) + # plot points that make creature (higher alpha -> darker points)
  coord_fixed() + # preserve desired shape
  theme_void() + # no axis
  theme(legend.position  = "none", # no legend
        axis.ticks       = element_blank(), # no axis
        panel.grid       = element_blank(),
        axis.title       = element_blank(),
        axis.text        = element_blank()) +
  scale_color_hue(l=45, c=30) # set colour scale

#################################
# Summoning Cthultu
#################################

xylim <- 3 # grid endpoints (affects how far the "rays" extend)
xyfine <- 0.01 # fineness of grid (more fine grid -> increased runtime but more detailed image)

grid.points <- seq(from=-xylim, to=xylim, by = xyfine) %>% expand.grid(x=., y=.) %>% # make grid within xy endpoints at desired fineness
  mutate(sx = x^3 - sin(y^2), sy = y^3 - cos(x^2)) %>% # transform grid.points to overlap in squiggly shapes (try changing exponents on any terms)
  select(-x,-y) %>% rename(x=sx, y=sy) # drop original grid coordinates

# plot image
ggplot(data=grid.points, aes(x,y)) + 
  geom_point(alpha=0.1, shape=20, size=0, color='white') + # plot points that make creature (higher alpha -> brighter points)
  coord_polar() + # new coordinate system
  theme_void() + # no axis
  theme(legend.position  = "none", # no legend
        axis.ticks       = element_blank(), # no axis
        panel.grid       = element_blank(),
        axis.title       = element_blank(),
        axis.text        = element_blank(),
        panel.background = element_rect(fill="black")) # make background dark