# library
library("tidyverse")
library("stringr")

# import and subset data
sec2 <- read.csv("/home/dan/Data/NASS/Grape_Crush/all_section_2/2016 gcbtb02.csv")
grape.dict <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/grape_dict.csv", stringsAsFactors = FALSE)

sec2 <- sec2[c(2, 4:nrow(sec2)),c(1:11, 13:19)]

names(sec2) <- c("Variety", paste0(1:17))

# clean data
clean_grape_ch_vector <- function(input){
	input <- str_to_lower(input)
	input <- str_replace_all(input, "[[:punct:]]", "")
	input <- str_trim(input)
}

sec2$Variety <- gsub("b/", "", sec2$Variety)
sec2$Variety <- str_trim(sec2$Variety)
sec2$Variety <- gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", sec2$Variety, perl=TRUE)

sec2$Variety <- clean_grape_ch_vector(sec2$Variety)
sec2 <- inner_join(sec2, grape.dict, by = "Variety")

test <- gather(sec2, key = "District_Number", value = names(sec2)[2:18])
head(test)

sec2$Variety