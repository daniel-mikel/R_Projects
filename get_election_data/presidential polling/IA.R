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
url <- "https://www.realclearpolitics.com/epolls/2016/president/ia/iowa_trump_vs_clinton_vs_johnson_vs_stein-5981.html"
path <- "#polling-data-full td"

ia_ge_2016 <- clean_rcp(url, path, 9)
names(ia_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

write.csv(ia_ge_2016, 
	"/home/dan/Data/election/US national elections/ia_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/ia/iowa_senate_grassley_vs_judge-5978.html"
path <- "#polling-data-full td"

ia_sen_2016 <- clean_rcp(url, path, 7)
names(ia_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ia_sen_2016, 
	"/home/dan/Data/election/US national elections/ia_sen_2016.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2016/house/ia/iowa_1st_district_blum_vs_vernon-6038.html"
path <- "#polling-data-full td"

ia_rep1_2016 <- clean_rcp(url, path, 7)
names(ia_rep1_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ia_rep1_2016, 
	"/home/dan/Data/election/US national elections/ia_rep1_2016.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2016/house/ia/iowa_3rd_district_young_vs_mowrer-6066.html"
path <- "#polling-data-full td"

ia_rep3_2016 <- clean_rcp(url, path, 7)
names(ia_rep3_2016) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ia_rep3_2016, 
	"/home/dan/Data/election/US national elections/ia_rep3_2016.csv",
	 row.names = FALSE)



# 2014

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/ia/iowa_senate_ernst_vs_braley-3990.html"
path <- "#polling-data-full td"

ia_sen_2014 <- clean_rcp(url, path, 7)
names(ia_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ia_sen_2014, 
	"/home/dan/Data/election/US national elections/ia_sen_2014.csv",
	 row.names = FALSE)
.
# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/ia/iowa_governor_branstad_vs_hatch-3647.html"
path <- "#polling-data-full td"

ia_gov_2014 <- clean_rcp(url, path, 7)
names(ia_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ia_gov_2014, 
	"/home/dan/Data/election/US national elections/ia_gov_2014.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/ia/iowa_1st_district_blum_vs_murphy-5073.html"
path <- "#polling-data-full td"

ia_rep1_2014 <- clean_rcp(url, path, 7)
names(ia_rep1_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ia_rep1_2014, 
	"/home/dan/Data/election/US national elections/ia_rep1_2014.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/ia/iowa_2nd_district_millermeeks_vs_loebsack-5076.html"
path <- "#polling-data-full td"

ia_rep2_2014 <- clean_rcp(url, path, 7)
names(ia_rep2_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ia_rep2_2014, 
	"/home/dan/Data/election/US national elections/ia_rep2_2014.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/ia/iowa_3rd_district_young_vs_appel-5125.html"
path <- "#polling-data-full td"

ia_rep3_2014 <- clean_rcp(url, path, 7)
names(ia_rep3_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ia_rep3_2014, 
	"/home/dan/Data/election/US national elections/ia_rep3_2014.csv",
	 row.names = FALSE)

# 4th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/ia/iowa_4th_district_king_vs_mowrer-5223.html"
path <- "#polling-data-full td"

ia_rep4_2014 <- clean_rcp(url, path, 6)
names(ia_rep4_2014) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ia_rep4_2014, 
	"/home/dan/Data/election/US national elections/ia_rep4_2014.csv",
	 row.names = FALSE)




# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/ia/iowa_romney_vs_obama-1922.html"
path <- "#polling-data-full td"

ia_ge_2012 <- clean_rcp(url, path, 7)
names(ia_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(ia_ge_2012, 
	"/home/dan/Data/election/US national elections/ia_ge_2012.csv",
	 row.names = FALSE)



# 2010
url <- "https://www.realclearpolitics.com/epolls/2010/governor/ia/iowa_governor_branstad_vs_culver-1200.html"
path <- "#polling-data-full td"

ia_gov_2010 <- clean_rcp(url, path, 6)
names(ia_gov_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(ia_gov_2010, 
	"/home/dan/Data/election/US national elections/ia_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/ia/iowa_senate_grassley_vs_conlin-1217.html"
path <- "#polling-data-full td"

ia_sen_2010 <- clean_rcp(url, path, 6)
names(ia_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ia_sen_2010, 
	"/home/dan/Data/election/US national elections/ia_sen_2010.csv",
	 row.names = FALSE)

# 1st congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ia/iowa_1st_district_lange_vs_braley-1373.html"
path <- "#polling-data-full td"

ia_rep1_2010 <- clean_rcp(url, path, 6)
names(ia_rep1_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ia_rep1_2010, 
	"/home/dan/Data/election/US national elections/ia_rep1_2010.csv",
	 row.names = FALSE)

# 2nd congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/ia/iowa_2nd_district_millermeeks_vs_loebsack-1680.html"
path <- "#polling-data-full td"

ia_rep2_2010 <- clean_rcp(url, path, 6)
names(ia_rep2_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(ia_rep2_2010, 
	"/home/dan/Data/election/US national elections/ia_rep2_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/ia/iowa_mccain_vs_obama-209.html"
path <- "#polling-data-full td"

ia_ge_2008 <- clean_rcp(url, path, 7)
names(ia_ge_2008) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(ia_ge_2008, 
	"/home/dan/Data/election/US national elections/ia_ge_2008.csv",
	 row.names = FALSE)



# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/ia_polls.html"
path <- "p+ table tr~ tr+ tr td"

ia_ge_2004 <- clean_rcp(url, path, 7)
names(ia_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
ia_ge_2004[1,] <- ""

write.csv(ia_ge_2004, 
	"/home/dan/Data/election/US national elections/ia_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/ia_polls.html"
path <- "table:nth-child(6) div"

ia_sen_2004 <- clean_rcp(url, path, 7)
names(ia_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ia_sen_2004[1,] <- ""

write.csv(ia_sen_2004, 
	"/home/dan/Data/election/US national elections/ia_sen_2004.csv",
	 row.names = FALSE)

# 3rd congressional district
url <- "https://www.realclearpolitics.com/Presidential_04/ia_polls.html"
path <- "table:nth-child(10) div"

ia_rep3_2004 <- clean_rcp(url, path, 7)
names(ia_rep3_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "Undecided", "Spread")
ia_rep3_2004[1,] <- ""

write.csv(ia_rep3_2004, 
	"/home/dan/Data/election/US national elections/ia_rep3_2004.csv",
	 row.names = FALSE)