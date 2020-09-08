# ---
#   title: "R Notebook"
# output: html_notebook
# ---
#   ```{r, eval= FALSE}
# devtools::install_github("cutterkom/generativeart")
# ```
# ```{r}
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
# include a specific formula, for example:
my_formula <- list(
  x = quote(runif(1, -1, 1) * x_i^2 - sin(y_i^2)),
  y = quote(runif(1, -1, 1) * y_i^3 - cos(x_i^2))
)
# call the main function to create five images with a polar coordinate system
#generativeart::generate_img(formula = my_formula, nr_of_img = 1, polar = TRUE, filetype = "png", color = "green", background_color = "violet")
# ```
# ```{r}
# Load packages
library(tidyverse)
#install.packages("colourlovers")
library(colourlovers)
# Choose parameters for your flower
exp <- 2    # exponent of the function
ind <- 0.5 # independent term of the function
ite <- 13     # number of iterations
# The function
f <- function(x, y) x^exp + ind
# Reduce approach to iterate
julia <- function (z, n) Reduce(f, rep(1,n), accumulate = FALSE, init = z)
# This is the grid of complex: 3000x3000 between -2 and 2
complex_grid <- outer(seq(-2, 2, length.out = 3000), 1i*seq(-2, 2, length.out = 3000),'+') %>% as.vector()
# Iteration over grid of complex
complex_grid %>% sapply(function(z) julia(z, n=ite)) -> datos
# Pick a top random palette from COLOURLovers  
palette <- sample(clpalettes('top'), 1)[[1]] %>% swatch %>% .[[1]] %>% unique() %>% colorRampPalette()
# Build the data frame to do the plt (removing complex with INF modulus)
df <- data_frame(x=Re(complex_grid), 
                 y=Im(complex_grid), 
                 z=Mod(datos)) %>% 
  filter(is.finite(z)) %>% 
  mutate(col=cut(z,quantile(z, probs = seq(0, 1, 1/10)), include.lowest = TRUE))
# Limits of the data to frame the drawing
Mx=max(df$x)+0.2
mx=min(df$x)-0.2
My=max(df$y)+0.2
my=min(df$y)-0.2
# Here comes the magic of ggplot
df %>% 
  ggplot() + 
  geom_tile(aes(x=x, y=y, fill=col, colour = col)) + 
  scale_x_continuous(limits = c(mx, Mx), expand=c(0,0))+
  scale_y_continuous(limits = c(my, My), expand=c(0,0))+
  scale_colour_manual(values=palette(10)) +
  theme_void()+
  coord_fixed()+
  theme(legend.position = "none", plot.background = element_rect("black")) -> plot
# Do you like the drawing? Save it!
ggsave("first.png", plot, height=4, width=4, units='in', dpi=1200)