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
url <- "https://www.realclearpolitics.com/epolls/2016/president/ct/connecticut_trump_vs_clinton_vs_johnson_vs_stein-5959.html"
path <- "#polling-data-full td"

ct_ge_2016 <- clean_rcp(url, path, 9)
names(ct_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "L", "G", "Spread")

write.csv(ct_ge_2016, 
	"/home/dan/Data/election/US national elections/ct_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/ct/connecticut_senate_carter_vs_blumenthal-5960.html"
path <- "#polling-data-full td"

ct_sen_2016 <- clean_rcp(url, path, 7)
names(ct_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ct_sen_2016, 
	"/home/dan/Data/election/US national elections/ct_sen_2016.csv",
	 row.names = FALSE)



# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/ct/connecticut_governor_foley_vs_malloy_vs_visconti-5259.html"
path <- "#polling-data-full td"

ct_gov_2014 <- clean_rcp(url, path, 7)
names(ct_gov_2014) <- c("Poll", "Date", "Sample", "D", "R", "I", "Spread")

write.csv(ct_gov_2014, 
	"/home/dan/Data/election/US national elections/ct_gov_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/ct/connecticut_romney_vs_obama-2906.html"
path <- "#polling-data-full td"

ct_ge_2012 <- clean_rcp(url, path, 7)
names(ct_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ct_ge_2012, 
	"/home/dan/Data/election/US national elections/ct_ge_2012.csv",
	 row.names = FALSE)



# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/ct/connecticut_governor_foley_vs_malloy-1357.html"
path <- "#polling-data-full td"

ct_gov_2010 <- clean_rcp(url, path, 6)
names(ct_gov_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ct_gov_2010, 
	"/home/dan/Data/election/US national elections/ct_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/ct/connecticut_senate_mcmahon_vs_blumenthal-1145.html"
path <- "#polling-data-full td"

ct_sen_2010 <- clean_rcp(url, path, 6)
names(ct_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ct_sen_2010, 
	"/home/dan/Data/election/US national elections/ct_sen_2010.csv",
	 row.names = FALSE)

# 1st congressional
url <- "https://www.realclearpolitics.com/epolls/2010/house/ct/connecticut_1st_district_brickley_vs_larson-1713.html"
path <- "#polling-data-full td"

ct_rep1_2010 <- clean_rcp(url, path, 6)
names(ct_rep1_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ct_rep1_2010, 
	"/home/dan/Data/election/US national elections/ct_rep1_2010.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ct/connecticut_2nd_district_peckinpaugh_vs_courtney-1715.html"
path <- "#polling-data-full td"

ct_rep2_2010 <- clean_rcp(url, path, 6)
names(ct_rep2_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ct_rep2_2010, 
	"/home/dan/Data/election/US national elections/ct_rep2_2010.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ct/connecticut_4th_distirct_debicella_vs_himes-1346.html"
path <- "#polling-data-full td"

ct_rep4_2010 <- clean_rcp(url, path, 6)
names(ct_rep4_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ct_rep4_2010, 
	"/home/dan/Data/election/US national elections/ct_rep4_2010.csv",
	 row.names = FALSE)

# 5th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ct/connecticut_5th_district_caligiuri_vs_murphy-1304.html"
path <- "#polling-data-full td"

ct_rep5_2010 <- clean_rcp(url, path, 6)
names(ct_rep5_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ct_rep5_2010, 
	"/home/dan/Data/election/US national elections/ct_rep5_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ct/connecticut_mccain_vs_obama-527.html"
path <- "#polling-data-full td"

ct_ge_2008 <- clean_rcp(url, path, 6)
names(ct_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ct_ge_2008, 
	"/home/dan/Data/election/US national elections/ct_ge_2008.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/ct/connecticut_4th_district-958.html"
path <- "#polling-data-full td"

ct_rep4_2008 <- clean_rcp(url, path, 6)
names(ct_rep4_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ct_rep4_2008, 
	"/home/dan/Data/election/US national elections/ct_rep4_2008.csv",
	 row.names = FALSE)



# 2006

# gov
url <- "https://www.realclearpolitics.com/epolls/2006/governor/ct/connecticut_governor_race-25.html"
path <- "#polling-data-full td"

ct_gov_2006 <- clean_rcp(url, path, 7)
names(ct_gov_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ct_gov_2006, 
	"/home/dan/Data/election/US national elections/ct_gov_2006.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2006/senate/ct/connecticut_senate_race-21.html"
path <- "#polling-data-full td"

ct_sen_2006 <- clean_rcp(url, path, 7)
names(ct_sen_2006) <- c("Poll", "Date", "Sample", "I", "D", "R", "Spread")

write.csv(ct_sen_2006, 
	"/home/dan/Data/election/US national elections/ct_sen_2006.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/connecticut_2-7.html"
path <- "#polling-data-full td"

ct_rep2_2006 <- clean_rcp(url, path, 7)
names(ct_rep2_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ct_rep2_2006, 
	"/home/dan/Data/election/US national elections/ct_rep2_2006.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/connecticut_4-5.html"
path <- "#polling-data-full td"

ct_rep4_2006 <- clean_rcp(url, path, 7)
names(ct_rep4_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ct_rep4_2006, 
	"/home/dan/Data/election/US national elections/ct_rep4_2006.csv",
	 row.names = FALSE)

# 5th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/connecticut_5-12.html"
path <- "#polling-data-full td"

ct_rep5_2006 <- clean_rcp(url, path, 7)
names(ct_rep5_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ct_rep5_2006, 
	"/home/dan/Data/election/US national elections/ct_rep5_2006.csv",
	 row.names = FALSE)



# 2004

# ge

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/ct_polls.html"
path <- "p+ table tr~ tr+ tr td"

ct_ge_2004 <- clean_rcp(url, path, 7)
names(ct_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
ct_ge_2004[1,] <- ""

write.csv(ct_ge_2004, 
	"/home/dan/Data/election/US national elections/ct_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/ct_polls.html"
path <- "table:nth-child(6) div"

ct_sen_2004 <- clean_rcp(url, path, 7)
names(ct_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ct_sen_2004[1,] <- ""

write.csv(ct_sen_2004, 
	"/home/dan/Data/election/US national elections/ct_sen_2004.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ct_polls.html"
path <- "table:nth-child(10) div"

ct_rep2_2004 <- clean_rcp(url, path, 7)
names(ct_rep2_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ct_rep2_2004[1,] <- ""

write.csv(ct_rep2_2004, 
	"/home/dan/Data/election/US national elections/ct_rep2_2004.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ct_polls.html"
path <- "table:nth-child(13) div"

ct_rep4_2004 <- clean_rcp(url, path, 7)
names(ct_rep4_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ct_rep4_2004[1,] <- ""

write.csv(ct_rep4_2004, 
	"/home/dan/Data/election/US national elections/ct_rep4_2004.csv",
	 row.names = FALSE)