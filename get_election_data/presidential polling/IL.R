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
url <- "https://www.realclearpolitics.com/epolls/2016/president/il/illinois_trump_vs_clinton_vs_johnson_vs_stein-6140.html"
path <- "#polling-data-full td"

il_ge_2016 <- clean_rcp(url, path, 9)
names(il_ge_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "L", "G", "Spread")

write.csv(il_ge_2016, 
	"/home/dan/Data/election/US national elections/il_ge_2016.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2016/senate/il/illinois_senate_kirk_vs_duckworth-5432.html"
path <- "#polling-data-full td"

il_sen_2016 <- clean_rcp(url, path, 7)
names(il_sen_2016) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(il_sen_2016, 
	"/home/dan/Data/election/US national elections/il_sen_2016.csv",
	 row.names = FALSE)



# 2014

# gov
url <- "https://www.realclearpolitics.com/epolls/2014/governor/il/illinois_governor_rauner_vs_quinn-4224.html"
path <- "#polling-data-full td"

il_gov_2014 <- clean_rcp(url, path, 7)
names(il_gov_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(il_gov_2014, 
	"/home/dan/Data/election/US national elections/il_gov_2014.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2014/senate/il/illinois_senate_oberweis_vs_durbin-4228.html"
path <- "#polling-data-full td"

il_sen_2014 <- clean_rcp(url, path, 7)
names(il_sen_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(il_sen_2014, 
	"/home/dan/Data/election/US national elections/il_sen_2014.csv",
	 row.names = FALSE)



# 10th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/il/illinois_10th_district_dold_vs_schneider-4888.html"
path <- "#polling-data-full td"

il_rep10_2014 <- clean_rcp(url, path, 7)
names(il_rep10_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(il_rep10_2014, 
	"/home/dan/Data/election/US national elections/il_rep10_2014.csv",
	 row.names = FALSE)

# 11th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/il/illinois_11th_district_senger_vs_foster-5012.html"
path <- "#polling-data-full td"

il_rep11_2014 <- clean_rcp(url, path, 7)
names(il_rep11_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(il_rep11_2014, 
	"/home/dan/Data/election/US national elections/il_rep11_2014.csv",
	 row.names = FALSE)

# 12th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/il/illinois_12th_district_bost_vs_enyart-5014.html"
path <- "#polling-data-full td"

il_rep12_2014 <- clean_rcp(url, path, 7)
names(il_rep12_2014) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")

write.csv(il_rep12_2014, 
	"/home/dan/Data/election/US national elections/il_rep12_2014.csv",
	 row.names = FALSE)

# 13th congressional district
url <- "https://www.realclearpolitics.com/epolls/2014/house/il/illinois_13th_district_davis_vs_callis-5015.html"
path <- "#polling-data-full td"

il_rep13_2014 <- clean_rcp(url, path, 7)
names(il_rep13_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(il_rep13_2014, 
	"/home/dan/Data/election/US national elections/il_rep13_2014.csv",
	 row.names = FALSE)

# 17th 
url <- "https://www.realclearpolitics.com/epolls/2014/house/il/illinois_17th_district_schilling_vs_bustos-4892.html"
path <- "#polling-data-full td"

il_rep17_2014 <- clean_rcp(url, path, 7)
names(il_rep17_2014) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(il_rep17_2014, 
	"/home/dan/Data/election/US national elections/il_rep17_2014.csv",
	 row.names = FALSE)



# 2012

# ge
url <- "https://www.realclearpolitics.com/epolls/2012/president/il/illinois_romney_vs_obama-2955.html"
path <- "#polling-data-full td"

il_ge_2012 <- clean_rcp(url, path, 7)
names(il_ge_2012) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

write.csv(il_ge_2012, 
	"/home/dan/Data/election/US national elections/il_ge_2012.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/il/illinois_8th_district_walsh_vs_duckworth-3303.html"
path <- "#polling-data-full td"

il_rep8_2012 <- clean_rcp(url, path, 6)
names(il_rep8_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(il_rep8_2012, 
	"/home/dan/Data/election/US national elections/il_rep8_2012.csv",
	 row.names = FALSE)

# 10th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/il/illinois_10th_district_dold_vs_schneider-3304.html"
path <- "#polling-data-full td"

il_rep10_2012 <- clean_rcp(url, path, 6)
names(il_rep10_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(il_rep10_2012, 
	"/home/dan/Data/election/US national elections/il_rep10_2012.csv",
	 row.names = FALSE)

# 11th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/il/illinois_11th_district_biggert_vs_foster-3305.html"
path <- "#polling-data-full td"

il_rep11_2012 <- clean_rcp(url, path, 6)
names(il_rep11_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(il_rep11_2012, 
	"/home/dan/Data/election/US national elections/il_rep11_2012.csv",
	 row.names = FALSE)

# 12th congressional district
url <- "https://www.realclearpolitics.com/epolls/2012/house/il/illinois_12th_district_plummer_vs_enyart-3306.html"
path <- "#polling-data-full td"

il_rep12_2012 <- clean_rcp(url, path, 6)
names(il_rep12_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(il_rep12_2012, 
	"/home/dan/Data/election/US national elections/il_rep12_2012.csv",
	 row.names = FALSE)

# 13th
url <- "https://www.realclearpolitics.com/epolls/2012/house/il/illinois_13th_district_davis_vs_gill-3307.html"
path <- "#polling-data-full td"

il_rep13_2012 <- clean_rcp(url, path, 6)
names(il_rep13_2012) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(il_rep13_2012, 
	"/home/dan/Data/election/US national elections/il_rep13_2012.csv",
	 row.names = FALSE)

# 17th
url <- "https://www.realclearpolitics.com/epolls/2012/house/il/illinois_17th_district_schilling_vs_bustos-3308.html"
path <- "#polling-data-full td"

il_rep17_2012 <- clean_rcp(url, path, 6)
names(il_rep17_2012) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(il_rep17_2012, 
	"/home/dan/Data/election/US national elections/il_rep17_2012.csv",
	 row.names = FALSE)



# 2010

# gov
url <- "https://www.realclearpolitics.com/epolls/2010/governor/il/illinois_governor_brady_vs_quinn-1361.html"
path <- "#polling-data-full td"

il_gov_2010 <- clean_rcp(url, path, 6)
names(il_gov_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(il_gov_2010, 
	"/home/dan/Data/election/US national elections/il_gov_2010.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2010/senate/il/illinois_senate_giannoulias_vs_kirk-1092.html"
path <- "#polling-data-full td"

il_sen_2010 <- clean_rcp(url, path, 6)
names(il_sen_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(il_sen_2010, 
	"/home/dan/Data/election/US national elections/il_sen_2010.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/il/illinois_8th_district_walsh_vs_bean-1354.html"
path <- "#polling-data-full td"

il_rep8_2010 <- clean_rcp(url, path, 6)
names(il_rep8_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(il_rep8_2010, 
	"/home/dan/Data/election/US national elections/il_rep8_2010.csv",
	 row.names = FALSE)

# 10th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/il/illinois_10th_district_dold_vs_seals-1284.html"
path <- "#polling-data-full td"

il_rep10_2010 <- clean_rcp(url, path, 6)
names(il_rep10_2010) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(il_rep10_2010, 
	"/home/dan/Data/election/US national elections/il_rep10_2010.csv",
	 row.names = FALSE)

# 11th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/il/illinois_11th_district_kinzinger_vs_halvorson-1347.html"
path <- "#polling-data-full td"

il_rep11_2010 <- clean_rcp(url, path, 6)
names(il_rep11_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(il_rep11_2010, 
	"/home/dan/Data/election/US national elections/il_rep11_2010.csv",
	 row.names = FALSE)

# 14th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/il/illinois_14th_district_hultgren_vs_foster-1282.html"
path <- "#polling-data-full td"

il_rep14_2010 <- clean_rcp(url, path, 6)
names(il_rep14_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(il_rep14_2010, 
	"/home/dan/Data/election/US national elections/il_rep14_2010.csv",
	 row.names = FALSE)

# 17th congressional district
url <- "https://www.realclearpolitics.com/epolls/2010/house/il/illinois_17th_district_schilling_vs_hare-1458.html"
path <- "#polling-data-full td"

il_rep17_2010 <- clean_rcp(url, path, 6)
names(il_rep17_2010) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(il_rep17_2010, 
	"/home/dan/Data/election/US national elections/il_rep17_2010.csv",
	 row.names = FALSE)



# 2008

# ge
url <- "https://www.realclearpolitics.com/epolls/2008/president/il/illinois_mccain_vs_obama-602.html"
path <- "#polling-data-full td"

il_ge_2008 <- clean_rcp(url, path, 6)
names(il_ge_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(il_ge_2008, 
	"/home/dan/Data/election/US national elections/il_ge_2008.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/epolls/2008/senate/il/illinois_senate-915.html"
path <- "#polling-data-full td"

il_sen_2008 <- clean_rcp(url, path, 6)
names(il_sen_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(il_sen_2008, 
	"/home/dan/Data/election/US national elections/il_sen_2008.csv",
	 row.names = FALSE)

# 10th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/il/illinois_10th_district-962.html"
path <- "#polling-data-full td"

il_rep10_2008 <- clean_rcp(url, path, 6)
names(il_rep10_2008) <- c("Poll", "Date", "Sample", "R", "D", "Spread")

write.csv(il_rep10_2008, 
	"/home/dan/Data/election/US national elections/il_rep10_2008.csv",
	 row.names = FALSE)

# 11th congressional district
url <- "https://www.realclearpolitics.com/epolls/2008/house/il/illinois_11th_district-973.html"
path <- "#polling-data-full td"

il_rep11_2008 <- clean_rcp(url, path, 6)
names(il_rep11_2008) <- c("Poll", "Date", "Sample", "D", "R", "Spread")

write.csv(il_rep11_2008, 
	"/home/dan/Data/election/US national elections/il_rep11_2008.csv",
	 row.names = FALSE)


 

# 2006

# gov

# RCP has the Final Results and RCP Average columns switched in those respective rows, the rest of the data is fine I think

url <- "https://www.realclearpolitics.com/epolls/2006/governor/il/illinois_governor_race-8.html"
path <- "#polling-data-full td"

il_gov_2006 <- clean_rcp(url, path, 8)
names(il_gov_2006) <- c("Poll", "Date", "Sample", "R", "D", "I", "Undecided", "Spread")

write.csv(il_gov_2006, 
	"/home/dan/Data/election/US national elections/il_gov_2006.csv",
	 row.names = FALSE)


# 6th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/illinois_6-28.html"
path <- "#polling-data-full td"

il_rep6_2006 <- clean_rcp(url, path, 7)
names(il_rep6_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(il_rep6_2006, 
	"/home/dan/Data/election/US national elections/il_rep6_2006.csv",
	 row.names = FALSE)

# 8th congressional district
url <- "https://www.realclearpolitics.com/epolls/writeup/illinois_8-27.html"
path <- "#polling-data-full td"

il_rep8_2006 <- clean_rcp(url, path, 7)
names(il_rep8_2006) <- c("Poll", "Date", "Sample", "R", "D", "Undecided", "Spread")

write.csv(il_rep8_2006, 
	"/home/dan/Data/election/US national elections/il_rep8_2006.csv",
	 row.names = FALSE)




# 2004

# ge
url <- "https://www.realclearpolitics.com/Presidential_04/il_polls.html"
path <- "p+ table tr~ tr+ tr td"

il_ge_2004 <- clean_rcp(url, path, 7)
names(il_ge_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")
il_ge_2004[1,] <- ""

write.csv(il_ge_2004, 
	"/home/dan/Data/election/US national elections/il_ge_2004.csv",
	 row.names = FALSE)

# sen
url <- "https://www.realclearpolitics.com/Presidential_04/il_polls.html"
path <- "br+ table tr~ tr+ tr div"

il_sen_2004 <- clean_rcp(url, path, 7)
names(il_sen_2004) <- c("Poll | Date", "Sample", "MoE", "R", "D", "I", "Spread")

write.csv(il_sen_2004, 
	"/home/dan/Data/election/US national elections/il_sen_2004.csv",
	 row.names = FALSE)