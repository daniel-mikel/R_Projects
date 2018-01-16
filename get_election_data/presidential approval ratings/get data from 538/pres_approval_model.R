# libraries 
library("data.table")
library("tidyverse")
library("zoo")




# import data
app45_raw <- read.csv("/home/dan/Data/election/approval_ratings/from_538_potus45_approval_polls.csv",
	stringsAsFactors = T)

str(app45_raw)


# put data into tidy format
	# i kept weights in to compare models later

tidy45 <- app45_raw %>%
	select(president, subgroup, enddate, pollster, samplesize, population, approve, disapprove, weight) %>%
	gather(opinion, percent, -c(president, subgroup, enddate, pollster, samplesize, population, weight)) %>%
	mutate(enddate = as.Date(enddate, format = "%m/%d/%Y"))

str(tidy45)


# take a look at the data we're starting with
tidy45 %>%
	ggplot(aes(x = enddate, y = percent, color = opinion, size = samplesize, alpha = weight)) +
	geom_jitter() +
  	geom_smooth(method = "gam",  formula = y ~ s(x, bs = "cs"), se = F) +
	theme_minimal()
