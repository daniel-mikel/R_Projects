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




# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/hi/hawaii_governor_aiona_vs_ige-4310.html"
path <- "#polling-data-full td"

hi_gov_2014 <- clean_rcp(url, path, 8)
names(hi_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "I", "D", "Spread")

write.csv(hi_gov_2014, 
	"/home/dan/Data/election/US national elections/hi_gov_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/hi/hawaii_romney_vs_obama-2954.html"
path <- "#polling-data-full td"

hi_ge_2012 <- clean_rcp(url, path, 7)
names(hi_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(hi_ge_2012, 
	"/home/dan/Data/election/US national elections/hi_ge_2012.csv",
	 row.names = FALSE)


# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/hi/hawaii_senate_lingle_vs_hirono-2138.html"
path <- "#polling-data-full td"

hi_sen_2012 <- clean_rcp(url, path, 6)
names(hi_sen_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(hi_sen_2012, 
	"/home/dan/Data/election/US national elections/hi_sen_2012.csv",
	 row.names = FALSE)




# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/hi/hawaii_governor_aiona_vs_abercrombie-1163.html"
path <- "#polling-data-full td"

hi_gov_2010 <- clean_rcp(url, path, 6)
names(hi_gov_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(hi_gov_2010, 
	"/home/dan/Data/election/US national elections/hi_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/hi/hawaii_senate_cavasso_vs_inouye-1726.html"
path <- "#polling-data-full td"

hi_sen_2010 <- clean_rcp(url, path, 6)
names(hi_sen_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(hi_sen_2010, 
	"/home/dan/Data/election/US national elections/hi_sen_2010.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/hi/hawaii_1st_district_djou_vs_hanabusa-1566.html"
path <- "#polling-data-full td"

hi_rep1_2010 <- clean_rcp(url, path, 6)
names(hi_rep1_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(hi_rep1_2010, 
	"/home/dan/Data/election/US national elections/hi_rep1_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/hi/hawaii_mccain_vs_obama-598.html"
path <- "#polling-data-full td"

hi_ge_2008 <- clean_rcp(url, path, 6)
names(hi_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(hi_ge_2008, 
	"/home/dan/Data/election/US national elections/hi_ge_2008.csv",
	 row.names = FALSE)



# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/hi_polls.html"
path <- "p+ table tr~ tr+ tr td"

hi_ge_2004 <- clean_rcp(url, path, 7)
names(hi_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
hi_ge_2004[1,] <- ""

write.csv(hi_ge_2004, 
	"/home/dan/Data/election/US national elections/hi_ge_2004.csv",
	 row.names = FALSE)	 
