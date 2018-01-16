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
url <- "https://www.realclearpolitics.com/epolls/2016/president/ks/kansas_trump_vs_clinton_vs_johnson_vs_stein-6131.html"
path <- "#polling-data-full td"

ks_ge_2016 <- clean_rcp(url, path, 9)
names(ks_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

write.csv(ks_ge_2016, 
	"/home/dan/Data/election/US national elections/ks_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/ks/kansas_senate_moran_vs_wiesner-6011.html"
path <- "#polling-data-full td"

ks_sen_2016 <- clean_rcp(url, path, 7)
names(ks_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ks_sen_2016, 
	"/home/dan/Data/election/US national elections/ks_sen_2016.csv",
	 row.names = FALSE)



# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/ks/kansas_governor_brownback_vs_davis-4146.html"
path <- "#polling-data-full td"

ks_gov_2014 <- clean_rcp(url, path, 7)
names(ks_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ks_gov_2014, 
	"/home/dan/Data/election/US national elections/ks_gov_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/ks/kansas_romney_vs_obama-2988.html"
path <- "#polling-data-full td"

ks_ge_2012 <- clean_rcp(url, path, 7)
names(ks_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ks_ge_2012, 
	"/home/dan/Data/election/US national elections/ks_ge_2012.csv",
	 row.names = FALSE)


# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/ks/kansas_governor_brownback_vs_holland-1235.html"
path <- "#polling-data-full td"

ks_gov_2010 <- clean_rcp(url, path, 6)
names(ks_gov_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ks_gov_2010, 
	"/home/dan/Data/election/US national elections/ks_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/ks/kansas_senate_moran_vs_johnston-1520.html"
path <- "#polling-data-full td"

ks_sen_2010 <- clean_rcp(url, path, 6)
names(ks_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ks_sen_2010, 
	"/home/dan/Data/election/US national elections/ks_sen_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ks/kansas_mccain_vs_obama-555.html"
path <- "#polling-data-full td"

ks_ge_2008 <- clean_rcp(url, path, 7)
names(ks_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ks_ge_2008, 
	"/home/dan/Data/election/US national elections/ks_ge_2008.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/ks/kansas_2nd_district-987.html"
path <- "#polling-data-full td"

ks_rep2_2008 <- clean_rcp(url, path, 6)
names(ks_rep2_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ks_rep2_2008, 
	"/home/dan/Data/election/US national elections/ks_rep2_2008.csv",
	 row.names = FALSE)



# 2006

# gov
url <- "https://www.realclearpolitics.com/epolls/2006/governor/ks/kansas_governor_race-51.html"
path <- "#polling-data-full td"

ks_gov_2006 <- clean_rcp(url, path, 7)
names(ks_gov_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ks_gov_2006, 
	"/home/dan/Data/election/US national elections/ks_gov_2006.csv",
	 row.names = FALSE)



# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/ks_polls.html"
path <- "p+ table tr~ tr+ tr td"

ks_ge_2004 <- clean_rcp(url, path, 7)
names(ks_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
ks_ge_2004[1,] <- ""

write.csv(ks_ge_2004, 
	"/home/dan/Data/election/US national elections/ks_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/ks_polls.html"
path <- "table:nth-child(6) div"

ks_sen_2004 <- clean_rcp(url, path, 7)
names(ks_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ks_sen_2004[1,] <- ""

write.csv(ks_sen_2004, 
	"/home/dan/Data/election/US national elections/ks_sen_2004.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ks_polls.html"
path <- "table:nth-child(10) div"

ks_rep3_2004 <- clean_rcp(url, path, 7)
names(ks_rep3_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ks_rep3_2004[1,] <- ""

write.csv(ks_rep3_2004, 
	"/home/dan/Data/election/US national elections/ks_rep3_2004.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ks_polls.html"
path <- "table:nth-child(14) div"

ks_rep4_2004 <- clean_rcp(url, path, 7)
names(ks_rep4_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ks_rep4_2004[1,] <- ""

write.csv(ks_rep4_2004, 
	"/home/dan/Data/election/US national elections/ks_rep4_2004.csv",
	 row.names = FALSE)