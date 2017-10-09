g.names <- read.csv("/home/dan/Data/NASS/Grape Crush/gc_csv/grape_names.csv")
str(g.names)

# TRASH BELOW
g.names$Variety <- paste0(g.names$Variety)
g.names$Type <- paste0(g.names$Type)

clean_grape_vector <- function(input){
	input <- paste0(input)
	input <- str_to_lower(input)
	input <- str_replace_all(input, "[[:punct:]]", "")
	input <- str_trim(input)
}


grape_dict <- cbind(clean_grape_vector(g.names$Variety),
				 clean_grape_vector(g.names$Type))

grape_dict <- as.data.frame(grape_dict)
names(grape_dict) <- names(g.names)

write.csv(grape_dict, 
	file = "/home/dan/Data/NASS/Grape Crush/gc_csv/grape_dict.csv",
	row.names=FALSE)


