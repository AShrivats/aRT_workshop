## This can take a couple minutes to run and ultimately display the image, which is quite detailed

# Choose parameters
exp <- 6 # larger number -> more overlap of flowers
ind <- 0.6 # larger number -> less connection of flowers in the centre
ite <- 16 # larger number -> increased levels of fractal
num.grid.points <- 100 # larger number -> finer grid but longer runtime

#####
# Don't modify below unless you want to debug

# The function
f <- function(x, y) x^exp + ind

# Reduce approach to iterate
julia <- function (z, n) Reduce(f, rep(1,n), accumulate = FALSE, init = z)

complex_grid <- outer(seq(-2, 2, length.out = n), 1i*seq(-2, 2, length.out = n),'+') %>% as.vector()

# Iteration over grid of complex
datos <- complex_grid %>% sapply(function(z) julia(z, n=ite))

# Pick a top random palette from COLOURLovers (this will change your picture each time you rerun)
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
  theme(legend.position = "none")

