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



# 2017
# 6th congressional district *runoff*
url <- "https://www.realclearpolitics.com/epolls/2017/house/ga/georgia_6th_district_runoff_election_handel_vs_ossoff-6202.html"
path <- "#polling-data-full td"

ga_rep6_2017 <- clean_rcp(url, path, 7)
names(ga_rep6_2017) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ga_rep6_2017, 
	"/home/dan/Data/election/US national elections/ga_rep6_2017.csv",
	 row.names = FALSE)



# 2016

# ge
url <- "https://www.realclearpolitics.com/epolls/2016/president/ga/georgia_trump_vs_clinton_vs_johnson-5968.html"
path <- "#polling-data-full td"

ga_ge_2016 <- clean_rcp(url, path, 8)
names(ga_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "Spread")

write.csv(ga_ge_2016, 
	"/home/dan/Data/election/US national elections/ga_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/ga/georgia_senate_isakson_vs_barksdale-5955.html"
path <- "#polling-data-full td"

ga_sen_2016 <- clean_rcp(url, path, 7)
names(ga_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ga_sen_2016, 
	"/home/dan/Data/election/US national elections/ga_sen_2016.csv",
	 row.names = FALSE)




# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/ga/georgia_governor_deal_vs_carter-3461.html"
path <- "#polling-data-full td"

ga_gov_2014 <- clean_rcp(url, path, 7)
names(ga_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ga_gov_2014, 
	"/home/dan/Data/election/US national elections/ga_gov_2014.csv",
	 row.names = FALSE)

# 12th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/ga/georgia_12th_district_allen_vs_barrow-5058.html"
path <- "#polling-data-full td"

ga_rep12_2014 <- clean_rcp(url, path, 7)
names(ga_rep12_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ga_rep12_2014, 
	"/home/dan/Data/election/US national elections/ga_rep12_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/ga/georgia_romney_vs_obama-2150.html"
path <- "#polling-data-full td"

ga_ge_2012 <- clean_rcp(url, path, 7)
names(ga_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ga_ge_2012, 
	"/home/dan/Data/election/US national elections/ga_ge_2012.csv",
	 row.names = FALSE)




# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/ga/georgia_governor_deal_vs_barnes-1316.html"
path <- "#polling-data-full td"

ga_gov_2010 <- clean_rcp(url, path, 6)
names(ga_gov_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ga_gov_2010, 
	"/home/dan/Data/election/US national elections/ga_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/ga/georgia_senate_isakson_vs_thurmond-1477.html"
path <- "#polling-data-full td"

ga_sen_2010 <- clean_rcp(url, path, 6)
names(ga_sen_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ga_sen_2010, 
	"/home/dan/Data/election/US national elections/ga_sen_2010.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ga/georgia_2nd_district_keown_vs_bishop-1674.html"
path <- "#polling-data-full td"

ga_rep2_2010 <- clean_rcp(url, path, 6)
names(ga_rep2_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ga_rep2_2010, 
	"/home/dan/Data/election/US national elections/ga_rep2_2010.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ga/georgia_8th_district_scott_vs_marshall-1305.html"
path <- "#polling-data-full td"

ga_rep8_2010 <- clean_rcp(url, path, 6)
names(ga_rep8_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ga_rep8_2010, 
	"/home/dan/Data/election/US national elections/ga_rep8_2010.csv",
	 row.names = FALSE)

# 12th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ga/georgia_12th_district_mckinney_vs_barrow-1353.html"
path <- "#polling-data-full td"

ga_rep8_2010 <- clean_rcp(url, path, 6)
names(ga_rep8_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ga_rep8_2010, 
	"/home/dan/Data/election/US national elections/ga_rep8_2010.csv",
	 row.names = FALSE)


# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ga/georgia_mccain_vs_obama-596.html"
path <- "#polling-data-full td"

ga_ge_2008 <- clean_rcp(url, path, 7)
names(ga_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ga_ge_2008, 
	"/home/dan/Data/election/US national elections/ga_ge_2008.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/ga/georgia_senate-302.html"
path <- "#polling-data-full td"

ga_sen_2008 <- clean_rcp(url, path, 6)
names(ga_sen_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ga_sen_2008, 
	"/home/dan/Data/election/US national elections/ga_sen_2008.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/ga/georgia_8th_district-1013.html"
path <- "#polling-data-full td"

ga_rep8_2008 <- clean_rcp(url, path, 6)
names(ga_rep8_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ga_rep8_2008, 
	"/home/dan/Data/election/US national elections/ga_rep8_2008.csv",
	 row.names = FALSE)



#2006

# gov
url <- "https://www.realclearpolitics.com/epolls/2006/governor/ga/georgia_governor_race-23.html"
path <- "#polling-data-full td"

ga_gov_2006 <- clean_rcp(url, path, 7)
names(ga_gov_2006) <- c("Poll", "Date", "Sample", "D", "R", "Undecided", "Spread")

write.csv(ga_gov_2006, 
	"/home/dan/Data/election/US national elections/ga_gov_2006.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/georgia_8-40.html"
path <- "#polling-data-full td"

ga_rep8_2006 <- clean_rcp(url, path, 7)
names(ga_rep8_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ga_rep8_2006, 
	"/home/dan/Data/election/US national elections/ga_rep8_2006.csv",
	 row.names = FALSE)

# 12th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/georgia_12-45.html"
path <- "#polling-data-full td"

ga_rep8_2006 <- clean_rcp(url, path, 7)
names(ga_rep8_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ga_rep8_2006, 
	"/home/dan/Data/election/US national elections/ga_rep8_2006.csv",
	 row.names = FALSE)




# 2004

# ge 
url <- "https://www.realclearpolitics.com/Presidential_04/ga_polls.html"
path <- "p+ table tr~ tr+ tr td"

ga_ge_2004 <- clean_rcp(url, path, 7)
names(ga_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
ga_ge_2004[1,] <- ""

write.csv(ga_ge_2004, 
	"/home/dan/Data/election/US national elections/ga_ge_2004.csv",
	 row.names = FALSE)	 

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/ga_polls.html"
path <- "table:nth-child(6) div"

ga_sen_2004 <- clean_rcp(url, path, 7)
names(ga_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ga_sen_2004[1,] <- ""

write.csv(ga_sen_2004, 
	"/home/dan/Data/election/US national elections/ga_sen_2004.csv",
	 row.names = FALSE)	 

# 3rd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ga_polls.html"
path <- "table:nth-child(10) div"

ga_rep3_2004 <- clean_rcp(url, path, 7)
names(ga_rep3_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ga_rep3_2004[1,] <- ""

write.csv(ga_rep3_2004, 
	"/home/dan/Data/election/US national elections/ga_rep3_2004.csv",
	 row.names = FALSE)	 