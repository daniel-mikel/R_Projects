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
url <- "https://www.realclearpolitics.com/epolls/2016/president/mo/missouri_trump_vs_clinton_vs_johnson_vs_stein-6009.html"
path <- "#polling-data-full td"

mo_ge_2016 <- clean_rcp(url, path, 9)
names(mo_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

write.csv(mo_ge_2016, 
	"/home/dan/Data/election/US national elections/mo_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/mo/missouri_senate_blunt_vs_kander-5631.html"
path <- "#polling-data-full td"

mo_sen_2016 <- clean_rcp(url, path, 7)
names(mo_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mo_sen_2016, 
	"/home/dan/Data/election/US national elections/mo_sen_2016.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2016/governor/mo/missouri_governor_greitens_vs_koster-5627.html"
path <- "#polling-data-full td"

mo_gov_2016 <- clean_rcp(url, path, 7)
names(mo_gov_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mo_gov_2016, 
	"/home/dan/Data/election/US national elections/mo_gov_2016.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/mo/missouri_romney_vs_obama-1800.html"
path <- "#polling-data-full td"

mo_ge_2012 <- clean_rcp(url, path, 7)
names(mo_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mo_ge_2012, 
	"/home/dan/Data/election/US national elections/mo_ge_2012.csv",
	 row.names = FALSE)


# gov
url <- "https://www.realclearpolitics.com/epolls/2012/governor/mo/missouri_governor_spence_vs_nixon-3095.html"
path <- "#polling-data-full td"

mo_ge_2012 <- clean_rcp(url, path, 6)
names(mo_ge_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mo_ge_2012, 
	"/home/dan/Data/election/US national elections/mo_ge_2012.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/mo/missouri_senate_akin_vs_mccaskill-2079.html"
path <- "#polling-data-full td"

mo_sen_2012 <- clean_rcp(url, path, 6)
names(mo_sen_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mo_sen_2012, 
	"/home/dan/Data/election/US national elections/mo_sen_2012.csv",
	 row.names = FALSE)




# 2010

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/mo/missouri_senate_blunt_vs_carnahan-1066.html"
path <- "#polling-data-full td"

mo_sen_2010 <- clean_rcp(url, path, 6)
names(mo_sen_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mo_sen_2010, 
	"/home/dan/Data/election/US national elections/mo_sen_2010.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/mo/missouri_3rd_district_martin_vs_carnahan-1377.html"
path <- "#polling-data-full td"

mo_rep3_2010 <- clean_rcp(url, path, 6)
names(mo_rep3_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mo_rep3_2010, 
	"/home/dan/Data/election/US national elections/mo_rep3_2010.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/mo/missouri_4th_district_hartzler_vs_skelton-1292.html"
path <- "#polling-data-full td"

mo_rep4_2010 <- clean_rcp(url, path, 6)
names(mo_rep4_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mo_rep4_2010, 
	"/home/dan/Data/election/US national elections/mo_rep4_2010.csv",
	 row.names = FALSE)




# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/mo/missouri_mccain_vs_obama-545.html"
path <- "#polling-data-full td"

mo_ge_2008 <- clean_rcp(url, path, 7)
names(mo_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mo_ge_2008, 
	"/home/dan/Data/election/US national elections/mo_ge_2008.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2008/governor/mo/missouri_governor-385.html"
path <- "#polling-data-full td"

mo_gov_2008 <- clean_rcp(url, path, 6)
names(mo_gov_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mo_gov_2008, 
	"/home/dan/Data/election/US national elections/mo_gov_2008.csv",
	 row.names = FALSE)

# 6th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/mo/missouri_6th_district-949.html"
path <- "#polling-data-full td"

mo_rep6_2008 <- clean_rcp(url, path, 6)
names(mo_rep6_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mo_rep6_2008, 
	"/home/dan/Data/election/US national elections/mo_rep6_2008.csv",
	 row.names = FALSE)

# 9th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/mo/missouri_9th_district-996.html"
path <- "#polling-data-full td"

mo_rep9_2008 <- clean_rcp(url, path, 6)
names(mo_rep9_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mo_rep9_2008, 
	"/home/dan/Data/election/US national elections/mo_rep9_2008.csv",
	 row.names = FALSE)




# 2006

# sen
url <- "https://www.realclearpolitics.com/epolls/2006/senate/mo/missouri_senate_race-12.html"
path <- "tr:nth-child(14) .poll_table td"

mo_sen_2006 <- clean_rcp(url, path, 7)
mo_sen_2006 <- mo_sen_2006[2:nrow(mo_sen_2006),]
names(mo_sen_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(mo_sen_2006, 
	"/home/dan/Data/election/US national elections/mo_sen_2006.csv",
	 row.names = FALSE)




# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/mo_polls.html"
path <- "p+ table tr~ tr+ tr td"

mo_ge_2004 <- clean_rcp(url, path, 7)
names(mo_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
mo_ge_2004[1,] <- ""

write.csv(mo_ge_2004, 
	"/home/dan/Data/election/US national elections/mo_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/mo_polls.html"
path <- "table:nth-child(5) div"

mo_sen_2004 <- clean_rcp(url, path, 7)
names(mo_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
mo_sen_2004[1,] <- ""

write.csv(mo_sen_2004, 
	"/home/dan/Data/election/US national elections/mo_sen_2004.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/Presidential_04/mo_polls.html"
path <- "table:nth-child(9) div"

mo_gov_2004 <- clean_rcp(url, path, 7)
names(mo_gov_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
mo_gov_2004[1,] <- ""

write.csv(mo_gov_2004, 
	"/home/dan/Data/election/US national elections/mo_gov_2004.csv",
	 row.names = FALSE)

# 5th congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/mo_polls.html"
path <- "table:nth-child(13) div"

mo_rep5_2004 <- clean_rcp(url, path, 7)
names(mo_rep5_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
mo_rep5_2004[1,] <- ""

write.csv(mo_rep5_2004, 
	"/home/dan/Data/election/US national elections/mo_rep5_2004.csv",
	 row.names = FALSE)

# 6th congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/mo_polls.html"
path <- "table:nth-child(17) div"

mo_rep6_2004 <- clean_rcp(url, path, 7)
names(mo_rep6_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
mo_rep6_2004[1,] <- ""

write.csv(mo_rep6_2004, 
	"/home/dan/Data/election/US national elections/mo_rep6_2004.csv",
	 row.names = FALSE)