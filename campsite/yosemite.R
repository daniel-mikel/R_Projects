# scrape for campsite availability


# libraries ---------------------------------------------------------
library("rvest")
library("tidyverse")


# website -----------------------------------------------------------
not_url <- "https://www.recreation.gov/campsiteCalendar.do?page=calendar&contractCode=NRSO&parkId=70925&calarvdate=04/26/2018&sitepage=true&startIdx="
numbers <- "0"
url <- paste0(not_url, numbers)

# number of sites ---------------------------------------------------

path.total <- "thead span~ span+ span"
html_cal <- html_nodes(webpage, path.total)
total <- html_text(html_cal, trim = TRUE)

# availability ------------------------------------------------------
path <- "td.status"
column <- 14

webpage <- read_html(url)
html <- html_nodes(webpage, path)
data <- html_text(html, trim = TRUE)
matrix <- matrix(data, ncol = column, byrow = TRUE)
df <- as.data.frame(matrix, stringsAsFactors = FALSE)



# dates -------------------------------------------------------------
path.cal <- ".calendar"

html_cal <- html_nodes(webpage, path.cal)
data_cal <- html_text(html_cal, trim = TRUE)
matrix_cal <- matrix(data_cal, ncol = column, byrow = TRUE)
pre_dates_vector <- as.vector(matrix_cal)

split_list <- strsplit(pre_dates_vector, "\n")
sec <- sapply(split_list,function(x) x[2])
fir <- sapply(split_list, function(x) x[1])
dates_vector <- paste0(sec, "_", fir)

names(df) <- dates_vector



# site names --------------------------------------------------------
camp_id <- (as.numeric(numbers)+1):(as.numeric(numbers)+25)
df <- cbind(camp_id, df)


# filters -----------------------------------------------------------

thur <- df %>%
	filter(Th_26 == "A")

fri <- df %>%
	filter(F_27 == "A")

sat <- df %>%
	filter(Sa_28 == "A")

sun <- df %>%
	filter(Su_29 == "A")

print(thur)
print(fri)
print(sat)
print(sun)


