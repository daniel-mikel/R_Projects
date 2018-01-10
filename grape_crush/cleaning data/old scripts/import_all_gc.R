# import all grape crush xls files


# libraries
# library("gdata")
library("plyr")
library("tidyverse")
library("stringr")

# import all section 8's
x <- "/home/dan/Data/NASS/Grape_Crush/all_section_8/csv/"

files <- list.files(path = x, full.names = TRUE)
files
imported <- llply(files, read.csv, stringsAsFactors = FALSE)

short <- lapply(imported, function(x) head(x)) # for testing

uni <- ldply(imported, rbind) # does weird shit, need to keep column heads identical across imported df

uni <- uni %>%
	select(Variety, Base.Price.Per.Ton, Brix.Code, Tons, Year)

# import dictionaries
	# could probably do this on another script...
grape.dict <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/grape_dict.csv", stringsAsFactors = FALSE)

rep("DISTRICT", 17)
rep(1:17)
districts <- paste(rep("DISTRICT", 17), rep(1:17))
dist_key <- cbind.data.frame(districts, districts, rep(1:17))
names(dist_key) <- c("key", "District", "District_Number")
dist_key$key <- as.character(dist_key$key)
dist_key$District <- as.character(dist_key$District)

####################
# create functions #
####################

clean_grape_ch_vector <- function(input){
	input <- str_to_lower(input)
	input <- str_replace_all(input, "[[:punct:]]", "")
	input <- str_trim(input)
}

clean_grape_num_vector <- function(input){
	input <- as.numeric(input)
}


#########
# clean #
#########
# merge to get column of only districts
uni$Variety <- gsub("b/", "", uni$Variety)
uni$Variety <- str_trim(uni$Variety)
uni$Variety <- gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", uni$Variety, perl=TRUE)

g.crush <- left_join(uni, dist_key, by = c("Variety" = "key"))

# carry down district and variety columns

g.crush$Variety <- clean_grape_ch_vector(g.crush$Variety)
g.crush$Variety[g.crush$Variety == ""] <- NA
g.crush$Year[g.crush$Year == ""] <- NA

full.g.crush <- g.crush %>%
	fill(District)%>%
	fill(Variety) %>%
	fill(Year) %>%
	fill(District_Number)

# Variety
	# fill columns first, then antijoin df based on variety dictionary
grape.dict$Variety <- as.character(grape.dict$Variety)
clean.g.crush <- inner_join(full.g.crush, grape.dict, by = "Variety")

gc <- clean.g.crush %>%
filter(Base.Price.Per.Ton > 0) %>%
	arrange(Year)

# save for later
write.csv(gc, 
	file = "/home/dan/Data/NASS/Grape_Crush/gc_csv/all_gc_clean.csv",
	row.names=FALSE)


table((unique(grape.dict$Variety) == "other table"))["TRUE"]