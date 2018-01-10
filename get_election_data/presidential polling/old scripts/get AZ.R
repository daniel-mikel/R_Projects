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

test <- clean_rcp("https://www.realclearpolitics.com/epolls/2016/president/az/arizona_trump_vs_clinton_vs_johnson_vs_stein-6087.html#polls", "#polling-data-full td", 9)



# 2016

# GE

AZ_gen_2016_url <- "https://www.realclearpolitics.com/epolls/2016/president/az/arizona_trump_vs_clinton_vs_johnson_vs_stein-6087.html#polls"

# scrape data and save as character vector              
AZ_gen_2016_webpage <- read_html(AZ_gen_2016_url)
AZ_gen_2016_html <- html_nodes(AZ_gen_2016_webpage, '#polling-data-full td')
AZ_gen_2016_data <- html_text(AZ_gen_2016_html, trim = TRUE)

AZ_gen_2016_data_mat <- matrix(AZ_gen_2016_data, ncol = 9, byrow = TRUE)
AZ_gen_2016_data_df <- as.data.frame(AZ_gen_2016_data_mat, stringsAsFactors = FALSE)
names(AZ_gen_2016_data_df) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "L", "G", "Spread")

AZ_gen_2016_data_df 

# Senate





# 2012

AZ_gen_2012_url <- "https://www.realclearpolitics.com/epolls/2012/president/az/arizona_romney_vs_obama-1757.html"

# scrape data and save as character vector              
AZ_gen_2012_webpage <- read_html(AZ_gen_2012_url)
AZ_gen_2012_html <- html_nodes(AZ_gen_2012_webpage, '#polling-data-full td')
AZ_gen_2012_data <- html_text(AZ_gen_2012_html, trim = TRUE)

AZ_gen_2012_data_mat <- matrix(AZ_gen_2012_data, ncol = 7, byrow = TRUE)
AZ_gen_2012_data_df <- as.data.frame(AZ_gen_2012_data_mat, stringsAsFactors = FALSE)
names(AZ_gen_2012_data_df) <- c("Poll", "Date", "Sample", "MoE", "D", "R", "Spread")

AZ_gen_2012_data_df 



# 2008

AZ_gen_2008_url <- "https://www.realclearpolitics.com/epolls/2008/president/az/arizona_mccain_vs_obama-570.html"

# scrape data and save as character vector              
AZ_gen_2008_webpage <- read_html(AZ_gen_2008_url)
AZ_gen_2008_html <- html_nodes(AZ_gen_2008_webpage, '#polling-data-full td')
AZ_gen_2008_data <- html_text(AZ_gen_2008_html, trim = TRUE)

AZ_gen_2008_data_mat <- matrix(AZ_gen_2008_data, ncol = 7, byrow = TRUE)
AZ_gen_2008_data_df <- as.data.frame(AZ_gen_2008_data_mat, stringsAsFactors = FALSE)
names(AZ_gen_2008_data_df) <- c("Poll", "Date", "Sample", "MoE", "R", "D", "Spread")



# 2004 
  # you have to follow a different set of links to the 2004 polls

# this will require a different type of cleaning
  # especially since the date and poll data are in the same column

AZ_gen_2004_url <- "https://www.realclearpolitics.com/Presidential_04/az_polls.html"

# scrape data and save as character vector              
AZ_gen_2004_webpage <- read_html(AZ_gen_2004_url)
AZ_gen_2004_html <- html_nodes(AZ_gen_2004_webpage, 'p+ table div')
AZ_gen_2004_data <- html_text(AZ_gen_2004_html, trim = TRUE)

AZ_gen_2004_mat <- matrix(AZ_gen_2004_data, ncol = 7, byrow = TRUE)
AZ_gen_2004_data_df <- as.data.frame(AZ_gen_2004_data_mat, stringsAsFactors = FALSE)
names(AZ_gen_2004_data_df) <- c("Poll", "Sample", "MoE", "R", "D", "I", "Spread")
AZ_gen_2004_data_df$Poll <- gsub(" ", "", AZ_gen_2004_data_df$Poll) # delete whitespance in 1st column
AZ_gen_2004_data_df <- AZ_gen_2004_data_df[-1,]

# 1st congressional district
AZ_gen_2004_webpage <- read_html(AZ_gen_2004_url)
AZ_1CD_2004_html <- html_nodes(AZ_gen_2004_webpage, 'br+ table div')
AZ_1CD_2004_data <- html_text(AZ_1CD_2004_html, trim = TRUE)

AZ_1CD_2004_mat <- matrix(AZ_1CD_2004_data, ncol = 7, byrow = TRUE)
AZ_1CD_2004_df <- as.data.frame(AZ_1CD_2004_mat, stringsAsFactors = FALSE)
AZ_1CD_2004_df$V1 <- gsub(" ", "", AZ_1CD_2004_df$V1) # delete whitespance in 1st column
names(AZ_1CD_2004_df) <- AZ_1CD_2004_df[1,]
AZ_1CD_2004_df <- AZ_1CD_2004_df[-1,]
