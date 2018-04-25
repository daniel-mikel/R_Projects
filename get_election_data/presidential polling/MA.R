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
url <- "https://www.realclearpolitics.com/epolls/2016/president/ma/massachusetts_trump_vs_clinton_vs_johnson_vs_stein-6122.html"
path <- "#polling-data-full td"

ma_ge_2016 <- clean_rcp(url, path, 9)
names(ma_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "L", "G", "Spread")

write.csv(ma_ge_2016, 
	"/home/dan/Data/election/US national elections/ma_ge_2016.csv",
	 row.names = FALSE)



# 2014

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/ma/massachusetts_senate_herr_vs_markey-5151.html"
path <- "#polling-data-full td"

ma_sen_2014 <- clean_rcp(url, path, 7)
names(ma_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ma_sen_2014, 
	"/home/dan/Data/election/US national elections/ma_sen_2014.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/ma/massachusetts_governor_baker_vs_coakley-3266.html"
path <- "#polling-data-full td"

ma_gov_2014 <- clean_rcp(url, path, 7)
names(ma_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ma_gov_2014, 
	"/home/dan/Data/election/US national elections/ma_gov_2014.csv",
	 row.names = FALSE)

# 6th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/ma/massachusetts_6th_district_tisei_vs_moulton-5220.html"
path <- "#polling-data-full td"

ma_rep6_2014 <- clean_rcp(url, path, 7)
names(ma_rep6_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ma_rep6_2014, 
	"/home/dan/Data/election/US national elections/ma_rep6_2014.csv",
	 row.names = FALSE)

# 9th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/ma/massachusetts_9th_district_chapman_vs_keating-5245.html"
path <- "#polling-data-full td"

ma_rep9_2014 <- clean_rcp(url, path, 7)
names(ma_rep9_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ma_rep9_2014, 
	"/home/dan/Data/election/US national elections/ma_rep9_2014.csv",
	 row.names = FALSE)




# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/ma/massachusetts_romney_vs_obama-1804.html"
path <- "#polling-data-full td"

ma_ge_2012 <- clean_rcp(url, path, 7)
names(ma_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ma_ge_2012, 
	"/home/dan/Data/election/US national elections/ma_ge_2012.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/ma/massachusetts_senate_brown_vs_warren-2093.html"
path <- "#polling-data-full td"

ma_sen_2012 <- clean_rcp(url, path, 6)
names(ma_sen_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ma_sen_2012, 
	"/home/dan/Data/election/US national elections/ma_sen_2012.csv",
	 row.names = FALSE)

# 6th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/ma/massachusetts_6th_district_tisei_vs_tierney-3314.html"
path <- "#polling-data-full td"

ma_rep6_2012 <- clean_rcp(url, path, 6)
names(ma_rep6_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ma_rep6_2012, 
	"/home/dan/Data/election/US national elections/ma_rep6_2012.csv",
	 row.names = FALSE)



# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/ma/massachusetts_governor_baker_vs_patrick_vs_cahill-1154.html"
path <- "#polling-data-full td"

ma_gov_2010 <- clean_rcp(url, path, 7)
names(ma_gov_2010) <- c("Poll", "Date", "Sample", "R", "I", "D", "Spread")

write.csv(ma_gov_2010, 
	"/home/dan/Data/election/US national elections/ma_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/ma/massachusetts_senate_special_election-1144.html"
path <- "#polling-data-full td"

ma_sen_2010 <- clean_rcp(url, path, 6)
names(ma_sen_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ma_sen_2010, 
	"/home/dan/Data/election/US national elections/ma_sen_2010.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ma/massachusetts_4th_district_bielat_vs_frank-1706.html"
path <- "#polling-data-full td"

ma_rep4_2010 <- clean_rcp(url, path, 6)
names(ma_rep4_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ma_rep4_2010, 
	"/home/dan/Data/election/US national elections/ma_rep4_2010.csv",
	 row.names = FALSE)

# 10th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ma/massachusetts_10th_district_perry_vs_keating-1350.html"
path <- "#polling-data-full td"

ma_rep10_2010 <- clean_rcp(url, path, 6)
names(ma_rep10_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ma_rep10_2010, 
	"/home/dan/Data/election/US national elections/ma_rep10_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ma/massachusetts_mccain_vs_obama-575.html"
path <- "#polling-data-full td"

ma_ge_2008 <- clean_rcp(url, path, 6)
names(ma_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ma_ge_2008, 
	"/home/dan/Data/election/US national elections/ma_ge_2008.csv",
	 row.names = FALSE)



# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/ma_polls.html"
path <- "p+ table tr~ tr+ tr td"

ma_ge_2004 <- clean_rcp(url, path, 7)
names(ma_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
ma_ge_2004[1,] <- ""

write.csv(ma_ge_2004, 
	"/home/dan/Data/election/US national elections/ma_ge_2004.csv",
	 row.names = FALSE)