library(shiny)
library(shinythemes)
library(tidyverse)

# This is the Production version of the GC Shiny App

#load data
gc <- read.csv("gc_shiny.csv", stringsAsFactors = FALSE)
var <- gc %>%
  filter(Variety != "all red",
         Variety != "all white",
         Variety != "all wine")
types <- gc %>%
  filter(Variety == "all red" |
         Variety == "all white" |
         Variety == "all wine")

cols <- c("red" = "#F8766D", "white" = "#00BFC4", "raisin" = "#C77CFF", "table" = "#7CAE00", "all wine" = "#190B28")


# shiny app user interface
ui <- fluidPage(
  theme = shinytheme("flatly"),
  titlePanel("California Grape Crush Prices Per Ton by Variety"),
  sidebarLayout(
    sidebarPanel(sliderInput("year", "Select years", 2003, 2016, c(2012, 2016), sep = ""),
                 selectizeInput("variety", "Select one or more varieties",
                                sort(unique(gc$Variety)),
                                selected = c("all red", "all white"),
                                multiple = TRUE),
                 sliderInput("ylimits", "Select Price Range", 0, 30000, c(0, 15000), sep = ","),
                 radioButtons("dist", "Select district",
                              choices = c("[1] Mendocino" = 1,
                                          "[2] Lake" = 2,
                                          "[3] Sonoma" = 3,
                                          "[4] Napa" = 4,
                                          "[5] Solano" = 5,
                                          "[6] North Central Coast" = 6,
                                          "[7] Monterey and San Benito" = 7,
                                          "[8] San Luis Obispo" = 8,
                                          "[9] Northern California" = 9,
                                          "[10] Sierra Foothills" = 10,
                                          "[11] San Joaquin and Sacramento" = 11,
                                          "[12] San Joaquin, Stanislaus, Merced" = 12,
                                          "[13] Fresno, Madera, N. Tulare, Mono, Inyo" = 13,
                                          "[14] Kern, Kings, S. Tulare" = 14,
                                          "[15] L.A. and San Bernardino" = 15,
                                          "[16] So Cal" = 16,
                                          "[17] Yolo" = 17),
                              selected = 4),
                 strong("Show transaction level data in table?"),
                 checkboxInput("showdata", "Click to disaggragate data", FALSE),
                 width = 2
    ),
    mainPanel(
      plotOutput("gcplot", height = 760),
      br(), 
      DT::dataTableOutput("results"),
      width = 10
    )
  )
)

server <- function(input, output){
  filtered <- reactive({
    if (is.null(input$variety)){
      gc %>%
        filter(Year >= input$year[1],
               Year <= input$year[2],
               District_Number == input$dist,
               Type != "raisin",
               Type != "table",
               Variety != "all red",
               Variety != "all white",
               Variety != "all wine") 
      
      # the last three lines avoid double counting, since i 'duplicated' the data to get "all red" and "all white"
      
    } else {
      
      gc %>%
        filter(Year >= input$year[1],
               Year <= input$year[2],
               Variety %in% input$variety,
               District_Number == input$dist)
    }
  })
  
  output$gcplot <- renderPlot({
    if(is.null(input$variety)){
      
      ggplot(filtered(), aes(x = Year , y = Base.Price.Per.Ton, col = Type, size = Tons)) +
        geom_jitter(width = 0.3, height = 50, alpha = .2) +
        scale_size(range = c(1, 10)) +
        geom_smooth(method="loess", se= FALSE) +
        xlab("Year") + 
        ylab(NULL) +
        ylim(input$ylimits[1], input$ylimits[2]) +
        scale_x_continuous(breaks = input$year[1]:input$year[2]) + 
        theme_linedraw(base_size = 13) + 
        guides(size = FALSE) + 
        scale_colour_manual(values = cols)
      
    } else {
      
      ggplot(filtered(), aes(x = Year, y = Base.Price.Per.Ton, col = Type, size = Tons)) +
        geom_jitter(width = 0.3, height = 50, alpha = .35) +
        scale_size(range = c(1, 10)) +
        facet_grid(. ~ Variety) +
        geom_smooth(method="loess", se=F) +
        xlab("Year") + 
        ylab(NULL) +
        ylim(input$ylimits[1], input$ylimits[2]) +
        scale_x_continuous(breaks = input$year[1]:input$year[2]) + 
        theme_linedraw(base_size = 13) + 
        guides(size = FALSE) + 
        scale_colour_manual(values = cols)
    }
  })
  
  output$results <- DT::renderDataTable({
    if (is.null(input$variety) & input$showdata == FALSE){
      gc %>%
        filter(Year >= input$year[1],
               Year <= input$year[2],
               District_Number == input$dist,
               Type != "raisin",
               Type != "table",
               Variety != "all red",
               Variety != "all white",
               Variety != "all wine") %>%
        group_by(Type, Year) %>%
        summarize(Number_of_Sales = n(),
                  Average_Price = round(mean(Base.Price.Per.Ton), digits = -1),
                  Tonnage = round(sum(Tons), digits = 0),
                  Total_Value = Tonnage * Average_Price) %>%
        arrange(desc(Year), Type)
      
    } else if (is.null(input$variety) & input$showdata == TRUE){
      gc %>%
        filter(Year >= input$year[1],
               Year <= input$year[2],
               District_Number == input$dist,
               Type != "raisin",
               Type != "table",
               Variety != "all red",
               Variety != "all white",
               Variety != "all wine") %>%
        mutate(Total_Value = Base.Price.Per.Ton * Tons) %>%
        select(-c(Brix.Code, District, District_Number)) %>%
        select(c(Variety, Type, Year, everything())) %>%
        arrange(desc(Year), Variety)
      
    } else if (is.null(input$variety) == FALSE & input$showdata == TRUE){

      gc %>%
        filter(Year >= input$year[1],
               Year <= input$year[2],
               Variety %in% input$variety,
               District_Number == input$dist) %>%
        mutate(Total_Value = Base.Price.Per.Ton * Tons) %>%
        select(-c(Variety)) %>%
        unique() %>%
        left_join(var) %>%
        select(-c(Brix.Code, District, District_Number)) %>%
        select(c(Variety, Type, Year, everything())) %>%
        arrange(desc(Year), Variety)

    } else {
      
      gc %>%
        filter(Year >= input$year[1],
               Year <= input$year[2],
               Variety %in% input$variety,
               District_Number == input$dist) %>%
        group_by(Variety, Type, Year) %>%
        summarize(Number_of_Sales = n(),
                  Average_Price = round(mean(Base.Price.Per.Ton), digits = -1),
                  Tonnage = round(sum(Tons), digits = 0),
                  Total_Value = Tonnage * Average_Price) %>%
        arrange(desc(Year), Type)
    }
  })
}

shinyApp(ui = ui, server = server)