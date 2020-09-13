
# Our first example is kind of ugly, but very simple. We are simply going to plot circles
n <- 5
ggplot() +
  geom_circle(aes(
    x0 = rnorm(n),
    y0 = rnorm(n),
    r = runif(n)
  )) +
  theme_void() # we want this theme because we really dont want anything in the background
# this is really simple and basic, but this is indeed generative art.
# the randomness is in the size of the circles and their locations
# We can change this a little bit... what if we add more circles
n <- 100
ggplot() +
  geom_circle(aes(
    x0 = rnorm(n),
    y0 = rnorm(n),
    r = runif(n)
  )) +
  theme_void()

# Still looks pretty ugly, but it's visually a little more interesting now
# What if we want to get rid of a lot of the overlap... it seems to concentrate
# in the middle. 
n <- 100
ggplot() +
  geom_circle(aes(
    x0 = runif(n),
    y0 = runif(n),
    r = runif(n)
  )) +
  theme_void()
# by changing only a few things, we've significantly changed the look of the plot

# finally, let's add some colour and parameters to tweak
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

#################################
# Advanced Example
#################################

# We can build these up and do incredibly complex things with them, such as the example below. 
# makesure you set working directory to current file location before running the code below
# set the paths
IMG_DIR <- "img/"
IMG_SUBDIR <- "everything/"
IMG_SUBDIR2 <- "handpicked/"
IMG_PATH <- paste0(IMG_DIR, IMG_SUBDIR)

LOGFILE_DIR <- "logfile/"
LOGFILE <- "logfile.csv"
LOGFILE_PATH <- paste0(LOGFILE_DIR, LOGFILE)
# set working directory to file location to make it easier to find the saved image
# create the directory structure
generativeart::setup_directories(IMG_DIR, IMG_SUBDIR, IMG_SUBDIR2, LOGFILE_DIR)
formula <- list(
  x = quote(rnorm(5) * x_i - cos(y_i^2)),
  y = quote(rnorm(5) * y_i^2 + sin(x_i))
)
generate_img(
  formula = formula,
  polar = FALSE,
  nr_of_img = 1
)

# this example is significantly more complex, and requires functions that are hidden out of sight,
# which we cannot edit.