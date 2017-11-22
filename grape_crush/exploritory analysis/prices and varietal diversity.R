library(tidyverse)

gc <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/all_gc_clean.csv", stringsAsFactors = FALSE)

# summary #
###########

# grape crush by variety, district, and year
vdy_gc <- gc %>%
  group_by(Variety, Year, District_Number) %>%
  summarize(Wt_price = sum(Base.Price.Per.Ton * Tons) / sum(Tons),
            Tonnage = sum(Tons),
            Value = Wt_price * Tonnage)

# grape crush by variety and year
  # this is for later

#vy_gc <- gc %>%
#  group_by(Variety, Year) %>%
#  summarize(Variety_Wt_price = sum(Base.Price.Per.Ton * Tons) / sum(Tons),
#            Variety_Tonnage = sum(Tons),
#            Variety_Value = Variety_Wt_price * Variety_Tonnage)

# grape crush by district and year
dy_gc <- gc %>%
  group_by(District_Number, Year) %>%
  summarize(District_Wt_price = sum(Base.Price.Per.Ton * Tons) / sum(Tons),
            District_Tonnage = sum(Tons),
            District_Value = District_Wt_price * District_Tonnage)

# grape crush by district and year
y_gc <- gc %>%
  group_by(Year) %>%
  summarize(Year_Wt_price = sum(Base.Price.Per.Ton * Tons) / sum(Tons),
            Year_Tonnage = sum(Tons),
            Year_Value = Year_Wt_price * Year_Tonnage)


# exploritory analysis #
########################

# gc varieties in district comparisons
com_gc <- vdy_gc %>%
  left_join(dy_gc, by = c("District_Number", "Year")) %>%
  mutate(Perc_Tonnage = Tonnage / District_Tonnage,
         Perc_Value = Value / District_Value,
         Com_price = Wt_price / District_Wt_price)

head(com_gc, n = 15)


# highest district values and volumes
com_gc %>%
  arrange(desc(Perc_Tonnage))

com_gc %>%
  arrange(desc(Perc_Value))


# Densities by district
dense_gc <- com_gc %>%
  mutate(pre_d_Tonnage = Perc_Tonnage^2,
         pre_d_Value = Perc_Value^2) %>%
  group_by(District_Number, Year) %>%
  summarize(Avg_price = sum(Wt_price * Tonnage) / sum(Tonnage),
            Total_volume = sum(Tonnage),
            Total_value = sum(Value),
            Dense_volume = sum(pre_d_Tonnage),
            Dense_value = sum(pre_d_Value))

# see which districts in 2016 were the most diverse
  # note that a higher Dense_<indication> means less diversity!

dense_gc %>%
  filter(Year == 2016) %>%
  arrange(Dense_value)

com_gc %>%
  filter(Year == 2016) %>%
  select(c(Variety, Year, District_Number, Wt_price, Com_price, Perc_Tonnage, Perc_Value)) %>%
  arrange(desc(Perc_Value))

# Napa Cab Sauv is a lot of the counties total, what percent of the states value is it?
  # for 2016:
    # Dist. 4 and Dist. 3 Cab Sauv make up ~10% and ~4% of the states sales of cab Sauv!
var_y_gc <- vdy_gc %>%
  left_join(y_gc, by = "Year") %>%
  mutate(Perc_Tonnage = Tonnage / Year_Tonnage,
         Perc_Value = Value / Year_Value,
         Com_price = Wt_price / Year_Wt_price) %>%
  select(c(Variety, Year, District_Number, Wt_price, Com_price, Tonnage, Perc_Tonnage, Perc_Value)) 

var_y_gc_2016 <- var_y_gc %>%
  filter(Year == 2016) %>%
  arrange(desc(Perc_Value))

sum(var_y_gc_2016$Perc_Value)

# District values and tonnages as % of state totals
dist_p_y_gc <- dy_gc %>%
  left_join(y_gc, by = "Year") %>%
  mutate(Perc_Tonnage = District_Tonnage / Year_Tonnage,
         Perc_Value = District_Value / Year_Value,
         Com_price = District_Wt_price / Year_Wt_price) %>%
  filter(Year == 2016) %>%
  arrange(desc(Perc_Value))


# exploritory plots #
#####################

# density over time
ggplot(dense_gc, aes(x = Year, y = Dense_value, group = District_Number, col = as.factor(District_Number))) + 
         geom_line()

# density and price
ggplot(dense_gc, aes(x = Dense_value, y = Avg_price, col = as.factor(District_Number))) + 
  geom_point()

# by district with varieties as % of state totals 
ggplot(var_y_gc_2016, aes(x = District_Number, y = Perc_Value, col = as.factor(District_Number))) + 
  geom_point()
