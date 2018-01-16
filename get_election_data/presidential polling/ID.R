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
url <- "https://www.realclearpolitics.com/epolls/2016/president/id/idaho_trump_vs_clinton_vs_johnson_vs_stein-6016.html"
path <- "#polling-data-full td"

id_ge_2016 <- clean_rcp(url, path, 9)
names(id_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

write.csv(id_ge_2016, 
	"/home/dan/Data/election/US national elections/id_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/id/idaho_senate_crapo_vs_sturgill-5993.html"
path <- "#polling-data-full td"

id_ge_2016 <- clean_rcp(url, path, 7)
names(id_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D","Spread")

write.csv(id_ge_2016, 
	"/home/dan/Data/election/US national elections/id_ge_2016.csv",
	 row.names = FALSE)



# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/id/idaho_governor_otter_vs_balukoff-5059.html"
path <- "#polling-data-full td"

id_gov_2014 <- clean_rcp(url, path, 7)
names(id_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R","Spread")

write.csv(id_gov_2014, 
	"/home/dan/Data/election/US national elections/id_gov_2014.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/id/idaho_senate_risch_vs_mitchell-5060.html"
path <- "#polling-data-full td"

id_sen_2014 <- clean_rcp(url, path, 7)
names(id_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D","Spread")

write.csv(id_sen_2014, 
	"/home/dan/Data/election/US national elections/id_sen_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/id/idaho_romney_vs_obama-3388.html"
path <- "#polling-data-full td"

id_ge_2012 <- clean_rcp(url, path, 7)
names(id_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R","Spread")

write.csv(id_ge_2012, 
	"/home/dan/Data/election/US national elections/id_ge_2012.csv",
	 row.names = FALSE)



# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/id/idaho_governor_otter_vs_allred-1429.html"
path <- "#polling-data-full td"

id_gov_2010 <- clean_rcp(url, path, 6)
names(id_gov_2010) <- c("Poll", "Date", "Sample", "D", "R","Spread")

write.csv(id_gov_2010, 
	"/home/dan/Data/election/US national elections/id_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/id/idaho_senate_crapo_vs_sullivan-1525.html"
path <- "#polling-data-full td"

id_sen_2010 <- clean_rcp(url, path, 6)
names(id_sen_2010) <- c("Poll", "Date", "Sample", "R", "D","Spread")

write.csv(id_sen_2010, 
	"/home/dan/Data/election/US national elections/id_sen_2010.csv",
	 row.names = FALSE)


# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/id/idaho_1st_district_labrador_vs_minnick-1266.html"
path <- "#polling-data-full td"

id_rep1_2010 <- clean_rcp(url, path, 6)
names(id_rep1_2010) <- c("Poll", "Date", "Sample", "R", "D","Spread")

write.csv(id_rep1_2010, 
	"/home/dan/Data/election/US national elections/id_rep1_2010.csv",
	 row.names = FALSE)



# 2008
url <- "https://www.realclearpolitics.com/epolls/2008/president/id/idaho_mccain_vs_obama-600.html"
path <- "#polling-data-full td"

id_ge_2008 <- clean_rcp(url, path, 6)
names(id_ge_2008) <- c("Poll", "Date", "Sample", "R", "D","Spread")

write.csv(id_ge_2008, 
	"/home/dan/Data/election/US national elections/id_ge_2008.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/id/idaho_senate-931.html"
path <- "#polling-data-full td"

id_sen_2008 <- clean_rcp(url, path, 6)
names(id_sen_2008) <- c("Poll", "Date", "Sample", "D", "R","Spread")

write.csv(id_sen_2008, 
	"/home/dan/Data/election/US national elections/id_sen_2008.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/id/idaho_1st_district-1019.html"
path <- "#polling-data-full td"

id_rep1_2008 <- clean_rcp(url, path, 6)
names(id_rep1_2008) <- c("Poll", "Date", "Sample", "D", "R","Spread")

write.csv(id_rep1_2008, 
	"/home/dan/Data/election/US national elections/id_rep1_2008.csv",
	 row.names = FALSE)


# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/id_polls.html"
path <- "p+ table tr~ tr+ tr td"

id_ge_2004 <- clean_rcp(url, path, 7)
names(id_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
id_ge_2004[1,] <- ""

write.csv(id_ge_2004, 
	"/home/dan/Data/election/US national elections/id_ge_2004.csv",
	 row.names = FALSE)
