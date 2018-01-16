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
url <- "https://www.realclearpolitics.com/epolls/2016/president/ky/kentucky_trump_vs_clinton_vs_johnson_vs_stein-6111.html"
path <- "#polling-data-full td"

ky_ge_2016 <- clean_rcp(url, path, 9)
names(ky_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

write.csv(ky_ge_2016, 
	"/home/dan/Data/election/US national elections/ky_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/ky/kentucky_senate_paul_vs_gray-5983.html"
path <- "#polling-data-full td"

ky_sen_2016 <- clean_rcp(url, path, 7)
names(ky_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ky_sen_2016, 
	"/home/dan/Data/election/US national elections/ky_sen_2016.csv",
	 row.names = FALSE)


# 2015

# gov
url <- "https://www.realclearpolitics.com/epolls/2015/governor/ky/kentucky_governor_bevin_vs_conway_vs_curtis-5692.html"
path <- "#polling-data-full td"

ky_gov_2015 <- clean_rcp(url, path, 8)
names(ky_gov_2015) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "I", "Spread")

write.csv(ky_gov_2015, 
	"/home/dan/Data/election/US national elections/ky_gov_2015.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/ky/kentucky_romney_vs_obama-2889.html"
path <- "#polling-data-full td"

ky_ge_2012 <- clean_rcp(url, path, 7)
names(ky_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ky_ge_2012, 
	"/home/dan/Data/election/US national elections/ky_ge_2012.csv",
	 row.names = FALSE)



# 2011

# gov
url <- "https://www.realclearpolitics.com/epolls/2011/governor/ky/kentucky_governor_williams_vs_beshear-1825.html"
path <- "#polling-data-full td"

ky_gov_2011 <- clean_rcp(url, path, 7)
names(ky_gov_2011) <- c("Poll", "Date", "Sample", "D", "I", "R", "Spread")

write.csv(ky_gov_2011, 
	"/home/dan/Data/election/US national elections/ky_gov_2011.csv",
	 row.names = FALSE)




# 2010

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/ky/kentucky_senate_paul_vs_conway-1148.html"
path <- "#polling-data-full td"

ky_sen_2010 <- clean_rcp(url, path, 6)
names(ky_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ky_sen_2010, 
	"/home/dan/Data/election/US national elections/ky_sen_2010.csv",
	 row.names = FALSE)


# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ky/kentucky_3rd_district_lally_vs_yarmuth-1374.html"
path <- "#polling-data-full td"

ky_rep3_2010 <- clean_rcp(url, path, 6)
names(ky_rep3_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ky_rep3_2010, 
	"/home/dan/Data/election/US national elections/ky_rep3_2010.csv",
	 row.names = FALSE)

# 6th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ky/kentucky_6th_district_barr_vs_chandler-1349.html"
path <- "#polling-data-full td"

ky_rep6_2010 <- clean_rcp(url, path, 6)
names(ky_rep6_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ky_rep6_2010, 
	"/home/dan/Data/election/US national elections/ky_rep6_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ky/kentucky_mccain_vs_obama-578.html"
path <- "#polling-data-full td"

ky_ge_2008 <- clean_rcp(url, path, 6)
names(ky_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ky_ge_2008, 
	"/home/dan/Data/election/US national elections/ky_ge_2008.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/ky/kentucky_senate-917.html"
path <- "#polling-data-full td"

ky_sen_2008 <- clean_rcp(url, path, 6)
names(ky_sen_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ky_sen_2008, 
	"/home/dan/Data/election/US national elections/ky_sen_2008.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/ky/kentucky_3rd_district-948.html"
path <- "#polling-data-full td"

ky_rep3_2008 <- clean_rcp(url, path, 6)
names(ky_rep3_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ky_rep3_2008, 
	"/home/dan/Data/election/US national elections/ky_rep3_2008.csv",
	 row.names = FALSE)



# 2006

# 3rd congressinoal district
url <- "https://www.realclearpolitics.com/epolls/writeup/kentucky_3-14.html"
path <- "#polling-data-full td"

ky_rep3_2006 <- clean_rcp(url, path, 7)
names(ky_rep3_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ky_rep3_2006, 
	"/home/dan/Data/election/US national elections/ky_rep3_2006.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/kentucky_4-35.html"
path <- "#polling-data-full td"

ky_rep4_2006 <- clean_rcp(url, path, 7)
names(ky_rep4_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ky_rep4_2006, 
	"/home/dan/Data/election/US national elections/ky_rep4_2006.csv",
	 row.names = FALSE)



# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/ky_polls.html"
path <- "p+ table tr~ tr+ tr td"

ky_ge_2004 <- clean_rcp(url, path, 7)
names(ky_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
ky_ge_2004[1,] <- ""

write.csv(ky_ge_2004, 
	"/home/dan/Data/election/US national elections/ky_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/ky_polls.html"
path <- "table:nth-child(6) div"

ky_sen_2004 <- clean_rcp(url, path, 7)
names(ky_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ky_sen_2004[1,] <- ""

write.csv(ky_sen_2004, 
	"/home/dan/Data/election/US national elections/ky_sen_2004.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ky_polls.html"
path <- "table:nth-child(10) div"

ky_rep3_2004 <- clean_rcp(url, path, 7)
names(ky_rep3_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ky_rep3_2004[1,] <- ""

write.csv(ky_rep3_2004, 
	"/home/dan/Data/election/US national elections/ky_rep3_2004.csv",
	 row.names = FALSE)

