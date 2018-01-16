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
url <- "https://www.realclearpolitics.com/epolls/2016/president/me/maine_trump_vs_clinton_vs_johnson_vs_stein-6091.html"
path <- "#polling-data-full td"

me_ge_2016 <- clean_rcp(url, path, 9)
names(me_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "L", "G", "Spread")

write.csv(me_ge_2016, 
	"/home/dan/Data/election/US national elections/me_ge_2016.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2016/house/me/maine_2nd_district_poliquin_vs_cain-6028.html"
path <- "#polling-data-full td"

me_rep2_2016 <- clean_rcp(url, path, 7)
names(me_rep2_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(me_rep2_2016, 
	"/home/dan/Data/election/US national elections/me_rep2_2016.csv",
	 row.names = FALSE)



# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/me/maine_governor_lepage_vs_michaud_vs_cutler-3558.html"
path <- "#polling-data-full td"

me_gov_2014 <- clean_rcp(url, path, 8)
names(me_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "I", "R", "D", "Spread")

write.csv(me_gov_2014, 
	"/home/dan/Data/election/US national elections/me_gov_2014.csv",
	 row.names = FALSE)

# sen
url <- "https://realclearpolitics.com/epolls/2014/senate/me/maine_senate_collins_vs_bellows-4168.html"
path <- "#polling-data-full th , #polling-data-full td"

me_sen_2014 <- clean_rcp(url, path, 7)
names(me_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(me_sen_2014, 
	"/home/dan/Data/election/US national elections/me_sen_2014.csv",
	 row.names = FALSE)


# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/me/maine_2nd_district_poliquin_vs_cain-5118.html"
path <- "#polling-data-full td"

me_rep2_2014 <- clean_rcp(url, path, 8)
names(me_rep2_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "I", "Spread")

write.csv(me_rep2_2014, 
	"/home/dan/Data/election/US national elections/me_rep2_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/me/maine_romney_vs_obama-2097.html"
path <- "#polling-data-full td"

me_ge_2012 <- clean_rcp(url, path, 7)
names(me_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(me_ge_2012, 
	"/home/dan/Data/election/US national elections/me_ge_2012.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/me/maine_senate_summers_vs_dill_vs_king-3242.html"
path <- "#polling-data-full td"

me_sen_2012 <- clean_rcp(url, path, 7)
names(me_sen_2012) <- c("Poll", "Date", "Sample", "D", "I", "R", "Spread")

write.csv(me_sen_2012, 
	"/home/dan/Data/election/US national elections/me_sen_2012.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/me/maine_2nd_district_raye_vs_michaud-3180.html"
path <- "#polling-data-full td"

me_rep2_2012 <- clean_rcp(url, path, 6)
names(me_rep2_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(me_rep2_2012, 
	"/home/dan/Data/election/US national elections/me_rep2_2012.csv",
	 row.names = FALSE)




# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/me/maine_governor_lepage_vs_mitchell_vs_cutler-1231.html"
path <- "#polling-data-full td"

me_gov_2010 <- clean_rcp(url, path, 7)
names(me_gov_2010) <- c("Poll", "Date", "Sample", "I", "R", "D", "Spread")

write.csv(me_gov_2010, 
	"/home/dan/Data/election/US national elections/me_gov_2010.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/me/maine_1st_district_scontras_vs_pingree-1460.html"
path <- "#polling-data-full td"

me_rep1_2010 <- clean_rcp(url, path, 6)
names(me_rep1_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(me_rep1_2010, 
	"/home/dan/Data/election/US national elections/me_rep1_2010.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/me/maine_2nd_district_michaud_v_levesque-1687.html"
path <- "#polling-data-full td"

me_rep2_2010 <- clean_rcp(url, path, 6)
names(me_rep2_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(me_rep2_2010, 
	"/home/dan/Data/election/US national elections/me_rep2_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/me/maine_mccain_vs_obama-608.html"
path <- "#polling-data-full td"

me_ge_2008 <- clean_rcp(url, path, 6)
names(me_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(me_ge_2008, 
	"/home/dan/Data/election/US national elections/me_ge_2008.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/me/maine_senate-564.html"
path <- "#polling-data-full td"

me_sen_2008 <- clean_rcp(url, path, 6)
names(me_sen_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(me_sen_2008, 
	"/home/dan/Data/election/US national elections/me_ge_2008.csv",
	 row.names = FALSE)



# 2006

# gov
url <- "https://www.realclearpolitics.com/epolls/2006/governor/me/maine_governor_race-97.html"
path <- "#polling-data-full td"

me_gov_2006 <- clean_rcp(url, path, 7)
names(me_gov_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(me_gov_2006, 
	"/home/dan/Data/election/US national elections/me_gov_2006.csv",
	 row.names = FALSE)



# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/me_polls.html"
path <- "p+ table tr~ tr+ tr td"

me_ge_2004 <- clean_rcp(url, path, 7)
names(me_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
me_ge_2004[1,] <- ""

write.csv(me_ge_2004, 
	"/home/dan/Data/election/US national elections/me_ge_2004.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/me_polls.html"
path <- "table:nth-child(6) div"

me_rep1_2004 <- clean_rcp(url, path, 7)
names(me_rep1_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
me_rep1_2004[1,] <- ""

write.csv(me_rep1_2004, 
	"/home/dan/Data/election/US national elections/me_rep1_2004.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/me_polls.html"
path <- "table:nth-child(10) div"

me_rep2_2004 <- clean_rcp(url, path, 7)
names(me_rep2_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
me_rep2_2004[1,] <- ""

write.csv(me_rep2_2004, 
	"/home/dan/Data/election/US national elections/me_rep2_2004.csv",
	 row.names = FALSE)