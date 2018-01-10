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
url <- "https://www.realclearpolitics.com/epolls/2016/president/ar/arkansas_trump_vs_clinton-5899.html"
path <- "#polling-data-full td"

ar_ge_2016 <- clean_rcp(url, path, 7)
names(ar_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ak_ge_2016, 
	"/home/dan/Data/election/US national elections/ar_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/ar/arkansas_senate_boozman_vs_eldridge-5988.html"
path <- "#polling-data-full td"

ar_se_2016 <- clean_rcp(url, path, 7)
names(ar_se_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ar_se_2016, 
	"/home/dan/Data/election/US national elections/ar_se_2016.csv",
	 row.names = FALSE)




# 2014

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/ar/arkansas_senate_cotton_vs_pryor-4049.html"
path <- "#polling-data-full td"

ar_se_2014 <- clean_rcp(url, path, 7)
names(ar_se_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ar_se_2014, 
	"/home/dan/Data/election/US national elections/ar_se_2014.csv",
	 row.names = FALSE)

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/ar/arkansas_governor_hutchinson_vs_ross-3726.html"
path <- "#polling-data-full td"

ar_gov_2014 <- clean_rcp(url, path, 7)
names(ar_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ar_gov_2014, 
	"/home/dan/Data/election/US national elections/ar_gov_2014.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/ar/arkansas_2nd_district_hill_vs_hays-5061.html"
path <- "#polling-data-full td"

ar_rep2_2014 <- clean_rcp(url, path, 7)
names(ar_rep2_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ar_rep2_2014, 
	"/home/dan/Data/election/US national elections/ar_rep2_2014.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/ar/arkansas_4th_district_westerman_vs_witt-5062.html"
path <- "#polling-data-full td"

ar_rep4_2014 <- clean_rcp(url, path, 7)
names(ar_rep4_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ar_rep4_2014, 
	"/home/dan/Data/election/US national elections/ar_rep4_2014.csv",
	 row.names = FALSE)


# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/ar/arkansas_romney_vs_obama-2918.html"
path <- "#polling-data-full td"

ar_ge_2012 <- clean_rcp(url, path, 7)
names(ar_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ar_ge_2012, 
	"/home/dan/Data/election/US national elections/ar_ge_2012.csv",
	 row.names = FALSE)


# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/ar/arkansas_1st_district_crawford_vs_ellington-3272.html"
path <- "#polling-data-full td"

ar_rep1_2012 <- clean_rcp(url, path, 6)
names(ar_rep1_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ar_rep1_2012, 
	"/home/dan/Data/election/US national elections/ar_rep1_2012.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/ar/arkansas_4th_district_cotton_vs_jeffress-3273.html"
path <- "#polling-data-full td"

ar_rep4_2012 <- clean_rcp(url, path, 6)
names(ar_rep4_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ar_rep4_2012, 
	"/home/dan/Data/election/US national elections/ar_rep4_2012.csv",
	 row.names = FALSE)




# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/ar/arkansas_governor_keet_vs_beebe-1568.html"
path <- "#polling-data-full td"

ar_gov_2010 <- clean_rcp(url, path, 6)
names(ar_gov_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ar_gov_2010, 
	"/home/dan/Data/election/US national elections/ar_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/ar/arkansas_senate_boozman_vs_lincoln-1186.html"
path <- "#polling-data-full td"

ar_sen_2010 <- clean_rcp(url, path, 6)
names(ar_sen_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ar_sen_2010, 
	"/home/dan/Data/election/US national elections/ar_sen_2010.csv",
	 row.names = FALSE)


# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ar/arkansas_1st_district_crawford_vs_causey-1261.html"
path <- "#polling-data-full td"

ar_rep1_2010 <- clean_rcp(url, path, 6)
names(ar_rep1_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ar_rep1_2010, 
	"/home/dan/Data/election/US national elections/ar_rep1_2010.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ar/arkansas_2nd_district_griffin_vs_elliott-1253.html"
path <- "#polling-data-full td"

ar_rep2_2010 <- clean_rcp(url, path, 6)
names(ar_rep2_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ar_rep2_2010, 
	"/home/dan/Data/election/US national elections/ar_rep2_2010.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ar/arkansas_4th_district_rankin_vs_ross-1343.html"
path <- "#polling-data-full td"

ar_rep4_2010 <- clean_rcp(url, path, 6)
names(ar_rep4_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ar_rep4_2010, 
	"/home/dan/Data/election/US national elections/ar_rep4_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ar/arkansas_mccain_vs_obama-592.html"
path <- "#polling-data-full td"

ar_rep4_2010 <- clean_rcp(url, path, 6)
names(ar_rep4_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ar_rep4_2010, 
	"/home/dan/Data/election/US national elections/ar_rep4_2010.csv",
	 row.names = FALSE)


# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/ar_polls.html"
path <- "p+ table div"

ar_ge_2004 <- clean_rcp(url, path, 7)
names(ar_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")

write.csv(ar_ge_2004, 
	"/home/dan/Data/election/US national elections/ar_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/ar_polls.html"
path <- "table:nth-child(6) div"

ar_sen_2004 <- clean_rcp(url, path, 7)
names(ar_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
ar_sen_2004[1,] <- ""

write.csv(ar_sen_2004, 
	"/home/dan/Data/election/US national elections/ar_sen_2004.csv",
	 row.names = FALSE)


# 2nd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ar_polls.html"
path <- "table:nth-child(9) tr~ tr+ tr font"

ar_rep2_2004 <- clean_rcp(url, path, 7)
names(ar_rep2_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")

write.csv(ar_rep2_2004, 
	"/home/dan/Data/election/US national elections/ar_rep2_2004.csv",
	 row.names = FALSE)
