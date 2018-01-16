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
url <- "https://www.realclearpolitics.com/epolls/2016/president/in/indiana_trump_vs_clinton_vs_johnson-6108.html"
path <- "#polling-data-full td"

in_ge_2016 <- clean_rcp(url, path, 8)
names(in_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "Spread")

write.csv(in_ge_2016, 
	"/home/dan/Data/election/US national elections/in_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/in/indiana_senate_young_vs_bayh-6003.html"
path <- "#polling-data-full td"

in_sen_2016 <- clean_rcp(url, path, 7)
names(in_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(in_sen_2016, 
	"/home/dan/Data/election/US national elections/in_sen_2016.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2016/governor/in/indiana_governor_holcomb_vs_gregg-6097.html"
path <- "#polling-data-full td"

in_gov_2016 <- clean_rcp(url, path, 7)
names(in_gov_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(in_gov_2016, 
	"/home/dan/Data/election/US national elections/in_gov_2016.csv",
	 row.names = FALSE)



# 2012

# gov
url <- "https://www.realclearpolitics.com/epolls/2012/governor/in/indiana_governor_pence_vs_gregg-3169.html"
path <- "#polling-data-full td"

in_gov_2012 <- clean_rcp(url, path, 6)
names(in_gov_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(in_gov_2012, 
	"/home/dan/Data/election/US national elections/in_gov_2012.csv",
	 row.names = FALSE)



# 2010

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/in/indiana_senate_coats_vs_ellsworth-1209.html"
path <- "#polling-data-full td"

in_sen_2010 <- clean_rcp(url, path, 6)
names(in_sen_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(in_sen_2010, 
	"/home/dan/Data/election/US national elections/in_sen_2010.csv",
	 row.names = FALSE)


# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/in/indiana_2nd_district_walorski_vs_donnelly-1348.html"
path <- "#polling-data-full td"

in_rep2_2010 <- clean_rcp(url, path, 6)
names(in_rep2_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(in_rep2_2010, 
	"/home/dan/Data/election/US national elections/in_rep2_2010.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/in/indiana_8th_district_bucshon_vs_van_haaften-1387.html"
path <- "#polling-data-full td"

in_rep8_2010 <- clean_rcp(url, path, 6)
names(in_rep8_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(in_rep8_2010, 
	"/home/dan/Data/election/US national elections/in_rep8_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/in/indiana_mccain_vs_obama-604.html"
path <- "#polling-data-full td"

in_ge_2008 <- clean_rcp(url, path, 7)
names(in_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(in_ge_2008, 
	"/home/dan/Data/election/US national elections/in_ge_2008.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2008/governor/in/indiana_governor-937.html"
path <- "#polling-data-full td"

in_gov_2008 <- clean_rcp(url, path, 6)
names(in_gov_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(in_gov_2008, 
	"/home/dan/Data/election/US national elections/in_gov_2008.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/in/indiana_3rd_district-1027.html"
path <- "#polling-data-full td"

in_rep3_2008 <- clean_rcp(url, path, 6)
names(in_rep3_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(in_rep3_2008, 
	"/home/dan/Data/election/US national elections/in_rep3_2008.csv",
	 row.names = FALSE)



# 2006

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/indiana_2-47.html"
path <- "#polling-data-full td"

in_rep2_2006 <- clean_rcp(url, path, 7)
names(in_rep2_2006) <- c("Poll", "Date", "Sample", "D", "R", "Undecided", "Spread")

write.csv(in_rep2_2006, 
	"/home/dan/Data/election/US national elections/in_rep2_2006.csv",
	 row.names = FALSE)

# 7th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/indiana_7-49.html"
path <- "#polling-data-full td"

in_rep7_2006 <- clean_rcp(url, path, 7)
names(in_rep7_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(in_rep7_2006, 
	"/home/dan/Data/election/US national elections/in_rep7_2006.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/indiana_8-33.html"
path <- "#polling-data-full td"

in_rep8_2006 <- clean_rcp(url, path, 7)
names(in_rep8_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(in_rep8_2006, 
	"/home/dan/Data/election/US national elections/in_rep8_2006.csv",
	 row.names = FALSE)

# 9th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/indiana_9-15.html"
path <- "#polling-data-full td"

in_rep9_2006 <- clean_rcp(url, path, 7)
names(in_rep9_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(in_rep9_2006, 
	"/home/dan/Data/election/US national elections/in_rep9_2006.csv",
	 row.names = FALSE)



# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/in_polls.html"
path <- "p+ table tr~ tr+ tr td"

in_ge_2004 <- clean_rcp(url, path, 7)
names(in_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
in_ge_2004[1,] <- ""

write.csv(in_ge_2004, 
	"/home/dan/Data/election/US national elections/in_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/in_polls.html"
path <- "table:nth-child(6) div"

in_sen_2004 <- clean_rcp(url, path, 7)
names(in_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
in_sen_2004[1,] <- ""

write.csv(in_sen_2004, 
	"/home/dan/Data/election/US national elections/in_sen_2004.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/Presidential_04/in_polls.html"
path <- "table:nth-child(10) div"

in_gov_2004 <- clean_rcp(url, path, 7)
names(in_gov_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
in_gov_2004[1,] <- ""

write.csv(in_gov_2004, 
	"/home/dan/Data/election/US national elections/in_gov_2004.csv",
	 row.names = FALSE)

# 2th congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/in_polls.html"
path <- "table:nth-child(14) div"

in_rep2_2004 <- clean_rcp(url, path, 7)
names(in_rep2_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
in_rep2_2004[1,] <- ""

write.csv(in_rep2_2004, 
	"/home/dan/Data/election/US national elections/in_rep2_2004.csv",
	 row.names = FALSE)