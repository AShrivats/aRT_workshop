
# Simple overlaid circles
library(ggplot2)
library(ggforce)
n <- 5
ggplot() +
  geom_circle(aes(
    x0 = rnorm(n),
    y0 = rnorm(n),
    r = runif(n)
  )) +
  theme_void()

# Larger number of simple overlaid circles
n <- 100
ggplot() +
  geom_circle(aes(
    x0 = rnorm(n),
    y0 = rnorm(n),
    r = runif(n)
  )) +
  theme_void()
# more complex, using generative art package

install.packages("devtools")
devtools::install_github("cutterkom/generativeart")
library(generativeart)
# set the paths
IMG_DIR <- "img/"
IMG_SUBDIR <- "everything/"
IMG_SUBDIR2 <- "handpicked/"
IMG_PATH <- paste0(IMG_DIR, IMG_SUBDIR)

LOGFILE_DIR <- "logfile/"
LOGFILE <- "logfile.csv"
LOGFILE_PATH <- paste0(LOGFILE_DIR, LOGFILE)

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