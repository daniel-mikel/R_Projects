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
url <- "https://www.realclearpolitics.com/epolls/2016/president/fl/florida_trump_vs_clinton_vs_johnson_vs_stein-5963.html"
path <- "#polling-data-full td"

fl_ge_2016 <- clean_rcp(url, path, 9)
names(fl_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

write.csv(fl_ge_2016, 
	"/home/dan/Data/election/US national elections/fl_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/fl/florida_senate_rubio_vs_murphy-5222.html"
path <- "#polling-data-full td"

fl_sen_2016 <- clean_rcp(url, path, 7)
names(fl_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(fl_sen_2016, 
	"/home/dan/Data/election/US national elections/fl_sen_2016.csv",
	 row.names = FALSE)


# 13th congressional district
url <- "https://www.realclearpolitics.com/epolls/2016/house/fl/florida_13th_district_jolly_vs_crist-6049.html"
path <- "#polling-data-full td"

fl_rep13_2016 <- clean_rcp(url, path, 7)
names(fl_rep13_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(fl_rep13_2016, 
	"/home/dan/Data/election/US national elections/fl_rep13_2016.csv",
	 row.names = FALSE)



# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/fl/florida_governor_scott_vs_crist-3545.html"
path <- "#polling-data-full td"

fl_gov_2014 <- clean_rcp(url, path, 7)
names(fl_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(fl_gov_2014, 
	"/home/dan/Data/election/US national elections/fl_gov_2014.csv",
	 row.names = FALSE)

# 26th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/fl/florida_26th_district_curbelo_vs_garcia-5212.html"
path <- "#polling-data-full td"

fl_rep26_2014 <- clean_rcp(url, path, 6)
names(fl_rep26_2014) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(fl_rep26_2014, 
	"/home/dan/Data/election/US national elections/fl_rep26_2014.csv",
	 row.names = FALSE)




# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/fl/florida_romney_vs_obama-1883.html"
path <- "#polling-data-full td"

fl_ge_2012 <- clean_rcp(url, path, 7)
names(fl_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(fl_ge_2012, 
	"/home/dan/Data/election/US national elections/fl_ge_2012.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/fl/florida_senate_mack_vs_nelson-1847.html"
path <- "#polling-data-full td"

fl_sen_2012 <- clean_rcp(url, path, 6)
names(fl_sen_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(fl_sen_2012, 
	"/home/dan/Data/election/US national elections/fl_sen_2012.csv",
	 row.names = FALSE)


# 18th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/florida_key_house_races.html"
path <- "#polling-data-full:nth-child(9) td"

fl_rep18_2012 <- clean_rcp(url, path, 6)
names(fl_rep18_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(fl_rep18_2012, 
	"/home/dan/Data/election/US national elections/fl_rep18_2012.csv",
	 row.names = FALSE)

# 22nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/florida_key_house_races.html"
path <- "#polling-data-full:nth-child(10) td"

fl_rep22_2012 <- clean_rcp(url, path, 6)
names(fl_rep22_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(fl_rep22_2012, 
	"/home/dan/Data/election/US national elections/fl_rep22_2012.csv",
	 row.names = FALSE)


# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/fl/florida_governor_scott_vs_sink_vs_chiles-1607.html"
path <- "#polling-data-full td"

fl_gov_2010 <- clean_rcp(url, path, 6)
names(fl_gov_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(fl_gov_2010, 
	"/home/dan/Data/election/US national elections/fl_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/fl/florida_senate_rubio_vs_meek_vs_crist-1456.html"
path <- "#polling-data-full td"

fl_sen_2010 <- clean_rcp(url, path, 7)
names(fl_sen_2010) <- c("Poll", "Date", "Sample", "I", "D", "R", "Spread")

write.csv(fl_sen_2010, 
	"/home/dan/Data/election/US national elections/fl_sen_2010.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/fl/florida_2nd_district_southerland_vs_boyd-1372.html"
path <- "#polling-data-full td"

fl_rep2_2010 <- clean_rcp(url, path, 6)
names(fl_rep2_2010) <- c("Poll", "Date", "Sample",  "D", "R", "Spread")

write.csv(fl_rep2_2010, 
	"/home/dan/Data/election/US national elections/fl_rep2_2010.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/fl/florida_8th_district_webster_vs_grayson-1254.html"
path <- "#polling-data-full td"

fl_rep8_2010 <- clean_rcp(url, path, 6)
names(fl_rep8_2010) <- c("Poll", "Date", "Sample",  "D", "R", "Spread")

write.csv(fl_rep8_2010, 
	"/home/dan/Data/election/US national elections/fl_rep8_2010.csv",
	 row.names = FALSE)

# 22nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/fl/florida_22nd_district_west_vs_klein-1342.html"
path <- "#polling-data-full td"

fl_rep22_2010 <- clean_rcp(url, path, 6)
names(fl_rep22_2010) <- c("Poll", "Date", "Sample",  "D", "R", "Spread")

write.csv(fl_rep22_2010, 
	"/home/dan/Data/election/US national elections/fl_rep22_2010.csv",
	 row.names = FALSE)

# 25th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/fl/florida_25th_district_rivera_vs_garcia-1366.html"
path <- "#polling-data-full td"

fl_rep25_2010 <- clean_rcp(url, path, 6)
names(fl_rep25_2010) <- c("Poll", "Date", "Sample",  "D", "R", "Spread")

write.csv(fl_rep25_2010, 
	"/home/dan/Data/election/US national elections/fl_rep25_2010.csv",
	 row.names = FALSE)


# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/fl/florida_mccain_vs_obama-418.html"
path <- "#polling-data-full td"

fl_ge_2008 <- clean_rcp(url, path, 7)
names(fl_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(fl_ge_2008, 
	"/home/dan/Data/election/US national elections/fl_ge_2008.csv",
	 row.names = FALSE)


# 21st congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/fl/florida_21st_district-1012.html"
path <- "#polling-data-full td"

fl_rep21_2008 <- clean_rcp(url, path, 6)
names(fl_rep21_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(fl_rep21_2008, 
	"/home/dan/Data/election/US national elections/fl_rep21_2008.csv",
	 row.names = FALSE)

# 25th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/fl/florida_25th_district-1014.html"
path <- "#polling-data-full td"

fl_rep25_2008 <- clean_rcp(url, path, 6)
names(fl_rep25_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(fl_rep25_2008, 
	"/home/dan/Data/election/US national elections/fl_rep25_2008.csv",
	 row.names = FALSE)


# 2006

# gov
url <- "https://www.realclearpolitics.com/epolls/2006/governor/fl/florida_governor_race-54.html"
path <- "#polling-data-full td"

fl_gov_2006 <- clean_rcp(url, path, 7)
names(fl_gov_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(fl_gov_2006, 
	"/home/dan/Data/election/US national elections/fl_gov_2006.csv",
	 row.names = FALSE)

# 13th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/florida_13-38.html"
path <- "#polling-data-full td"

fl_rep13_2006 <- clean_rcp(url, path, 7)
names(fl_rep13_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(fl_rep13_2006, 
	"/home/dan/Data/election/US national elections/fl_rep13_2006.csv",
	 row.names = FALSE)

# 16th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/florida_16-34.html"
path <- "#polling-data-full td"

fl_rep16_2006 <- clean_rcp(url, path, 7)
names(fl_rep16_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(fl_rep16_2006, 
	"/home/dan/Data/election/US national elections/fl_rep16_2006.csv",
	 row.names = FALSE)

# 22nd congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/florida_22-6.html"
path <- "#polling-data-full td"

fl_rep12_2006 <- clean_rcp(url, path, 7)
names(fl_rep12_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(fl_rep12_2006, 
	"/home/dan/Data/election/US national elections/fl_rep12_2006.csv",
	 row.names = FALSE)



# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/fl_polls.html"
path <- "p+ table tr~ tr+ tr td"

fl_ge_2004 <- clean_rcp(url, path, 7)
names(fl_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
fl_ge_2004[1,] <- ""

write.csv(fl_ge_2004, 
	"/home/dan/Data/election/US national elections/fl_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/fl_polls.html"
path <- "br+ table tr~ tr+ tr div"

fl_sen_2004 <- clean_rcp(url, path, 7)
names(fl_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
fl_sen_2004[1,] <- ""

write.csv(fl_sen_2004, 
	"/home/dan/Data/election/US national elections/fl_sen_2004.csv",
	 row.names = FALSE)