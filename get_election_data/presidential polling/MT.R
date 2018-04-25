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
url <- "https://www.realclearpolitics.com/epolls/2016/president/mt/montana_trump_vs_clinton-5893.html"
path <- "#polling-data-full td"

mt_ge_2016 <- clean_rcp(url, path, 7)
names(mt_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mt_ge_2016, 
	"/home/dan/Data/election/US national elections/mt_ge_2016.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2016/governor/mt/montana_governor_gianforte_vs_bullock-6098.html"
path <- "#polling-data-full td"

mt_gov_2016 <- clean_rcp(url, path, 7)
names(mt_gov_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mt_gov_2016, 
	"/home/dan/Data/election/US national elections/mt_gov_2016.csv",
	 row.names = FALSE)



# 2014

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/mt/montana_senate_daines_vs_curtis-5190.html"
path <- "#polling-data-full td"

mt_sen_2014 <- clean_rcp(url, path, 7)
names(mt_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mt_sen_2014, 
	"/home/dan/Data/election/US national elections/mt_sen_2014.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/mt/montana_atlarge_zinke_vs_lewis-4196.html"
path <- "#polling-data-full td"
mt_rep1_2014 <- clean_rcp(url, path, 6)
names(mt_rep1_2014) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mt_rep1_2014, 
	"/home/dan/Data/election/US national elections/mt_rep1_2014.csv",
	 row.names = FALSE)




# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/mt/montana_romney_vs_obama-1780.html"
path <- "#polling-data-full td"

mt_ge_2012 <- clean_rcp(url, path, 7)
names(mt_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mt_ge_2012, 
	"/home/dan/Data/election/US national elections/mt_ge_2012.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2012/governor/mt/montana_governor_hill_vs_bullock-1839.html"
path <- "#polling-data-full td"

mt_gov_2012 <- clean_rcp(url, path, 6)
names(mt_gov_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mt_gov_2012, 
	"/home/dan/Data/election/US national elections/mt_gov_2012.csv",
	 row.names = FALSE)


# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/mt/montana_senate_rehberg_vs_tester-1826.html"
path <- "#polling-data-full td"

mt_sen_2012 <- clean_rcp(url, path, 6)
names(mt_sen_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mt_sen_2012, 
	"/home/dan/Data/election/US national elections/mt_sen_2012.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/mt/montana_atlarge_daines_vs_gillan-2784.html"
path <- "#polling-data-full td"

mt_rep1_2012 <- clean_rcp(url, path, 6)
names(mt_rep1_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mt_rep1_2012, 
	"/home/dan/Data/election/US national elections/mt_rep1_2012.csv",
	 row.names = FALSE)




# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/mt/montana_mccain_vs_obama-614.html"
path <- "#polling-data-full td"

mt_ge_2008 <- clean_rcp(url, path, 6)
names(mt_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mt_ge_2008, 
	"/home/dan/Data/election/US national elections/mt_ge_2008.csv",
	 row.names = FALSE)




# 2006

# sen
url <- "https://www.realclearpolitics.com/epolls/2006/senate/mt/montana_senate_race-11.html"
path <- "#polling-data-full td"

mt_sen_2006 <- clean_rcp(url, path, 7)
names(mt_sen_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(mt_sen_2006, 
	"/home/dan/Data/election/US national elections/mt_sen_2006.csv",
	 row.names = FALSE)



# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/mt_polls.html"
path <- "p+ table tr~ tr+ tr td"

mt_ge_2004 <- clean_rcp(url, path, 7)
names(mt_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
mt_ge_2004[1,] <- ""

write.csv(mt_ge_2004, 
	"/home/dan/Data/election/US national elections/mt_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/mt_polls.html"
path <- "table:nth-child(6) div"

me_sen_2004 <- clean_rcp(url, path, 7)
names(me_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
me_sen_2004[1,] <- ""

write.csv(me_sen_2004, 
	"/home/dan/Data/election/US national elections/me_sen_2004.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/mt_polls.html"
path <- "table:nth-child(9) div"

mt_rep1_2004 <- clean_rcp(url, path, 7)
names(mt_rep1_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
mt_rep1_2004[1,] <- ""

write.csv(mt_rep1_2004, 
	"/home/dan/Data/election/US national elections/mt_rep1_2004.csv",
	 row.names = FALSE)
