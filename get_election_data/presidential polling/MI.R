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
url <- "https://www.realclearpolitics.com/epolls/2016/president/mi/michigan_trump_vs_clinton_vs_johnson_vs_stein-6008.html"
path <- "#polling-data-full td"

mi_ge_2016 <- clean_rcp(url, path, 9)
names(mi_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "L", "G", "Spread")

write.csv(mi_ge_2016, 
	"/home/dan/Data/election/US national elections/mi_ge_2016.csv",
	 row.names = FALSE)



# 204

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/mi/michigan_governor_snyder_vs_schauer-3506.html"
path <- "#polling-data-full td"

mi_gov_2014 <- clean_rcp(url, path, 7)
names(mi_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mi_gov_2014, 
	"/home/dan/Data/election/US national elections/mi_gov_2014.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/mi/michigan_senate_land_vs_peters-3820.html"
path <- "#polling-data-full td"

mi_sen_2014 <- clean_rcp(url, path, 7)
names(mi_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mi_sen_2014, 
	"/home/dan/Data/election/US national elections/mi_sen_2014.csv",
	 row.names = FALSE)

# 11th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/mi/michigan_11th_district_trott_vs_mckenzie-5183.html"
path <- "#polling-data-full td"

mi_rep11_2014 <- clean_rcp(url, path, 6)
names(mi_rep11_2014) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mi_rep11_2014, 
	"/home/dan/Data/election/US national elections/mi_rep11_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/mi/michigan_romney_vs_obama-1811.html"
path <- "#polling-data-full td"

mi_ge_2012 <- clean_rcp(url, path, 7)
names(mi_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(mi_ge_2012, 
	"/home/dan/Data/election/US national elections/mi_ge_2012.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/mi/michigan_senate_hoekstra_vs_stabenow-1817.html"
path <- "#polling-data-full td"

mi_sen_2012 <- clean_rcp(url, path, 6)
names(mi_sen_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mi_sen_2012, 
	"/home/dan/Data/election/US national elections/mi_sen_2012.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/mi/michigan_1st_district_benishek_vs_mcdowell-3315.html"
path <- "#polling-data-full td"

mi_rep1_2012 <- clean_rcp(url, path, 6)
names(mi_rep1_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mi_rep1_2012, 
	"/home/dan/Data/election/US national elections/mi_rep1_2012.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/mi/michigan_3rd_district_amash_vs_pestka-3331.html"
path <- "#polling-data-full td"

mi_rep3_2012 <- clean_rcp(url, path, 6)
names(mi_rep3_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mi_rep3_2012, 
	"/home/dan/Data/election/US national elections/mi_rep3_2012.csv",
	 row.names = FALSE)

# 11th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/mi/michigan_11th_district_bentivolio_vs_taj-3332.html"
path <- "#polling-data-full td"

mi_rep11_2012 <- clean_rcp(url, path, 6)
names(mi_rep11_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mi_rep11_2012, 
	"/home/dan/Data/election/US national elections/mi_rep11_2012.csv",
	 row.names = FALSE)



# 2010 

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/mi/michigan_governor_snyder_vs_bernero-1407.html"
path <- "#polling-data-full td"

mi_gov_2010 <- clean_rcp(url, path, 6)
names(mi_gov_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mi_gov_2010, 
	"/home/dan/Data/election/US national elections/mi_gov_2010.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/mi/michigan_1st_district_benishek_vs_mcdowell-1468.html"
path <- "#polling-data-full td"

mi_rep1_2010 <- clean_rcp(url, path, 6)
names(mi_rep1_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(mi_rep1_2010, 
	"/home/dan/Data/election/US national elections/mi_rep1_2010.csv",
	 row.names = FALSE)

# 7th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/mi/michigan_7th_district_walberg_vs_schauer-1259.html"
path <- "#polling-data-full td"

mi_rep7_2010 <- clean_rcp(url, path, 6)
names(mi_rep7_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mi_rep7_2010, 
	"/home/dan/Data/election/US national elections/mi_rep7_2010.csv",
	 row.names = FALSE)

# 9th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/mi/michigan_9th_district_raczkowski_vs_peters-1375.html"
path <- "#polling-data-full td"

mi_rep9_2010 <- clean_rcp(url, path, 6)
names(mi_rep9_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mi_rep9_2010, 
	"/home/dan/Data/election/US national elections/mi_rep9_2010.csv",
	 row.names = FALSE)

# 15th congressinoal district
url <- "https://www.realclearpolitics.com/epolls/2010/house/mi/michigan_15th_district_steele_vs_dingell-1699.html"
path <- "#polling-data-full td"

mi_rep15_2010 <- clean_rcp(url, path, 6)
names(mi_rep15_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mi_rep15_2010, 
	"/home/dan/Data/election/US national elections/mi_rep15_2010.csv",
	 row.names = FALSE)




# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/mi/michigan_mccain_vs_obama-553.html"
path <- "#polling-data-full td"

mi_ge_2008 <- clean_rcp(url, path, 7)
names(mi_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(mi_ge_2008, 
	"/home/dan/Data/election/US national elections/mi_ge_2008.csv",
	 row.names = FALSE)

# 7th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/mi/michigan_7th_district-963.html"
path <- "#polling-data-full td"

mi_rep7_2008 <- clean_rcp(url, path, 6)
names(mi_rep7_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(mi_rep7_2008, 
	"/home/dan/Data/election/US national elections/mi_rep7_2008.csv",
	 row.names = FALSE)



# 2006

# sen
url <- "https://www.realclearpolitics.com/epolls/2006/senate/mi/michigan_senate_race-24.html"
path <- "tr:nth-child(14) .poll_table td"

mi_sen_2006 <- clean_rcp(url, path, 7)
names(mi_sen_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")
mi_sen_2006[1,] <- ""

write.csv(mi_sen_2006, 
	"/home/dan/Data/election/US national elections/mi_sen_2006.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2006/governor/mi/michigan_governor_race-13.html"
path <- "#polling-data-full td"

mi_gov_2006 <- clean_rcp(url, path, 7)
names(mi_gov_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(mi_gov_2006, 
	"/home/dan/Data/election/US national elections/mi_gov_2006.csv",
	 row.names = FALSE)



# 2004 

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/mi_polls.html"
path <- "p+ table tr~ tr+ tr td"

mi_ge_2004 <- clean_rcp(url, path, 7)
names(mi_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
mi_ge_2004[1,] <- ""

write.csv(mi_ge_2004, 
	"/home/dan/Data/election/US national elections/mi_ge_2004.csv",
	 row.names = FALSE)