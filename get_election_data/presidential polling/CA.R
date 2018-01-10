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
url <- "https://www.realclearpolitics.com/epolls/2016/president/ca/california_trump_vs_clinton_vs_johnson_vs_stein-6083.html"
path <- "#polling-data-full td"

ca_ge_2016 <- clean_rcp(url, path, 9)
names(ca_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "L", "G", "Spread")

write.csv(ca_ge_2016, 
	"/home/dan/Data/election/US national elections/ca_ge_2016.csv",
	 row.names = FALSE)

# sen
	# Kamala Harris v Loretta Sanchez, both ran as democrats in california's 
	# to avoid confusion, i've labeled Loretta Sanchez as 'D2' instead of using both as 'D'
	# this may need to change at some point

url <- "https://www.realclearpolitics.com/epolls/2016/senate/ca/california_senate_harris_vs_sanchez-5991.html"
path <- "#polling-data-full td"

ca_sen_2016 <- clean_rcp(url, path, 7)
names(ca_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "D2", "Spread")

write.csv(ca_sen_2016, 
	"/home/dan/Data/election/US national elections/ca_sen_2016.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/ca/california_romney_vs_obama-2009.html"
path <- "#polling-data-full td"

ca_ge_2012 <- clean_rcp(url, path, 7)
names(ca_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ca_ge_2012, 
	"/home/dan/Data/election/US national elections/ca_ge_2012.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/ca/california_senate_emken_vs_feinstein-3220.html"
path <- "#polling-data-full td"

ca_sen_2012 <- clean_rcp(url, path, 6)
names(ca_sen_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ca_sen_2012, 
	"/home/dan/Data/election/US national elections/ca_sen_2012.csv",
	 row.names = FALSE)




# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/ca/california_governor_whitman_vs_brown-1113.html"
path <- "#polling-data-full td"

ca_gov_2010 <- clean_rcp(url, path, 6)
names(ca_gov_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ca_gov_2010, 
	"/home/dan/Data/election/US national elections/ca_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/ca/california_senate_boxer_vs_fiorina-1094.html"
path <- "#polling-data-full td"

ca_sen_2010 <- clean_rcp(url, path, 6)
names(ca_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ca_sen_2010, 
	"/home/dan/Data/election/US national elections/ca_sen_2010.csv",
	 row.names = FALSE)

# 11th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ca/california_11th_district_harmer_vs_mcnerney-1296.html"
path <- "#polling-data-full td"

ca_rep11_2010 <- clean_rcp(url, path, 6)
names(ca_rep11_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ca_rep11_2010, 
	"/home/dan/Data/election/US national elections/ca_rep11_2010.csv",
	 row.names = FALSE)

# 18th congressional district

url <- "https://www.realclearpolitics.com/epolls/2010/house/ca/california_18th_district_berryhill_vs_cardoza-1371.html"
path <- "#polling-data-full td"

ca_rep18_2010 <- clean_rcp(url, path, 6)
names(ca_rep18_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ca_rep18_2010, 
	"/home/dan/Data/election/US national elections/ca_rep18_2010.csv",
	 row.names = FALSE)

# 20th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ca/california_20th_district_vidak_vs_costa-1344.html"
path <- "#polling-data-full td"

ca_rep20_2010 <- clean_rcp(url, path, 6)
names(ca_rep20_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ca_rep20_2010, 
	"/home/dan/Data/election/US national elections/ca_rep20_2010.csv",
	 row.names = FALSE)

# 47th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ca/california_47th_district_tran_vs_sanchez-1303.html"
path <- "#polling-data-full td"

ca_rep47_2010 <- clean_rcp(url, path, 6)
names(ca_rep47_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ca_rep47_2010, 
	"/home/dan/Data/election/US national elections/ca_rep47_2010.csv",
	 row.names = FALSE)




# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ca/california_mccain_vs_obama-558.html"
path <- "#polling-data-full td"

ca_ge_2008 <- clean_rcp(url, path, 7)
names(ca_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ca_ge_2008, 
	"/home/dan/Data/election/US national elections/ca_ge_2008.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/ca/california_4th_district-975.html"
path <- "#polling-data-full td"

ca_rep4_2008 <- clean_rcp(url, path, 6)
names(ca_rep4_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ca_rep4_2008, 
	"/home/dan/Data/election/US national elections/ca_rep4_2008.csv",
	 row.names = FALSE)



# 2006

# gov
url <- "https://www.realclearpolitics.com/epolls/2006/governor/ca/california_governor_race-32.html"
path <- "#polling-data-full td"

ca_gov_2006 <- clean_rcp(url, path, 7)
names(ca_gov_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ca_gov_2006, 
	"/home/dan/Data/election/US national elections/ca_gov_2006.csv",
	 row.names = FALSE)

# sen

url <- "https://www.realclearpolitics.com/epolls/2006/governor/ca/california_governor_race-32.html"
path <- "#polling-data-full td"

ca_sen_2006 <- clean_rcp(url, path, 7)
names(ca_sen_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ca_sen_2006, 
	"/home/dan/Data/election/US national elections/ca_sen_2006.csv",
	 row.names = FALSE)

# 4th congressional district

url <- "https://www.realclearpolitics.com/epolls/2006/house/ca/california_4-106.html"
path <- "#polling-data-full td"

ca_rep4_2006 <- clean_rcp(url, path, 7)
names(ca_rep4_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ca_rep4_2006, 
	"/home/dan/Data/election/US national elections/ca_rep4_2006.csv",
	 row.names = FALSE)

# 11th congressional district

url <- "https://www.realclearpolitics.com/epolls/2006/house/ca/california_11-169.html"
path <- "#polling-data-full td"

ca_rep11_2006 <- clean_rcp(url, path, 7)
names(ca_rep11_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(ca_rep11_2006, 
	"/home/dan/Data/election/US national elections/ca_rep11_2006.csv",
	 row.names = FALSE)



# 2004


# ge
url <- "https://www.realclearpolitics.com/Presidential_04/ca_polls.html"
path <- "p+ table tr~ tr+ tr td"

ca_ge_2004 <- clean_rcp(url, path, 7)
names(ca_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
ca_ge_2004[1,] <- ""

write.csv(ca_ge_2004, 
	"/home/dan/Data/election/US national elections/ca_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/ca_polls.html"
path <- "table:nth-child(6) div"

ca_sen_2004 <- clean_rcp(url, path, 7)
names(ca_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ca_sen_2004[1,] <- ""

write.csv(ca_sen_2004, 
	"/home/dan/Data/election/US national elections/ca_sen_2004.csv",
	 row.names = FALSE)
