here::i_am("codes/nyt_data.R")

absolute_path_to_data <- here::here("dataset", "Connections_Data.csv")

connections <- read.csv(absolute_path_to_data, header = TRUE)
#change puzzle date to a date variable
connections$Puzzle.Date <- as.Date(connections$Puzzle.Date)
connections <- connections %>% 
  mutate(Year = year(Puzzle.Date)) 
connections$Year <- as.character(connections$Year)


saveRDS(
  connections, 
  file = here::here("clean_dataset/data_clean.rds")
)

