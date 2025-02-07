
here::i_am("codes/nyt_table.R")

connections <- readRDS(
  file = here::here("clean_dataset/data_clean.rds")
)

library(gtsummary)
library(dplyr)

connections
con_summary <- connections %>% 
  tbl_summary(
    statistic = list(
      all_categorical() ~ "{n} ({p}%)",  # For categorical variables
      all_continuous() ~ "{median} ({p25}, {p75})"  # For continuous variables
    ),
    include = Group.Level, Year
  )

con_summary

saveRDS(
  con_summary,
  file = here::here("figures/con_summary.rds")
)
