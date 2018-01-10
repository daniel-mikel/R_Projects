
# function as if-then with selector as ggplot arguments

# stop using facets start using multiple panels


cols <- c("red" = "#F8766D", "white" = "#00BFC4", "raisin" = "#C77CFF", "table" = "#7CAE00", "all wine" = "#190B28")
gc %>%
  filter(Year == 2016) %>%
  filter(Variety != "all wine" | Variety != "all white" | Variety != "all red") %>%
  group_by(District_Disc, District_Number, Type) %>%
  summarise(Thousand_Tons = sum(Tons)/1000) %>%
  arrange(District_Number) %>%
  ggplot(aes(x = as.factor(District_Number), y = Thousand_Tons, fill = Type)) +
  geom_col() + 
  scale_fill_manual(values = cols) +
  xlab(NULL) + 
  ylab("Thousand Tons Sold") + 
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
  ggtitle("Grape Production in Tons by District") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))  
