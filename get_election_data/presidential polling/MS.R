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
url <- "https://www.realclearpolitics.com/epolls/2016/president/ms/mississippi_trump_vs_clinton_vs_johnson_vs_stein-6106.html"
path <- "#polling-data-full td"

ms_ge_2016 <- clean_rcp(url, path, 9)
names(ms_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

write.csv(ms_ge_2016, 
	"/home/dan/Data/election/US national elections/ms_ge_2016.csv",
	 row.names = FALSE)




#2014

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/ms/mississippi_senate_cochran_vs_childers-4179.html"
path <- "#polling-data-full td"

ms_sen_2014 <- clean_rcp(url, path, 7)
names(ms_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ms_sen_2014, 
	"/home/dan/Data/election/US national elections/ms_sen_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/ms/mississippi_romney_vs_obama-2122.html"
path <- "#polling-data-full td"

ms_ge_2012 <- clean_rcp(url, path, 7)
names(ms_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ms_ge_2012, 
	"/home/dan/Data/election/US national elections/ms_ge_2012.csv",
	 row.names = FALSE)



# 2011

# gov
url <- "https://www.realclearpolitics.com/epolls/2011/governor/ms/mississippi_governor_bryant_vs_dupree-2978.html"
path <- "#polling-data-full td"

ms_gov_2011 <- clean_rcp(url, path, 6)
names(ms_gov_2011) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ms_gov_2011, 
	"/home/dan/Data/election/US national elections/ms_gov_2011.csv",
	 row.names = FALSE)



# 2010

# 1st congressional districts
url <- "https://www.realclearpolitics.com/epolls/2010/house/ms/mississippi_1st_district_nunnelee_vs_childers-1270.html"
path <- "#polling-data-full td"

ms_rep1_2010 <- clean_rcp(url, path, 6)
names(ms_rep1_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ms_rep1_2010, 
	"/home/dan/Data/election/US national elections/ms_rep1_2010.csv",
	 row.names = FALSE)




# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ms/mississippi_mccain_vs_obama-612.html"
path <- "#polling-data-full td"

ms_ge_2008 <- clean_rcp(url, path, 7)
names(ms_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ms_ge_2008, 
	"/home/dan/Data/election/US national elections/ms_ge_2008.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/ms/mississippi_senate_special-911.html"
path <- "#polling-data-full td"

ms_sen_2008 <- clean_rcp(url, path, 6)
names(ms_sen_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ms_sen_2008, 
	"/home/dan/Data/election/US national elections/ms_sen_2008.csv",
	 row.names = FALSE)



# 2004

# ge
# 2004 

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/ms_polls.html"
path <- "p+ table tr~ tr+ tr td"

ms_ge_2004 <- clean_rcp(url, path, 7)
names(ms_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
ms_ge_2004[1,] <- ""

write.csv(ms_ge_2004, 
	"/home/dan/Data/election/US national elections/ms_ge_2004.csv",
	 row.names = FALSE)