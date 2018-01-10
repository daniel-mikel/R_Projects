
# scrape presidential approval ratings from 
# http://www.presidency.ucsb.edu/data/popularity.php

# further potential election data
# https://www.loc.gov/rr/program/bib/elections/statistics.html

library("rvest")
library("tidyverse")
library("zoo")

# test first with Obama approval
# http://www.presidency.ucsb.edu/data/popularity.php?pres=44&sort=time&direct=DESC&Submit=DISPLAY

url <- 'http://www.presidency.ucsb.edu/data/popularity.php?pres=44&sort=time&direct=DESC&Submit=DISPLAY'

# Reading the HTML code from the website
webpage <- read_html(url)

approval_html <- html_nodes(webpage, '.listdate')
approval_data <- html_text(approval_html, trim = TRUE)

# clean up
approval_data[approval_data==""] <- NA
approval_data[1:2] <- NA
approval_data <- na.omit(approval_data)

obama_matrix <- matrix(approval_data, ncol = 5, byrow = TRUE)
obama_df <- as.data.frame(obama_matrix, stringsAsFactors = FALSE)
names(obama_df) <- c("start_date", "end_date", "approve", "disapprove", "unsure")

obama_df[] <- lapply(obama_df, type.convert)


obama_df$start_date <- as.Date(obama_df$start_date, 
                               format = "%m/%d/%Y")
obama_df$end_date <- as.Date(obama_df$end_date, 
                             format = "%m/%d/%Y")

str(obama_df)

ggplot(obama_df, aes(x = end_date, y = approve)) +
  geom_point() + 
  geom_line()

tidy_obama <- obama_df %>%
  gather(opinion, percent, -c(start_date, end_date))

ggplot(tidy_obama, aes(x = end_date, y = percent, group = opinion, col = opinion)) +
  geom_jitter(alpha = 0.5, shape = 1) +
  geom_line(aes(y=rollmean(percent, 15, na.pad=TRUE)), size = 1.3, alpha = 0.8) +
  theme_minimal()
