# Installing required packages for this session
# You should only have to install the packages once
# note: set your working directory to the file location to make it easier to find the saved images later

install.packages("ggplot2") # used for nearly every example, gold standard in R plotting
install.packages("ggforce") # an extension to ggplot - used in circles example
install.packages("ggthemes")
install.packages("devtools") # this package allows us to install packages from github links
devtools::install_github("cutterkom/generativeart") # generativeart package also used in some examples
devtools::install_github("djnavarro/flametree")

install.packages("colourlovers") # gives us nice and pretty colour pallettes to use

# subsumes ggplot2, also adds a bunch of other packages that the examples take advantage of
install.packages("tidyverse") 

# You need to call the libraries everytime you open a new R session
library(ggplot2)
library(ggforce)
library(generativeart)
library(tidyverse)
library(colourlovers)
library(flametree)
library(ggthemes)
# other useful items
# list of R colors: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

# CREDITS:

# None of the examples in this workshop are our own creation. The credit for these belongs to:
# Sharla Gelfand (https://artstats.netlify.app)
# Fronkonstin (fronkonstin.com)
# Danielle Navarro (github.com/djnavarro)
# Katharina Brunner (github.com/cutterkom) - https://github.com/cutterkom/generativeart
