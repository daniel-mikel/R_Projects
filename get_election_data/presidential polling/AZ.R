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
url <- "https://www.realclearpolitics.com/epolls/2016/president/az/arizona_trump_vs_clinton_vs_johnson_vs_stein-6087.html#polls"
path <- "#polling-data-full td"

az_ge_2016 <- clean_rcp(url, path, 9)
names(az_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

write.csv(az_ge_2016, 
	"/home/dan/Data/election/US national elections/az_ge_2016.csv",
	 row.names = FALSE)

# senate
url <- "https://www.realclearpolitics.com/epolls/2016/senate/az/arizona_senate_mccain_vs_kirkpatrick-5455.html"
path <- "#polling-data-full td"

az_sen_2016 <- clean_rcp(url, path, 7)
names(az_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(az_sen_2016, 
	"/home/dan/Data/election/US national elections/az_sen_2016.csv",
	 row.names = FALSE)

# 2014

# govenor
url <- "https://www.realclearpolitics.com/epolls/2014/governor/az/arizona_governor_ducey_vs_duval-4265.html"
path <- "#polling-data-full td"

az_gov_2014 <- clean_rcp(url, path, 7)
names(az_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(az_gov_2014, 
	"/home/dan/Data/election/US national elections/az_gov_2014.csv",
	 row.names = FALSE)

# az 2nd congressional
url <- "https://www.realclearpolitics.com/epolls/2014/house/az/arizona_2nd_district_mcsally_vs_barber-5063.html"
path <- ".alt td"

az_rep2_2014 <- clean_rcp(url, path, 6)
names(az_rep2_2014) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(az_rep2_2014, 
	"/home/dan/Data/election/US national elections/az_rep2_2014.csv",
	 row.names = FALSE)

# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/az/arizona_romney_vs_obama-1757.html"
path <- "#polling-data-full td"

az_ge_2012 <- clean_rcp(url, path, 7)
names(az_ge_2012) <- c("Poll", "Date", "MoE", "Sample", "D", "R", "Spread")

write.csv(az_ge_2012, 
	"/home/dan/Data/election/US national elections/az_ge_2012.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/az/arizona_senate_flake_vs_carmona-3005.html"
path <- "#polling-data-full td"

az_sen_2012 <- clean_rcp(url, path, 6)
names(az_sen_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(az_sen_2012, 
	"/home/dan/Data/election/US national elections/az_sen_2012.csv",
	 row.names = FALSE)



# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/az/arizona_governor_brewer_vs_goddard-1409.html"
path <- "#polling-data-full td"

az_gov_2010 <- clean_rcp(url, path, 6)
names(az_gov_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(az_gov_2010, 
	"/home/dan/Data/election/US national elections/az_gov_2010.csv",
	 row.names = FALSE)


# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/az/arizona_senate_mccain_vs_glassman-1433.html"
path <- "#polling-data-full td"

az_sen_2010 <- clean_rcp(url, path, 6)
names(az_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(az_sen_2010, 
	"/home/dan/Data/election/US national elections/az_sen_2010.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/az/arizona_1st_district_gosar_vs_kirkpatrick-1289.html"
path <- "#polling-data-full td"

az_rep1_2010 <- clean_rcp(url, path, 6)
names(az_rep1_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(az_rep1_2010, 
	"/home/dan/Data/election/US national elections/az_rep1_2010.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/az/arizona_3rd_district_quayle_vs_hulburd-1369.html"
path <- "#polling-data-full td"

az_rep3_2010 <- clean_rcp(url, path, 6)
names(az_rep3_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(az_rep3_2010, 
	"/home/dan/Data/election/US national elections/az_rep3_2010.csv",
	 row.names = FALSE)

# 5th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/az/arizona_5th_district_schweikert_vs_mitchell-1285.html"
path <- "#polling-data-full td"

az_rep5_2010 <- clean_rcp(url, path, 6)
names(az_rep5_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(az_rep5_2010, 
	"/home/dan/Data/election/US national elections/az_rep5_2010.csv",
	 row.names = FALSE)

# 7th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/az/arizona_7th_district_mcclung_vs_grijalva-1717.html"
path <- "#polling-data-full td"

az_rep7_2010 <- clean_rcp(url, path, 6)
names(az_rep7_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(az_rep7_2010, 
	"/home/dan/Data/election/US national elections/az_rep7_2010.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/az/arizona_8th_district_kelly_vs_giffords-1287.html"
path <- "#polling-data-full td"

az_rep8_2010 <- clean_rcp(url, path, 6)
names(az_rep8_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(az_rep8_2010, 
	"/home/dan/Data/election/US national elections/az_rep8_2010.csv",
	 row.names = FALSE)

# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/az/arizona_mccain_vs_obama-570.html"
path <- "#polling-data-full td"

az_ge_2008 <- clean_rcp(url, path, 7)
names(az_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(az_ge_2008, 
	"/home/dan/Data/election/US national elections/az_ge_2008.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/az/arizona_3rd_district-1023.html"
path <- "#polling-data-full td"

az_rep3_2008 <- clean_rcp(url, path, 6)
names(az_rep3_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(az_rep3_2008, 
	"/home/dan/Data/election/US national elections/az_rep3_2008.csv",
	 row.names = FALSE)

# 2006

# senate
url <- "https://www.realclearpolitics.com/epolls/2006/senate/az/arizona_senate_race-35.html"
path <- "#polling-data-full td"

az_sen_2006 <- clean_rcp(url, path, 7)
names(az_sen_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(az_sen_2006, 
	"/home/dan/Data/election/US national elections/az_sen_2006.csv",
	 row.names = FALSE)

# governor
url <- "https://www.realclearpolitics.com/epolls/2006/governor/az/arizona_governor_race-126.html"
path <- "#polling-data-full td"

az_gov_2006 <- clean_rcp(url, path, 7)
names(az_gov_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(az_gov_2006, 
	"/home/dan/Data/election/US national elections/az_gov_2006.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2006/house/az/arizona_1-149.html"
path <- "#polling-data-full td"

az_rep1_2006 <- clean_rcp(url, path, 7)
names(az_rep1_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(az_rep1_2006, 
	"/home/dan/Data/election/US national elections/az_rep1_2006.csv",
	 row.names = FALSE)

# 5th congressional district
url <- "https://www.realclearpolitics.com/epolls/2006/house/az/arizona_5-92.html"
path <- "#polling-data-full td"

az_rep5_2006 <- clean_rcp(url, path, 7)
names(az_rep5_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(az_rep5_2006, 
	"/home/dan/Data/election/US national elections/az_rep5_2006.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/arizona_8-24.html"
path <- "#polling-data-full td"

az_rep8_2006 <- clean_rcp(url, path, 7)
names(az_rep8_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(az_rep8_2006, 
	"/home/dan/Data/election/US national elections/az_rep8_2006.csv",
	 row.names = FALSE)


# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/az_polls.html"
path <- "p+ table div"

az_ge_2004 <- clean_rcp(url, path, 7)
names(az_ge_2004) <- az_ge_2004[1,]
az_ge_2004[1,] <- ""

write.csv(az_ge_2004, 
	"/home/dan/Data/election/US national elections/az_ge_2004.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/az_polls.html"
path <- "br+ table div"

az_rep1_2004 <- clean_rcp(url, path, 7)
names(az_rep1_2004) <- az_rep1_2004[1,]
az_rep1_2004[1,] <- ""

write.csv(az_rep1_2004, 
	"/home/dan/Data/election/US national elections/az_rep1_2004.csv",
	 row.names = FALSE)