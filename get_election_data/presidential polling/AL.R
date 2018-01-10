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


# 2017

# sen
url <- "https://www.realclearpolitics.com/epolls/2017/senate/al/alabama_senate_special_election_moore_vs_jones-6271.html"
path <- "#polling-data-full td"

al_sen_2017 <- clean_rcp(url, path, 7)
names(al_sen_2017) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(al_sen_2017, 
	"/home/dan/Data/election/US national elections/al_sen_2017.csv",
	 row.names = FALSE)


# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/al/alabama_governor_bentley_vs_griffith-5077.html"
path <- "#polling-data-full td"

al_gov_2014 <- clean_rcp(url, path, 7)
names(al_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(al_gov_2014, 
	"/home/dan/Data/election/US national elections/al_gov_2014.csv",
	 row.names = FALSE)



# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/al/alabama_governor_bentley_vs_sparks-1586.html"
path <- "#polling-data-full td"

al_gov_2010 <- clean_rcp(url, path, 6)
names(al_gov_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(al_gov_2010, 
	"/home/dan/Data/election/US national elections/al_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/al/alabama_senate_shelby_vs_barnes-1430.html"
path <- "#polling-data-full td"

al_sen_2010 <- clean_rcp(url, path, 6)
names(al_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(al_sen_2010, 
	"/home/dan/Data/election/US national elections/al_sen_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/al/alabama_mccain_vs_obama-557.html"
path <- "#polling-data-full td"

al_ge_2008 <- clean_rcp(url, path, 5)
names(al_ge_2008) <- c("Poll", "Date", "R", "D", "Spread")

write.csv(al_ge_2008, 
	"/home/dan/Data/election/US national elections/al_ge_2008.csv",
	 row.names = FALSE)


# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/al_polls.html"
path <- "p+ table div"

al_ge_2004 <- clean_rcp(url, path, 7)
names(al_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")

write.csv(al_ge_2004, 
	"/home/dan/Data/election/US national elections/al_ge_2004.csv",
	 row.names = FALSE)