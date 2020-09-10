# Installing required packages for this session
# note: set your working directory to the file location to make it easier to find the saved images later

install.packages("ggplot2") # used for nearly every example, gold standard in R plotting
install.packages("ggforce") # an extension to ggplot - used in circles example

install.packages("devtools") # this package allows us to install packages from github links
devtools::install_github("cutterkom/generativeart") # generativeart package also used in some examples

# subsumes ggplot2, also adds a bunch of other packages that the examples take advantage of
install.packages("tidyverse") 

library(ggplot2)
library(ggforce)
library(generativeart)
library(tidyverse)

# other useful items
# list of R colors: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf