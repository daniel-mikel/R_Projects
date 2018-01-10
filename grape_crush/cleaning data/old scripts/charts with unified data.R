
# packages
library(tidyverse)



# import gc 
gc <- read.csv(file = "/home/dan/Data/NASS/Grape_Crush/gc_csv/all_gc_clean.csv", stringsAsFactors = FALSE)


# explore gc data
gc$Base.Price.Per.Ton <- as.numeric(gc$Base.Price.Per.Ton)
gc$Brix.Code <- as.numeric(gc$Brix.Code)
gc$Tons <- as.numeric(gc$Tons)
gc$Year <- as.integer(gc$Year)

gc %>%
	group_by(Year) %>%
	summarize(n = n())

unique(gc$Variety)

table((unique(gc$Variety) == "aglianico"))["TRUE"] # check if grape variety is on list



# create ggplot