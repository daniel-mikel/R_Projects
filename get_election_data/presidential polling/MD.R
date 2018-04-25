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
url <- "https://www.realclearpolitics.com/epolls/2016/president/md/maryland_trump_vs_clinton_vs_johnson_vs_stein-6119.html"
path <- "#polling-data-full td"

md_ge_2016 <- clean_rcp(url, path, 9)
names(md_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "L", "G", "Spread")

write.csv(md_ge_2016, 
	"/home/dan/Data/election/US national elections/md_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/md/maryland_senate_szeliga_vs_van_hollen-5987.html"
path <- "#polling-data-full td"

md_sen_2016 <- clean_rcp(url, path, 7)
names(md_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(md_sen_2016, 
	"/home/dan/Data/election/US national elections/md_sen_2016.csv",
	 row.names = FALSE)




# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/md/maryland_governor_hogan_vs_brown-5098.html"
path <- "#polling-data-full td"

md_gov_2014 <- clean_rcp(url, path, 7)
names(md_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(md_gov_2014, 
	"/home/dan/Data/election/US national elections/md_gov_2014.csv",
	 row.names = FALSE)




# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/md/maryland_romney_vs_obama-3218.html"
path <- "#polling-data-full td"

md_ge_2012 <- clean_rcp(url, path, 7)
names(md_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(md_ge_2012, 
	"/home/dan/Data/election/US national elections/md_ge_2012.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2012/senate/md/maryland_senate_bongino_vs_cardin-3236.html"
path <- "#polling-data-full td"

md_sen_2012 <- clean_rcp(url, path, 7)
names(md_sen_2012) <- c("Poll", "Date", "Sample", "R", "D", "I", "Spread")

write.csv(md_sen_2012, 
	"/home/dan/Data/election/US national elections/md_sen_2012.csv",
	 row.names = FALSE)

# 6th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/md/maryland_6th_district_bartlett_vs_delaney-3313.html"
path <- "#polling-data-full td"

md_rep6_2012 <- clean_rcp(url, path, 6)
names(md_rep6_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(md_rep6_2012, 
	"/home/dan/Data/election/US national elections/md_rep6_2012.csv",
	 row.names = FALSE)



# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/md/maryland_governor_ehrlich_vs_omalley-1121.html"
path <- "#polling-data-full td"

md_gov_2010 <- clean_rcp(url, path, 6)
names(md_gov_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(md_gov_2010, 
	"/home/dan/Data/election/US national elections/md_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/md/maryland_senate_wargotz_vs_mikulski-1665.html"
path <- "#polling-data-full td"

md_sen_2010 <- clean_rcp(url, path, 6)
names(md_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(md_sen_2010, 
	"/home/dan/Data/election/US national elections/md_sen_2010.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/md/maryland_1st_district_harris_vs_kratovil-1256.html"
path <- "#polling-data-full td"

md_rep1_2010 <- clean_rcp(url, path, 6)
names(md_rep1_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(md_rep1_2010, 
	"/home/dan/Data/election/US national elections/md_rep1_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/md/maryland_mccain_vs_obama-610.html"
path <- "#polling-data-full td"

md_ge_2008 <- clean_rcp(url, path, 6)
names(md_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(md_ge_2008, 
	"/home/dan/Data/election/US national elections/md_ge_2008.csv",
	 row.names = FALSE)



# 2004

# ge
# ge
url <- "https://www.realclearpolitics.com/Presidential_04/md_polls.html"
path <- "p+ table tr~ tr+ tr td"

md_ge_2004 <- clean_rcp(url, path, 7)
names(md_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
md_ge_2004[1,] <- ""

write.csv(md_ge_2004, 
	"/home/dan/Data/election/US national elections/md_ge_2004.csv",
	 row.names = FALSE)