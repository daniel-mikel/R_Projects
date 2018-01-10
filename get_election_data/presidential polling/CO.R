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
url <- "https://www.realclearpolitics.com/epolls/2016/president/co/colorado_trump_vs_clinton_vs_johnson_vs_stein-5974.html"
path <- "#polling-data-full td"

co_ge_2016 <- clean_rcp(url, path, 9)
names(co_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "L", "G", "Spread")

write.csv(co_ge_2016, 
	"/home/dan/Data/election/US national elections/co_ge_2016.csv",
	 row.names = FALSE)

# Senate
url <- "https://www.realclearpolitics.com/epolls/2016/senate/co/colorado_senate_glenn_vs_bennet-5984.html"
path <- "#polling-data-full td"

co_sen_2016 <- clean_rcp(url, path, 7)
names(co_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(co_sen_2016, 
	"/home/dan/Data/election/US national elections/co_sen_2016.csv",
	 row.names = FALSE)




# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/co/colorado_governor_beauprez_vs_hickenlooper-3837.html"
path <- "#polling-data-full td"

co_gov_2014 <- clean_rcp(url, path, 7)
names(co_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(co_gov_2014, 
	"/home/dan/Data/election/US national elections/co_gov_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/co/colorado_romney_vs_obama-2023.html"
path <- "#polling-data-full td"

co_ge_2012 <- clean_rcp(url, path, 7)
names(co_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(co_ge_2012, 
	"/home/dan/Data/election/US national elections/co_ge_2012.csv",
	 row.names = FALSE)



# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/co/colorado_governor_maes_vs_hickenlooper_vs_tancredo-1677.html"
path <- "#polling-data-full td"

co_gov_2010 <- clean_rcp(url, path, 7)
names(co_gov_2010) <- c("Poll", "Date", "Sample", "D", "R", "I", "Spread")

write.csv(co_gov_2010, 
	"/home/dan/Data/election/US national elections/co_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/co/colorado_senate_buck_vs_bennet-1106.html"
path <- "#polling-data-full td"

co_sen_2010 <- clean_rcp(url, path, 6)
names(co_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(co_sen_2010, 
	"/home/dan/Data/election/US national elections/co_sen_2010.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/co/colorado_3rd_district_tipton_vs_salazar-1295.html"
path <- "#polling-data-full td"

co_rep3_2010 <- clean_rcp(url, path, 6)
names(co_rep3_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(co_rep3_2010, 
	"/home/dan/Data/election/US national elections/co_rep3_2010.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/co/colorado_4th_district_gardner_vs_markey-1258.html"
path <- "#polling-data-full td"

co_rep4_2010 <- clean_rcp(url, path, 6)
names(co_rep4_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(co_rep4_2010, 
	"/home/dan/Data/election/US national elections/co_rep4_2010.csv",
	 row.names = FALSE)

# 7th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/co/colorado_7th_district_frazier_vs_perlmutter-1345.html"
path <- "#polling-data-full td"

co_rep7_2010 <- clean_rcp(url, path, 6)
names(co_rep7_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(co_rep7_2010, 
	"/home/dan/Data/election/US national elections/co_rep7_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/co/colorado_mccain_vs_obama-546.html"
path <- "#polling-data-full td"

co_ge_2008 <- clean_rcp(url, path, 7)
names(co_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(co_ge_2008, 
	"/home/dan/Data/election/US national elections/co_ge_2008.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/co/colorado_senate-556.html"
path <- "#polling-data-full td"

co_sen_2008 <- clean_rcp(url, path, 6)
names(co_sen_2008) <- c("Poll", "Date", "Sample",  "R", "D", "Spread")

write.csv(co_sen_2008, 
	"/home/dan/Data/election/US national elections/co_sen_2008.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/co/colorado_4th_district-984.html"
path <- "#polling-data-full td"

co_rep4_2008 <- clean_rcp(url, path, 6)
names(co_rep4_2008) <- c("Poll", "Date", "Sample",  "D", "R", "Spread")

write.csv(co_rep4_2008, 
	"/home/dan/Data/election/US national elections/co_rep4_2008.csv",
	 row.names = FALSE)




# 2004 

# gov
url <- "https://www.realclearpolitics.com/epolls/2006/governor/co/colorado_governor_race-59.html"
path <- "#polling-data-full td"

co_gov_2006 <- clean_rcp(url, path, 7)
names(co_gov_2006) <- c("Poll", "Date", "Sample",  "R", "D", "Undecided", "Spread")

write.csv(co_gov_2006, 
	"/home/dan/Data/election/US national elections/co_gov_2006.csv",
	 row.names = FALSE)


# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/colorado_4-46.html"
path <- "#polling-data-full td"

co_rep4_2006 <- clean_rcp(url, path, 7)
names(co_rep4_2006) <- c("Poll", "Date", "Sample",  "R", "D", "Undecided", "Spread")

write.csv(co_rep4_2006, 
	"/home/dan/Data/election/US national elections/co_rep4_2006.csv",
	 row.names = FALSE)

# 5th congressional district
url <- "https://www.realclearpolitics.com/epolls/2006/house/co/colorado_5-142.html"
path <- "#polling-data-full td"

co_rep5_2006 <- clean_rcp(url, path, 7)
names(co_rep5_2006) <- c("Poll", "Date", "Sample",  "R", "D", "Undecided", "Spread")

write.csv(co_rep5_2006, 
	"/home/dan/Data/election/US national elections/co_rep5_2006.csv",
	 row.names = FALSE)

# 7th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/colorado_7-23.html"
path <- "#polling-data-full td"

co_rep7_2006 <- clean_rcp(url, path, 7)
names(co_rep7_2006) <- c("Poll", "Date", "Sample",  "R", "D", "Undecided", "Spread")

write.csv(co_rep7_2006, 
	"/home/dan/Data/election/US national elections/co_rep7_2006.csv",
	 row.names = FALSE)



# 2004 

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/co_polls.html"
path <- "p+ table tr~ tr+ tr td"

co_ge_2004 <- clean_rcp(url, path, 7)
names(co_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
co_ge_2004[1,] <- ""

write.csv(co_ge_2004, 
	"/home/dan/Data/election/US national elections/co_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/co_polls.html"
path <- "table:nth-child(6) div"

co_sen_2004 <- clean_rcp(url, path, 7)
names(co_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
co_sen_2004[1,] <- ""

write.csv(co_sen_2004, 
	"/home/dan/Data/election/US national elections/co_sen_2004.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/co_polls.html"
path <- "table:nth-child(10) div"

co_rep3_2004 <- clean_rcp(url, path, 7)
names(co_rep3_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
co_rep3_2004[1,] <- ""

write.csv(co_rep3_2004, 
	"/home/dan/Data/election/US national elections/co_rep3_2004.csv",
	 row.names = FALSE)

# 7th congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/co_polls.html"
path <- "table:nth-child(13) div"

co_rep7_2004 <- clean_rcp(url, path, 7)
names(co_rep7_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
co_rep7_2004[1,] <- ""

write.csv(co_rep7_2004, 
	"/home/dan/Data/election/US national elections/co_rep7_2004.csv",
	 row.names = FALSE)