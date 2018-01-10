
library(tidyverse)

sec2 <- read.csv("/home/dan/Data/NASS/Grape_Crush/all_section_2/2016 gcbtb02.csv")
grape.dict <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/grape_dict.csv", stringsAsFactors = FALSE)


clean_grape_vector <- function(input){
  input <- str_to_lower(input)
  input <- str_replace_all(input, "[[:punct:]]", "")
  input <- str_trim(input)
}

clean_sec2 <- function(input){
  names(input) <- c("Variety", 1:10, "trash", 11:17, "total_current", "total_previous")
  
  input$Variety <- clean_grape_vector(as.character(input$Variety))  
  
  small <- input %>%
    inner_join(grape.dict) %>%
    select(-trash)
  
  for(i in 1:19){
    small[[i+1]] <- as.character(small[[i+1]])
    small[[i+1]] <- gsub(",", "", small[[i+1]])
    small[[i+1]] <- as.numeric(small[[i+1]])
  }
  
  return(small)
}

cleaned <- clean_sec2(sec2)

cleaned <- cleaned[c(1:18, 21)]

long <- cleaned %>%
  gather(District_Number, tons, -c(Variety, Type))

write.csv(long, "/home/dan/Data/NASS/Grape_Crush/all_section_2/clean_csv/sec2_clean_2016.csv", row.names = FALSE)
