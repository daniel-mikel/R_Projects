
library("xlsx")
library("tidyverse")
library("stringr")

# import files
g.crush <- read.csv("/home/dan/Data/NASS/Grape Crush/gc_csv/201603gcbtb08.csv")
grape.dict <- read.csv("/home/dan/Data/NASS/Grape Crush/gc_csv/grape_dict.csv")

# same function used to clean grape.dict names
	# this ensures that strings are similar
clean_grape_vector <- function(input){
	input <- paste0(input)
	input <- str_to_lower(input)
	input <- str_replace_all(input, "[[:punct:]]", "")
	input <- str_trim(input)
}


names(g.crush) <- c("Variety", "Price", "TRASH", "Brix", "Tons")
g.crush$TRASH <- NULL

# create dictionary of districts
rep("DISTRICT", 17)
rep(1:17)

districts <- paste(rep("DISTRICT", 17), rep(1:17))
dist_key <- cbind.data.frame(districts, districts, rep(1:17))
names(dist_key) <- c("key", "District", "District_Number")
dist_key$key <- as.character(dist_key$key)
dist_key$District <- as.character(dist_key$District)

str(dist_key)

# merge to get column of only districts
g.crush$Variety <- as.character(g.crush$Variety)
g.crush$Variety <- str_trim(g.crush$Variety) # get rid of white spaces at the end of strings

g.crush <- left_join(g.crush, dist_key, by = c("Variety" = "key"))

# carry down district and variety columns

g.crush$Variety <- clean_grape_vector(g.crush$Variety)
g.crush$Variety[g.crush$Variety == ""] <- NA

full.g.crush <- g.crush %>%
	fill(District)%>%
	fill(Variety) %>%
	fill(District_Number)

# Variety
	# fill columns first, then antijoin df based on variety dictionary

str(full.g.crush)
str(grape.dict)
grape.dict$Variety <- as.character(grape.dict$Variety)


clean.g.crush <- inner_join(full.g.crush, grape.dict, by = "Variety")
View(clean.g.crush)

# save for later
write.csv(clean.g.crush, 
	file = "/home/dan/Data/NASS/Grape Crush/gc_csv/gc2016_clean.csv",
	row.names=FALSE)
