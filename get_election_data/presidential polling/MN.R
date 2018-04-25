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
url <- "https://www.realclearpolitics.com/epolls/2016/president/mn/minnesota_trump_vs_clinton_vs_johnson_vs_stein-6138.html"
path <- "#polling-data-full td"

mn_ge_2016 <- clean_rcp(url, path, 9)
names(mn_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "L", "G", "Spread")

write.csv(mn_ge_2016, 
	"/home/dan/Data/election/US national elections/mn_ge_2016.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2016/house/mn/minnesota_2nd_district_lewis_vs_craig-6067.html"
path <- "#polling-data-full td"

mn_rep2_2016 <- clean_rcp(url, path, 7)
names(mn_rep2_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mn_rep2_2016, 
	"/home/dan/Data/election/US national elections/mn_rep2_2016.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2016/house/mn/minnesota_3rd_district_paulsen_vs_bonoff-6032.html"
path <- "#polling-data-full td"

mn_rep3_2016 <- clean_rcp(url, path, 7)
names(mn_rep3_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mn_rep3_2016, 
	"/home/dan/Data/election/US national elections/mn_rep3_2016.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2016/house/mn/minnesota_8th_district_mills_vs_nolan-6042.html"
path <- "#polling-data-full td"

mn_rep8_2016 <- clean_rcp(url, path, 7)
names(mn_rep8_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mn_rep8_2016, 
	"/home/dan/Data/election/US national elections/mn_rep8_2016.csv",
	 row.names = FALSE)



# 2014

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/mn/minnesota_senate_mcfadden_vs_franken-3902.html"
path <- "#polling-data-full td"

mn_sen_2014 <- clean_rcp(url, path, 7)
names(mn_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mn_sen_2014, 
	"/home/dan/Data/election/US national elections/mn_sen_2014.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/mn/minnesota_governor_johnson_vs_dayton-3574.html"
path <- "#polling-data-full td"

mn_gov_2014 <- clean_rcp(url, path, 7)
names(mn_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mn_gov_2014, 
	"/home/dan/Data/election/US national elections/mn_gov_2014.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/mn/minnesota_1st_district_hagedorn_vs_walz-5203.html"
path <- "#polling-data-full td"

mn_rep2_2014 <- clean_rcp(url, path, 7)
names(mn_rep2_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mn_rep2_2014, 
	"/home/dan/Data/election/US national elections/mn_rep2_2014.csv",
	 row.names = FALSE)

# 7th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/mn/minnesota_7th_district_westrom_vs_peterson-5204.html"
path <- "#polling-data-full td"

mn_rep7_2014 <- clean_rcp(url, path, 7)
names(mn_rep7_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mn_rep7_2014, 
	"/home/dan/Data/election/US national elections/mn_rep7_2014.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/mn/minnesota_8th_district_mills_vs_nolan-5072.html"
path <- "#polling-data-full td"

mn_rep8_2014 <- clean_rcp(url, path, 7)
names(mn_rep8_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mn_rep8_2014, 
	"/home/dan/Data/election/US national elections/mn_rep8_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/mn/minnesota_romney_vs_obama-1823.html"
path <- "#polling-data-full td"

mn_ge_2012 <- clean_rcp(url, path, 7)
names(mn_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mn_ge_2012, 
	"/home/dan/Data/election/US national elections/mn_ge_2012.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/mn/minnesota_senate_bills_vs_klobuchar-3230.html"
path <- "#polling-data-full td"

mn_sen_2012 <- clean_rcp(url, path, 6)
names(mn_sen_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mn_sen_2012, 
	"/home/dan/Data/election/US national elections/mn_sen_2012.csv",
	 row.names = FALSE)

# 6th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/mn/minnesota_6th_district_bachmann_vs_graves-3402.html"
path <- "#polling-data-full td"

mn_rep6_2012 <- clean_rcp(url, path, 6)
names(mn_rep6_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mn_rep6_2012, 
	"/home/dan/Data/election/US national elections/mn_rep6_2012.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/mn/minnesota_8th_district_cravaack_vs_nolan-3363.html"
path <- "#polling-data-full td"

mn_rep8_2012 <- clean_rcp(url, path, 6)
names(mn_rep8_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mn_rep8_2012, 
	"/home/dan/Data/election/US national elections/mn_rep8_2012.csv",
	 row.names = FALSE)



# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/mn/minnesota_governor_emmer_vs_dayton_vs_horner-1393.html"
path <- "#polling-data-full td"

mn_gov_2010 <- clean_rcp(url, path, 7)
names(mn_gov_2010) <- c("Poll", "Date", "Sample", "D", "R", "I", "Spread")

write.csv(mn_gov_2010, 
	"/home/dan/Data/election/US national elections/mn_gov_2010.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/mn/minnesota_1st_district_demmer_vs_walz-1376.html"
path <- "#polling-data-full td"

mn_rep1_2010 <- clean_rcp(url, path, 6)
names(mn_rep1_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mn_rep1_2010, 
	"/home/dan/Data/election/US national elections/mn_rep1_2010.csv",
	 row.names = FALSE)

# 6th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/mn/minnesota_6th_district_bachmann_vs_clark_vs_anderson-1367.html"
path <- "#polling-data-full td"

mn_rep6_2010 <- clean_rcp(url, path, 6)
names(mn_rep6_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mn_rep6_2010, 
	"/home/dan/Data/election/US national elections/mn_rep6_2010.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/mn/minnesota_8th_district_cravaack_vs_oberstar-1712.html"
path <- "#polling-data-full td"

mn_rep8_2010 <- clean_rcp(url, path, 6)
names(mn_rep8_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mn_rep8_2010, 
	"/home/dan/Data/election/US national elections/mn_rep8_2010.csv",
	 row.names = FALSE)




# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/mn/minnesota_mccain_vs_obama-550.html"
path <- "#polling-data-full td"

mn_ge_2008 <- clean_rcp(url, path, 7)
names(mn_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mn_ge_2008, 
	"/home/dan/Data/election/US national elections/mn_ge_2008.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/mn/minnesota_senate-257.html"
path <- "#polling-data-full td"

mn_sen_2008 <- clean_rcp(url, path, 7)
names(mn_sen_2008) <- c("Poll", "Date", "Sample", "R", "D", "I", "Spread")

write.csv(mn_sen_2008, 
	"/home/dan/Data/election/US national elections/mn_sen_2008.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/mn/minnesota_3rd_district-983.html"
path <- "#polling-data-full td"

mn_rep3_2008 <- clean_rcp(url, path, 6)
names(mn_rep3_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mn_rep3_2008, 
	"/home/dan/Data/election/US national elections/mn_rep3_2008.csv",
	 row.names = FALSE)

# 6th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/mn/minnesota_6th_district-1024.html"
path <- "#polling-data-full td"

mn_rep6_2008 <- clean_rcp(url, path, 6)
names(mn_rep6_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mn_rep6_2008, 
	"/home/dan/Data/election/US national elections/mn_rep6_2008.csv",
	 row.names = FALSE)




# 2006

# sen
url <- "https://www.realclearpolitics.com/epolls/2006/senate/mn/minnesota_senate_race-15.html"
path <- "tr:nth-child(14) tr~ tr+ tr td"

mn_sen_2006 <- clean_rcp(url, path, 7)
names(mn_sen_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(mn_sen_2006, 
	"/home/dan/Data/election/US national elections/mn_sen_2006.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2006/governor/mn/minnesota_governor_race-57.html"
path <- "#polling-data-full td"

mn_gov_2006 <- clean_rcp(url, path, 7)
names(mn_gov_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(mn_gov_2006, 
	"/home/dan/Data/election/US national elections/mn_gov_2006.csv",
	 row.names = FALSE)

# 6th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/minnesota_6-29.html"
path <- "#polling-data-full td"

mn_rep6_2006 <- clean_rcp(url, path, 7)
names(mn_rep6_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(mn_rep6_2006, 
	"/home/dan/Data/election/US national elections/mn_rep6_2006.csv",
	 row.names = FALSE)




# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/mn_polls.html"
path <- "p+ table tr~ tr+ tr td"

mn_ge_2004 <- clean_rcp(url, path, 7)
names(mn_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
mn_ge_2004[1,] <- ""

write.csv(mn_ge_2004, 
	"/home/dan/Data/election/US national elections/mn_ge_2004.csv",
	 row.names = FALSE)