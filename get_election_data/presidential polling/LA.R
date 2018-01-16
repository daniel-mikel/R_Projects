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
url <- "https://www.realclearpolitics.com/epolls/2016/president/la/louisiana_trump_vs_clinton_vs_johnson_vs_stein-6146.html"
path <- "#polling-data-full td"

la_ge_2016 <- clean_rcp(url, path, 9)
names(la_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

write.csv(la_ge_2016, 
	"/home/dan/Data/election/US national elections/la_ge_2016.csv",
	 row.names = FALSE)



# 2014

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/la/louisiana_senate_cassidy_vs_landrieu-3670.html"
path <- "#polling-data-full td"

la_sen_2014 <- clean_rcp(url, path, 7)
names(la_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(la_sen_2014, 
	"/home/dan/Data/election/US national elections/la_sen_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/la/louisiana_romney_vs_obama-2942.html"
path <- "#polling-data-full td"

la_ge_2012 <- clean_rcp(url, path, 7)
names(la_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(la_ge_2012, 
	"/home/dan/Data/election/US national elections/la_ge_2012.csv",
	 row.names = FALSE)



# 2011

# gov
url <- "https://www.realclearpolitics.com/epolls/2011/governor/la/louisiana_governor-2939.html"
path <- "#polling-data-full td"

la_gov_2011 <- clean_rcp(url, path, 6)
names(la_gov_2011) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(la_gov_2011, 
	"/home/dan/Data/election/US national elections/la_gov_2011.csv",
	 row.names = FALSE)



# 2010

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/la/louisiana_senate_vitter_vs_melancon-1095.html"
path <- "#polling-data-full td"

la_sen_2010 <- clean_rcp(url, path, 6)
names(la_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(la_sen_2010, 
	"/home/dan/Data/election/US national elections/la_sen_2010.csv",
	 row.names = FALSE)


# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/la/louisiana_2nd_district_cao_vs_richmond-1301.html"
path <- "#polling-data-full td"

la_rep2_2010 <- clean_rcp(url, path, 6)
names(la_rep2_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(la_rep2_2010, 
	"/home/dan/Data/election/US national elections/la_rep2_2010.csv",
	 row.names = FALSE)




# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/la/louisiana_mccain_vs_obama-606.html"
path <- "#polling-data-full td"

la_ge_2008 <- clean_rcp(url, path, 6)
names(la_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(la_ge_2008, 
	"/home/dan/Data/election/US national elections/la_ge_2008.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/la/louisiana_senate-565.html"
path <- "#polling-data-full td"

la_sen_2008 <- clean_rcp(url, path, 6)
names(la_sen_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(la_sen_2008, 
	"/home/dan/Data/election/US national elections/la_sen_2008.csv",
	 row.names = FALSE)




# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/la_polls.html"
path <- "p+ table tr~ tr+ tr td"

la_ge_2004 <- clean_rcp(url, path, 7)
names(la_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
la_ge_2004[1,] <- ""

write.csv(la_ge_2004, 
	"/home/dan/Data/election/US national elections/la_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/la_polls.html"
path <- "table:nth-child(6) div"

la_sen_2004 <- clean_rcp(url, path, 7)
names(la_sen_2004) <- c("Poll | Date", "Sample", "R", "D1", "D2", "Undecided", "Spread")
la_sen_2004[1,] <- ""

write.csv(la_sen_2004, 
	"/home/dan/Data/election/US national elections/la_sen_2004.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/la_polls.html"
path <- "table:nth-child(10) div"

la_rep3_2004 <- clean_rcp(url, path, 7)
names(la_rep3_2004) <- c("Poll | Date", "Sample", "R1", "R2", "D", "Undecided", "Spread")
la_rep3_2004[1,] <- ""

write.csv(la_rep3_2004, 
	"/home/dan/Data/election/US national elections/la_rep3_2004.csv",
	 row.names = FALSE)

# 5th congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/la_polls.html"
path <- "table:nth-child(14) div"

la_rep5_2004 <- clean_rcp(url, path, 7)
names(la_rep5_2004) <- c("Poll | Date", "Sample", "R1", "D", "R2", "Undecided", "Spread")
la_rep5_2004[1,] <- ""

write.csv(la_rep5_2004, 
	"/home/dan/Data/election/US national elections/la_rep5_2004.csv",
	 row.names = FALSE)

# 7th congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/la_polls.html"
path <- "table:nth-child(17) div"

la_rep7_2004 <- clean_rcp(url, path, 7)
names(la_rep7_2004) <- c("Poll | Date", "Sample", "R", "D1", "D2", "Undecided", "Spread")
la_rep7_2004[1,] <- ""

write.csv(la_rep7_2004, 
	"/home/dan/Data/election/US national elections/la_rep7_2004.csv",
	 row.names = FALSE)