library("rvest")
library("tidyverse")

# scraping real clear politics for historic polling data
# the data will still have to be cleaned after this, but at least it's on my machine

# NOTE
  # sometimes the polling data for the GE goes for longer than a year
    # no year is given, when the year 'rolls over' only the DD-MM is listed...


clean_rcp <- function(url, path, column){
	webpage <- read_html(url)
	html <- html_nodes(webpage, path)
	data <- html_text(html, trim = TRUE)

	matrix <- matrix(data, ncol = column, byrow = TRUE)
	df <- as.data.frame(matrix, stringsAsFactors = FALSE)

	return(df)
}




# 2016

# ge
url <- "https://www.realclearpolitics.com/epolls/2016/president/nv/nevada_trump_vs_clinton_vs_johnson-6004.html"
path <- "#polling-data-full td"

nv_ge_2016 <- clean_rcp(url, path, 8)
names(nv_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "Spread")

write.csv(nv_ge_2016, 
	"/home/dan/Data/election/US national elections/nv_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://realclearpolitics.com/epolls/2016/senate/nv/nevada_senate_heck_vs_cortez_masto-5982.html"
path <- "#polling-data-full td"

nv_sen_2016 <- clean_rcp(url, path, 7)
names(nv_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(nv_sen_2016, 
	"/home/dan/Data/election/US national elections/nv_sen_2016.csv",
	 row.names = FALSE)