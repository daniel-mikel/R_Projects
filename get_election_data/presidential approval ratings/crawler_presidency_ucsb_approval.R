library("rvest")
library("tidyverse")
library("zoo")
library("plotly")

all_pres <- as.data.frame(NULL)
# for each presidency, FDR (n = 32) to Trump (n = 45)

for (i in 1:(45-31)){
  i <- i +31
  print(i)
  
  # get url
  url <- paste0("http://www.presidency.ucsb.edu/data/popularity.php?pres=", i, "&sort=time&direct=DESC&Submit=DISPLAY")
  print(url)
  
  # scrape data and save as character vector              
  webpage <- read_html(url)
  approval_html <- html_nodes(webpage, '.listdate')
  approval_data <- html_text(approval_html, trim = TRUE)
  
  # clean character vector of empty data
  approval_data[approval_data==""] <- NA
  approval_data[1:2] <- NA
  approval_data <- na.omit(approval_data)
  
  # convert to data.fame
  pres_matrix <- matrix(approval_data, ncol = 5, byrow = TRUE)
  pres_df <- as.data.frame(pres_matrix, stringsAsFactors = FALSE)
  names(pres_df) <- c("start_date", "end_date", "approve", "disapprove", "unsure")
  
  # clean up object classes
  pres_df[] <- lapply(pres_df, type.convert)
  pres_df$start_date <- as.Date(pres_df$start_date, 
                                 format = "%m/%d/%Y")
  pres_df$end_date <- as.Date(pres_df$end_date, 
                               format = "%m/%d/%Y")
  
  # keep information on which president data represents
  pres_df$number <- i
  
  # get data into single dataframe and save as global variable
  all_pres <- rbind(all_pres, pres_df)
}

tidy_pres <- all_pres %>%
  gather(opinion, percent, -c(number, start_date, end_date)) 

my_plot <- tidy_pres %>%
  filter(number == "34") %>%
  ggplot(aes(x = end_date, y = percent, col = opinion)) +
  geom_jitter(alpha = 0.5, shape = 1) +
  geom_smooth(method = "gam",  formula = y ~ s(x, bs = "cs"), se = F) +
  theme_minimal() 

ggplotly(my_plot)

write_csv(tidy_pres, "/home/dan/R/projects/get_election_data/presidential approval ratings/pres_approve_ucsb_prod/pres_approve_ucsb/tidy_pres.csv")
write_csv(tidy_pres, "/home/dan/R/projects/get_election_data/presidential approval ratings/tidy_pres.csv")

check <- read.csv("/home/dan/R/projects/get_election_data/presidential approval ratings/pres_approve_ucsb_prod/pres_approve_ucsb/tidy_pres.csv", 
                  stringsAsFactors =  FALSE)
head(check)
str(check)
str(tidy_pres)
identical(tidy_pres, check)

check$start_date <- as.Date(check$start_date, 
                                format = "%Y-%m-%d")
check$end_date <- as.Date(check$end_date, 
                              format = "%Y-%m-%d")
check$number <- as.numeric(check$number)

my_plot <- check %>%
  filter(number == "44") %>%
  ggplot(aes(x = end_date, y = percent, col = opinion)) +
  geom_jitter(alpha = 0.5, shape = 1) +
  geom_smooth(method = "gam",  formula = y ~ s(x, bs = "cs"), se = F) +
  theme_minimal() 

ggplotly(my_plot)
