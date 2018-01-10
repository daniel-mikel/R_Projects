
long <- read.csv("/home/dan/Data/NASS/Grape_Crush/all_section_2/clean_csv/sec2_clean_2016.csv")
gc <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/all_gc_clean.csv")

long$tons <- as.numeric(long$tons)
long$District_Number <- as.factor(long$District_Number)

gc$District_Number <- as.factor(gc$District_Number)

sec_2_totals <- long %>%
  group_by(District_Number) %>%
  summarise(sec2_tons = sum(tons))

gc2016 <- gc %>%
  filter(Year == "2016") %>%
  group_by(District_Number) %>%
  summarise(sec8_tons = sum(Tons))

compare <- sec_2_totals %>%
  left_join(gc2016) 

gathered <- compare %>%
  gather(section, tons, -c(District_Number))

gathered %>%
  ggplot(aes(x = District_Number, y = tons, fill = section)) +
  geom_bar(position='dodge', stat='identity')

compare %>%
  mutate(percent = sec8_tons/sec2_tons) %>%
  ggplot(aes(x = District_Number, y = percent)) +
  geom_bar(stat='identity')


cols <- c("red" = "#F8766D", "white" = "#00BFC4", "raisin" = "#C77CFF", "table" = "#7CAE00", "all wine" = "#190B28")

long %>%
  group_by(District_Number, Type) %>%
  summarise(Tons = sum(tons)) %>%
  arrange(as.numeric(District_Number)) %>%
  ggplot(aes(x = as.factor(District_Number), y = Tons, fill = Type)) +
  geom_col() + 
  scale_fill_manual(values = cols) +
  xlab(NULL) + 
  ylab("Tons Sold") + 
  scale_x_discrete(labels = c("1" = "[1] Mendocino",
                              "2" = "[2] Lake",
                              "3" = "[3] Sonoma",
                              "4" = "[4] Napa",
                              "5" = "[5] Solano",
                              "6" = "[6] North Central Coast",
                              "7" = "[7] Monterey and San Benito",
                              "8" = "[8] San Luis Obispo",
                              "9" = "[9] Northern California",
                              "10" = "[10] Sierra Foothills",
                              "11" = "[11] San Joaquin and Sacramento",
                              "12" = "[12] San Joaquin, Stanislaus, Merced",
                              "13" = "[13] Fresno, Madera, N. Tulare, Mono, Inyo",
                              "14" = "[14] Kern, Kings, S. Tulare",
                              "15" = "[15] L.A. and San Bernardino",
                              "16" = "[16] So Cal",
                              "17" = "[17] Yolo")) +
  scale_y_continuous(labels = scales::comma) +
  ggtitle("Grape Production in Tons by District") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))  
