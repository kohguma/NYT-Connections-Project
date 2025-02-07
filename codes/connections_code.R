
setwd("/Users/michellekoh/Documents/github_projects")

here::i_am("connections_predictions/connections_code.R")

#load necessary packages
library(pacman)
pacman::p_load(
  dplyr,
  ggplot2,
  treemap,
  lubridate
)

devtools::install_github("timelyportfolio/d3treeR")
library(d3treeR)
library(RColorBrewer)

#read in data
connections <- read.csv("connections_predictions/Connections_Data.csv")
#checking the structure of the dataset
head(connections)
str(connections)
#change puzzle date to a date variable
connections$Puzzle.Date <- as.Date(connections$Puzzle.Date)

connections <- connections %>% 
  mutate(Year = year(Puzzle.Date)) 
  
connections$Year <- as.character(connections$Year)

yearly_top_20 <- connections%>%
  group_by(Year, Group.Level, Group.Name) %>%
  summarise(Frequency = n(), .groups = "drop") %>%
  arrange(Year, Group.Level, desc(Frequency)) %>%
  group_by(Year, Group.Level) %>%
  slice_max(Frequency, n = 10, with_ties = FALSE) %>%
  ungroup()

print(yearly_top_20)




#treemap vis
nyt_tree <- treemap(yearly_top_20,
                    index = c("Year", "Group.Level", "Group.Name"),
                    vSize = "Frequency" ,
                    type="index",
                    palette = "Pastel1",
                    bg.labels=c("white"),
                    align.labels=list(
                      c("center", "center"), 
                      c("right", "bottom")))

nyt_tree



inter_tree <-d3tree2( nyt_tree,  
rootname = "Connections Theme Frequency by Year & Levels of Difficulty" )

inter_tree


