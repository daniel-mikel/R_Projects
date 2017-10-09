
# libraries
library(ggplot2)
library(ggridges)
library(gridExtra) 
library(ggjoy)
library(tidyverse)
library(RColorBrewer)

# data
gc2016 <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/gc2016_clean.csv")

# tidy
str(gc2016)

gc2016$Price <- as.numeric(gsub(",", "",gc2016$Price))
gc2016$Brix <- as.numeric(gsub(",", "", gc2016$Brix))
gc2016$Tons <- as.numeric(gsub(",", "", gc2016$Tons))
gc2016$District_Number <- as.factor(gsub(",", "", gc2016$District_Number))
gc2016$District_Number <- str_pad(gc2016$District_Number, 2, pad = "0")

tidy_gc2016 <- gc2016 %>%
	mutate(Value = Price * Tons) %>%
	arrange(District_Number)


head(tidy_gc2016, n = 20)
str(tidy_gc2016)


# summary
gc2016_d_v <- gc2016 %>%
	group_by(District, Variety) %>%
	summarize(Price = sum(Value)/sum(Tons),
			  Tons = sum(Tons)) %>%
	arrange()

head(gc2016_d_v, n = 20)	

# plot
ggplot(tidy_gc2016, aes(x = Price, y = District)) + geom_joy()

ggplot(tidy_gc2016, aes(x = Price, y = District_Number)) +
	geom_joy(scale=3, aes(fill=District_Number), alpha=1/2) + 
	scale_y_continuous(breaks=seq(0,17,1)) +
	scale_x_continuous(limits = c(0, 10000)) +
	theme_ridges()


# Log Price by District
ggplot(tidy_gc2016, aes(x = log(Price), y = District_Number, fill = District_Number, group = District_Number)) + 
  geom_joy(rel_min_height = 0.0001, scale = 1.7,alpha = 1/2) +
  scale_y_discrete(expand = c(0.01, 0)) +
  scale_fill_cyclical(values = c("#66c2a5",
  								 "#fc8d62",
  								 "#8da0cb",
  								 "#e78ac3",
  								 "#a6d854",
  								 "#ffd92f",
  								 "#e5c494")) +
  theme_joy() +
  xlab("Log Prices in Dollars per Ton") +
  ylab("Grape Pricing District")


# Log Price by District
  # organize by mean
tidy_gc2016 %>%
	group_by(District_Number) %>%
	mutate(m = mean(Price)) %>%
	arrange(m) %>%
	ungroup() %>%
	mutate(label = factor(District, unique(District))) %>%
	ggplot(aes(x = log(Price), y = label, fill = label)) + 
	geom_joy(rel_min_height = 0.01, scale = 2,alpha = 1/2) +
	scale_y_discrete(expand = c(0.01, 0)) +
	scale_fill_cyclical(values = c("#66c2a5",
  								 "#fc8d62",
  								 "#8da0cb",
  								 "#e78ac3",
  								 "#a6d854",
  								 "#ffd92f",
  								 "#e5c494")) +
	theme_joy() +
	xlab("Log Prices in Dollars per Ton") +
	ylab("Grape Pricing District, Ordered by Mean Price")  


# price of wine varieties
  # organized by ascending mean
  # grapes with more than 100 contracts

tidy_gc2016 %>%
	group_by(Variety) %>%
	mutate(m = mean(Price),
		   n = n(),
		   tons = Tons) %>%
	filter(n > 150) %>%
	arrange(m) %>%
	ungroup() %>%
	mutate(label = factor(Variety, unique(Variety))) %>%
	ggplot(aes(x = Price, y = label, fill = label)) + 
	geom_joy(rel_min_height = 0.01, scale = 2.8,alpha = 1/2) +
	scale_y_discrete(expand = c(0.01, 0)) +
	scale_x_continuous(limits = c(0, 10000)) +
	scale_fill_cyclical(values = c("#66c2a5",
  								 "#fc8d62",
  								 "#8da0cb",
  								 "#e78ac3",
  								 "#a6d854",
  								 "#ffd92f",
  								 "#e5c494")) +
	theme_joy() +
  xlab("Prices in Dollars per Ton") +
  ylab("Grape Variety, Ordered by Mean Price")  

