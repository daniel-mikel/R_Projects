# libraries

library(ggridges)
library(ggjoy)
library(tidyverse)

gc <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/all_gc_clean.csv")
district_key <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/district_key.csv")
gc$District_Number <- as.factor(gc$District_Number)
district_key$District_Number <- as.factor(district_key$District_Number)

gc <- gc %>%
  left_join(district_key)

# price in each district

gc %>%
  filter(Base.Price.Per.Ton <= 10000) %>%
  arrange(desc(District_Number)) %>%
  mutate(label = factor(District_Disc, unique(District_Disc))) %>%
  ggplot(aes(x = Base.Price.Per.Ton, y = label, fill = label)) + 
  geom_joy(rel_min_height = 0.005, scale = 2,alpha = 0.5) +
  # scale_x_continuous(breaks = c(0,5000, 10000, 15000)) +
  scale_y_discrete(expand = c(0.01, 0)) +
  scale_fill_cyclical(values = c("#66c2a5",
                                 "#fc8d62",
                                 "#8da0cb",
                                 "#e78ac3",
                                 "#a6d854",
                                 "#ffd92f",
                                 "#e5c494")) +
  theme_joy() +
  xlab("Price, Dollars per Ton") +
  ylab("Grape Pricing District")  
