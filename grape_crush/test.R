
library(dplyr)

test <- read.csv("/home/dan/Data/NASS/test.csv", header = FALSE)
codes <- c("first", "second", "third", "fourth")

test[[1]] <- as.character(test[[1]])

function(one,two){
	for i in 2:length(one[,2]){
		if(one[(i),1] %in% two == FALSE){
			one[i,1] <- one[i-1,1]
		} else {
		}
	return(x)
	}
}


test[(2-1),1] %in% codes
match(test[1,1], codes)