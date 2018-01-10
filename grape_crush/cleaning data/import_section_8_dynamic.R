

# libraries
library("plyr")
library("tidyverse")
library("stringr")
library("gdata")



to_csv <- "/home/dan/Data/NASS/Grape_Crush/all_section_8/clean_csv/"
to_xls <- "/home/dan/Data/NASS/Grape_Crush/all_section_8/xls/"
district_desc <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/district_key.csv")
grape.dict <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/grape_dict.csv", stringsAsFactors = FALSE)

# convert .xls to .csv and add year column

files <- list.files(path = to_xls, full.names = TRUE)
files

Make_Year <- function(folder){
	files <- list.files(path = folder, full.names = TRUE)
	for(i in 1:length(files)){
		curr_year <- gsub(folder, "", files[i])
		curr_year <- gsub("/gc", "", curr_year)
		curr_year <- gsub(".xls", "", curr_year)
		print(curr_year)
		data <- read.xls(files[i])
		names(data) <- c("Variety", "Base.Price.Per.Ton", "Trash", "Brix.Code", "Tons")
		data$Year <- curr_year
		write.csv(data, 
			paste0("/home/dan/Data/NASS/Grape_Crush/all_section_8/clean_csv/gc", curr_year, ".csv"),
			row.names = FALSE)
	}
}

Make_Year(to_xls)




# import newly created csv

files <- list.files(path = to_csv, full.names = TRUE)
files
imported <- llply(files, read.csv, stringsAsFactors = FALSE)

short <- lapply(imported, function(x) head(x)) # for testing

uni <- ldply(imported, rbind) 

uni <- uni %>%
	select(Variety, Base.Price.Per.Ton, Brix.Code, Tons, Year)

# import dictionaries
	# could probably do this on another script...

districts <- paste(rep("DISTRICT", 17), rep(1:17))
dist_key <- cbind.data.frame(districts, districts, rep(1:17))
new_dist_key <- cbind(districts, rep(1:17))

identical(dist_key, new_d)

names(dist_key) <- c("key", "District", "District_Number")
dist_key$key <- as.character(dist_key$key)
dist_key$District <- as.character(dist_key$District)




# create functions

clean_grape_vector <- function(input){
	input <- str_to_lower(input)
	input <- str_replace_all(input, "[[:punct:]]", "")
	input <- str_trim(input)
}



# clean 
	# merge to get column of only districts
uni$Variety <- gsub("b/", "", uni$Variety)
uni$Variety <- str_trim(uni$Variety)
uni$Variety <- gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", uni$Variety, perl=TRUE)

g.crush <- left_join(uni, dist_key, by = c("Variety" = "key"))




# carry down district and variety columns

g.crush$Variety <- clean_grape_vector(g.crush$Variety)
g.crush$Variety[g.crush$Variety == ""] <- NA
g.crush$Year[g.crush$Year == ""] <- NA

full.g.crush <- g.crush %>%
	fill(District)%>%
	fill(Variety) %>%
	fill(Year) %>%
	fill(District_Number)



# Variety
	# fill columns first, then inner_join() df based on variety dictionary
grape.dict$Variety <- as.character(grape.dict$Variety)
clean.g.crush <- inner_join(full.g.crush, grape.dict, by = "Variety")

clean.g.crush$Base.Price.Per.Ton <- gsub(",", "", clean.g.crush$Base.Price.Per.Ton)
clean.g.crush$Tons <- gsub(",", "", clean.g.crush$Tons)
clean.g.crush$Base.Price.Per.Ton <- as.numeric(clean.g.crush$Base.Price.Per.Ton)
clean.g.crush$Tons <- as.numeric(clean.g.crush$Tons)


gc <- clean.g.crush %>%
	filter(Base.Price.Per.Ton > 0) %>%
	arrange(Year)





# put the district key in
	# this adds about 4 MB but is used a lot for graphs
gc$District_Number <- as.factor(gc$District_Number)
district_desc$District_Number <- as.factor(district_desc$District_Number)
gc <- gc %>%
  left_join(district_desc)



# save for later
write.csv(gc, 
	file = "/home/dan/Data/NASS/Grape_Crush/gc_csv/all_gc_clean.csv",
	row.names=FALSE)


unique(gc$Year)
