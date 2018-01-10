library(tidyverse)

gc <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/all_gc_clean.csv",
               stringsAsFactors = FALSE)

dict <- as.data.frame(cbind(c("white", "red", "table", "raisin"), c("all white", "all red", "all table", "all raisin")))
names(dict) <- c("Type", "All_of")

temp <- gc %>%
  left_join(dict, by = "Type") %>%
  select(-c(Variety)) %>%
  mutate(Variety = All_of) %>%
  select(-c(All_of))

gc_shiny <- gc %>%
  rbind(temp) %>%
  arrange(Variety, Year)

all_wine <- gc %>%
  filter(Type == "white" | Type == "red") %>%
  mutate(Type = "all wine",
         Variety = "all wine")

gc_shiny <- gc %>%
  rbind(temp) %>%
  rbind(all_wine) %>%
  arrange(Variety, Year)

write.csv(gc_shiny, "/home/dan/Data/NASS/Grape_Crush/gc_csv/gc_shiny.csv",
          row.names = FALSE)
