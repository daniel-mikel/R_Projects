


# libraries -----------------------------------------------------------------------------------------------------------
library("rvest")
library("tidyverse")

all_sites <- as.data.frame(NULL)
numbers <- "0"

camp <- c("upper_pines", "lower_pines", "north_pines")
url <- c("https://www.recreation.gov/campsiteCalendar.do?page=calendar&contractCode=NRSO&parkId=70925&calarvdate=04/26/2018&sitepage=true&startIdx=",
		 "https://www.recreation.gov/campsiteCalendar.do?page=calendar&contractCode=NRSO&parkId=70928&calarvdate=04/26/2018&sitepage=true&startIdx=",
		 "https://www.recreation.gov/campsiteCalendar.do?page=calendar&contractCode=NRSO&parkId=70927&calarvdate=04/26/2018&sitepage=true&startIdx=")
camp_dict <- as.data.frame(cbind(camp, url))



num_site <- as.vector(NULL)

for(n in (1:nrow(camp_dict))){
	not_url <- camp_dict[n,2]
	url <- paste0(not_url, numbers)
	print(numbers)

	webpage <- read_html(url)
	path.total <- "thead span~ span+ span"
	html_cal <- html_nodes(webpage, path.total)
	total <- as.numeric(html_text(html_cal, trim = TRUE))

	num_site <- append(num_site, total)
}

big_camp_dict <- cbind(camp_dict, num_site)

for(c in (1:nrow(big_camp_dict))){
	print(big_camp_dict[c,1])
	numbers <- "0"

	for (i in (1:(floor(as.numeric(big_camp_dict[c,3])/25)+1))){
		# website ---------------------------------------------------------------------------------------------------------	
		not_url <- camp_dict[c,2]
		url <- paste0(not_url, numbers)
		webpage <- read_html(url)

		print(numbers)
	
		# availability ----------------------------------------------------------------------------------------------------
		path <- "td.status"
	
		column <- 14
		html <- html_nodes(webpage, path)
		data <- html_text(html, trim = TRUE)
		matrix <- matrix(data, ncol = column, byrow = TRUE)
		df <- as.data.frame(matrix, stringsAsFactors = FALSE)
		
		
		
		# dates -----------------------------------------------------------------------------------------------------------
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
		
		# camp name -------------------------------------------------------------------------------------------------------
		
		camp_name <- rep.int(camp_dict[c,1], 1)
	
		# site id ---------------------------------------------------------------------------------------------------------
		camp_id <- (as.numeric(numbers)+1):(as.numeric(numbers)+25)
		df <- cbind(camp_name, camp_id, df)
	
		# combine df
		all_sites <- rbind(all_sites, df)
	
		numbers <- as.character((as.numeric(numbers) + 25))
	
	}
}


str(all_sites)

tidy_sites <- all_sites %>%
	select(camp_name, camp_id, Th_26, F_27, Sa_28, Su_29) %>%
	gather(value = availability, Th_26, F_27, Sa_28, Su_29) %>%
	filter(availability == "A") %>%
	rename(day = Th_26)

tidy_sites
