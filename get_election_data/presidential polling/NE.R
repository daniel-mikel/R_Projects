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
url <- "https://www.realclearpolitics.com/epolls/2016/president/ne/nebraska_trump_vs_clinton_vs_johnson_vs_stein-6147.html"
path <- "#polling-data-full td"

ne_ge_2016 <- clean_rcp(url, path, 9)
names(ne_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

write.csv(ne_ge_2016, 
	"/home/dan/Data/election/US national elections/ne_ge_2016.csv",
	 row.names = FALSE)



# 2014

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/ne/nebraska_senate_sasse_vs_domina-5004.html"
path <- "#polling-data-full td"

ne_sen_2014 <- clean_rcp(url, path, 7)
names(ne_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ne_sen_2014, 
	"/home/dan/Data/election/US national elections/ne_sen_2014.csv",
	 row.names = FALSE)


# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/ne/nebraska_governor_ricketts_vs_hassebrook-5045.html"
path <- "#polling-data-full td"

ne_gov_2014 <- clean_rcp(url, path, 7)
names(ne_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ne_gov_2014, 
	"/home/dan/Data/election/US national elections/ne_gov_2014.csv",
	 row.names = FALSE)





# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/ne/nebraska_romney_vs_obama-1976.html"
path <- "#polling-data-full td"

ne_ge_2012 <- clean_rcp(url, path, 7)
names(ne_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ne_ge_2012, 
	"/home/dan/Data/election/US national elections/ne_ge_2012.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/ne/nebraska_senate_fischer_vs_kerrey-3144.html"
path <- "#polling-data-full td"

ne_sen_2012 <- clean_rcp(url, path, 6)
names(ne_sen_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ne_sen_2012, 
	"/home/dan/Data/election/US national elections/ne_sen_2012.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/ne/nebraska_2nd_district_terry_vs_ewing-3325.html"
path <- "#polling-data-full td"

ne_rep2_2012 <- clean_rcp(url, path, 6)
names(ne_rep2_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ne_rep2_2012, 
	"/home/dan/Data/election/US national elections/ne_rep2_2012.csv",
	 row.names = FALSE)



# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/ne/nebraska_governor_heineman_vs_meister-1695.html"
path <- "#polling-data-full td"

ne_gov_2010 <- clean_rcp(url, path, 6)
names(ne_gov_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ne_gov_2010, 
	"/home/dan/Data/election/US national elections/ne_gov_2010.csv",
	 row.names = FALSE)




# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ne/nebraska_mccain_vs_obama-616.html"
path <- "#polling-data-full td"

ne_ge_2008 <- clean_rcp(url, path, 6)
names(ne_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ne_ge_2008, 
	"/home/dan/Data/election/US national elections/ne_ge_2008.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/ne/nebraska_senate-920.html"
path <- "#polling-data-full td"

ne_sen_2008 <- clean_rcp(url, path, 6)
names(ne_sen_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ne_sen_2008, 
	"/home/dan/Data/election/US national elections/ne_sen_2008.csv",
	 row.names = FALSE)



# 2004


# ge
url <- "https://www.realclearpolitics.com/Presidential_04/ne_polls.html"
path <- "p+ table tr~ tr+ tr td"

ne_ge_2004 <- clean_rcp(url, path, 7)
names(ne_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
ne_ge_2004[1,] <- ""

write.csv(ne_ge_2004, 
	"/home/dan/Data/election/US national elections/ne_ge_2004.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ne_polls.html"
path <- "table:nth-child(6) div"

ne_rep1_2004 <- clean_rcp(url, path, 7)
names(ne_rep1_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ne_rep1_2004[1,] <- ""

write.csv(ne_rep1_2004, 
	"/home/dan/Data/election/US national elections/ne_rep1_2004.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ne_polls.html"
path <- "table:nth-child(10) div"

ne_rep2_2004 <- clean_rcp(url, path, 7)
names(ne_rep2_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ne_rep2_2004[1,] <- ""

write.csv(ne_rep2_2004, 
	"/home/dan/Data/election/US national elections/ne_rep2_2004.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ne_polls.html"
path <- "table:nth-child(13) div"

ne_rep3_2004 <- clean_rcp(url, path, 7)
names(ne_rep3_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ne_rep3_2004[1,] <- ""

write.csv(ne_rep3_2004, 
	"/home/dan/Data/election/US national elections/ne_rep3_2004.csv",
	 row.names = FALSE)