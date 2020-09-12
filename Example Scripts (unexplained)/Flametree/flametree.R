# flametree example
# need ggthemes and flametree package installed and loaded
# reference documents: https://github.com/djnavarro/flametree/tree/master/docs/reference
flametree_grow(
  seed = 1234,
  time = 2,
  split = 4
) %>%
  flametree_plot(
    background = "pink",
    palette = "ggthemes::Classic Red-Green Light"
  )

dat <- flametree_grow(seed = 2, time = 5) # data structure
img <- flametree_plot(tree = dat)          # ggplot object
ggsave("flametree2.png")