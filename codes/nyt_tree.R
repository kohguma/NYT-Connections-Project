here::i_am("codes/nyt_tree.R")


connections <- readRDS(
  file = here::here("clean_dataset/data_clean.rds")
)

library(pacman)
pacman::p_load(
  dplyr,
  ggplot2,
  treemap,
  lubridate,
  d3treeR,
  RColorBrewer
)

#install if you haven't
devtools::install_github("timelyportfolio/d3treeR")


yearly_top_20 <- connections%>%
  group_by(Year, Group.Level, Group.Name) %>%
  summarise(Frequency = n(), .groups = "drop") %>%
  arrange(Year, Group.Level, desc(Frequency)) %>%
  group_by(Year, Group.Level) %>%
  slice_max(Frequency, n = 10, with_ties = FALSE) %>%
  ungroup()


nyt_tree <- treemap(yearly_top_20,
                    index = c("Year", "Group.Level", "Group.Name"),
                    vSize = "Frequency" ,
                    type="index",
                    palette = "Pastel1",
                    bg.labels=c("white"),
                    align.labels=list(
                      c("center", "center"), 
                      c("right", "bottom")))

inter_tree <-d3tree2( nyt_tree,  
    rootname = "Connections Theme Frequency by Year & Levels of Difficulty" )


library(htmlwidgets)

saveWidget(inter_tree, 
           here::here("figures/interactive_treemap.html"), selfcontained = TRUE)
