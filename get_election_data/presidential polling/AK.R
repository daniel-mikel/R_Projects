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
url <- "https://www.realclearpolitics.com/epolls/2016/president/ak/alaska_trump_vs_clinton_vs_johnson_vs_stein-6114.html"
path <- "td"

ak_ge_2016 <- clean_rcp(url, path, 8)
names(ak_ge_2016) <- c("Poll", "Date", "Sample", "R", "D", "L", "G", "Spread")

write.csv(ak_ge_2016, 
	"/home/dan/Data/election/US national elections/ak_ge_2016.csv",
	 row.names = FALSE)



# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/ak/alaska_governor_parnell_vs_walker-5215.html"
path <- "#polling-data-full td"

ak_gov_2014 <- clean_rcp(url, path, 7)
names(ak_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "I", "Spread")

write.csv(ak_gov_2014, 
	"/home/dan/Data/election/US national elections/ak_gov_2014.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ak/alaska_mccain_vs_obama-640.html"
path <- "#polling-data-full td"

ak_ge_2008 <- clean_rcp(url, path, 6)
names(ak_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ak_ge_2008, 
	"/home/dan/Data/election/US national elections/ak_ge_2008.csv",
	 row.names = FALSE)



# 2006

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/ak/alaska_senate-562.html"
path <- "#polling-data-full td"

ak_sen_2006 <- clean_rcp(url, path, 6)
names(ak_sen_2006) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ak_sen_2006, 
	"/home/dan/Data/election/US national elections/ak_sen_2006.csv",
	 row.names = FALSE)


# gov
url <- "https://www.realclearpolitics.com/epolls/2006/governor/ak/alaska_governor_race-68.html"
path <- "td"

ak_gov_2006 <- clean_rcp(url, path, 7)
names(ak_gov_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ak_gov_2006, 
	"/home/dan/Data/election/US national elections/ak_gov_2006.csv",
	 row.names = FALSE)



# 2004

#ge
url <- "https://www.realclearpolitics.com/Presidential_04/ak_polls.html"
path <- "p+ table div"

ak_ge_2004 <- clean_rcp(url, path, 7)
names(ak_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")

write.csv(ak_ge_2004, 
	"/home/dan/Data/election/US national elections/ak_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/ak_polls.html"
path <- "hr+ table tr~ tr+ tr div , hr+ table tr~ tr+ tr td"

ak_sen_2004 <- clean_rcp(url, path, 7)
names(ak_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")

write.csv(ak_sen_2004, 
	"/home/dan/Data/election/US national elections/ak_sen_2004.csv",
	 row.names = FALSE)