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
url <- "https://www.realclearpolitics.com/epolls/2016/president/de/delaware_trump_vs_clinton-5900.html"
path <- "#polling-data-full td"

de_ge_2016 <- clean_rcp(url, path, 7)
names(de_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(de_ge_2016, 
	"/home/dan/Data/election/US national elections/de_ge_2016.csv",
	 row.names = FALSE)



# 2010

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/de/delaware_senate_oadonnell_vs_coons-1670.html"
path <- "#polling-data-full td"

de_sen_2010 <- clean_rcp(url, path, 6)
names(de_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(de_sen_2010, 
	"/home/dan/Data/election/US national elections/de_sen_2010.csv",
	 row.names = FALSE)

# at large congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/de/delaware_atlarge_carney_vs_urquhart-1681.html"
path <- "#polling-data-full td"

de_rep1_2010 <- clean_rcp(url, path, 6)
names(de_rep1_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(de_rep1_2010, 
	"/home/dan/Data/election/US national elections/de_rep1_2010.csv",
	 row.names = FALSE)



# 2004
url <- "https://www.realclearpolitics.com/Presidential_04/de_polls.html"
path <- "p+ table tr~ tr+ tr td"

de_ge_2004 <- clean_rcp(url, path, 7)
names(de_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
de_ge_2004[1,] <- ""

write.csv(de_ge_2004, 
	"/home/dan/Data/election/US national elections/de_ge_2004.csv",
	 row.names = FALSE)