# visualizing gc data with ggplot2

# packages
library(tidyverse)

# import gc 
gc <- read.csv(file = "/home/dan/Data/NASS/Grape_Crush/gc_csv/all_gc_clean.csv", stringsAsFactors = FALSE)


# explore gc data
gc$Base.Price.Per.Ton <- as.numeric(gc$Base.Price.Per.Ton)
gc$Brix.Code <- as.numeric(gc$Brix.Code)
gc$Tons <- as.numeric(gc$Tons)
gc$Year <- as.integer(gc$Year)

gc %>%
	group_by(Year) %>%
	summarize(n = n())

unique(gc$Variety)

table((unique(gc$Variety) == "aglianico"))["TRUE"] # check if grape variety is on list

# compare prices of varieties in a district
gc %>%
	filter(Variety == "cabernet sauvignon" | Variety == "chardonnay" | Variety == "pinot noir" | Variety == "cabernet franc", 
		District_Number == 3) %>%
	ggplot(aes(x = Year , y = Base.Price.Per.Ton, col = Variety)) +
	geom_point() +
  	facet_grid(. ~ Variety) +
	geom_smooth(method="loess", se=F) +
	geom_jitter(width = 0.3, height = 50) +
	ylim(0,15000) +
	xlab("Year") +
	ylab("Price per Ton") +
	ggtitle("Grape Prices by Variety for Sonoma County") + 
    theme(plot.title = element_text(lineheight=.8, face="bold"))


# compare prices between districts
gc %>%
	filter(District_Number == 3 | District_Number == 4 | District_Number == 2 | District_Number == 1) %>%
	ggplot(aes(x = Year , y = Base.Price.Per.Ton, col = District)) +
	geom_point() +
	geom_jitter(width = 0.3, height = 50) +
  	facet_grid(. ~ District) +
	geom_smooth(method="loess", se=F) +
	ylim(0,20000)


# find out history of a grape in CA
gc %>%
	filter(Variety == "aglianico") %>%
	ggplot(aes(x = Year , y = Base.Price.Per.Ton, col = District)) +
	geom_point() +
  	facet_grid(. ~ Variety) +
	geom_jitter(width = 0.3, height = 50) +
	ylim(0,15000) +
	xlab("Year") +
	ylab("Price per Ton") +
	ggtitle("Grape Prices by Variety for Sonoma County") + 
    theme(plot.title = element_text(lineheight=.8, face="bold"))

