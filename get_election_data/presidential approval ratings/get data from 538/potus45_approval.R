
library("data.table")
library("tidyverse")
library("zoo")

potus45_approval <- fread("https://projects.fivethirtyeight.com/trump-approval-data/approval_polllist.csv")

str(potus45_approval)

tidy45 <- potus45_approval %>%
	select(president, subgroup, enddate, pollster, samplesize, population, approve, disapprove) %>%
	gather(opinion, percent, -c(president, subgroup, enddate, pollster, samplesize, population)) %>%
	mutate(enddate = as.Date(enddate, format = "%m/%d/%Y"))

str(tidy45)

tidy45 %>%
	ggplot(aes(x = enddate, y = percent, color = opinion)) +
	geom_jitter(alpha = 0.8) +
  	geom_smooth(method = "gam",  formula = y ~ s(x, bs = "cs"), se = F) +
	theme_minimal()
