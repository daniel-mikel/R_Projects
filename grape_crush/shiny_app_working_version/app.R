library(shiny)
library(shinythemes)
library(tidyverse)

# default value is not NULL
  # however, NULL now displayes all grapes sold in that district

# to do next:
  # make color palette constant for varieties!
  # loess smoothing was being buggy for South San Joaquin, check that this si resolved now


gc <- read.csv("gc_shiny.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  theme = shinytheme("flatly"),
  titlePanel("California Grape Crush Prices Per Ton by Variety"),
  sidebarLayout(
    sidebarPanel(sliderInput("year", "Select years", 2003, 2016, c(2010, 2016), format = yyyy),
                 selectizeInput("variety", "Selelect one or more varieties",
                                sort(unique(gc$Variety)),
                                selected = c("all red", "all white"),
                                multiple = TRUE),
                 radioButtons("dist", "Select district",
                              choices = c("Mendocino" = 1,
                                          "Lake" = 2,
                                          "Sonoma" = 3,
                                          "Napa" = 4,
                                          "Solano" = 5,
                                          "North Central Coast" = 6,
                                          "Monterey and San Benito" = 7,
                                          "San Luis Obispo" = 8,
                                          "Northern California" = 9,
                                          "Sierra Foothills" = 10,
                                          "San Joaquin and Sacramento" = 11,
                                          "San Joaquin, Stanislaus, Merced" = 12,
                                          "Fresno, Madera, N. Tulare, Mono, Inyo" = 13,
                                          "Kern, Kings, S. Tulare" = 14,
                                          "L.A. and San Bernardino" = 15,
                                          "So Cal" = 16,
                                          "Yolo" = 17),
                              selected = 1),
                 width = 2
                 ),
    mainPanel(
      plotOutput("gcplot", height = 600),
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
               Base.Price.Per.Ton < 30000,
               Type != "raisin",
               Type != "table",
               Variety != "all red",
               Variety != "all white") 
      
      # the last two lines avoid double counting, since i 'duplicated' the data to get "all red" and "all white"
      
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
        # ylim(0, 15000) +
        theme_linedraw() + 
        guides(size = FALSE)
    
      } else {
      
      ggplot(filtered(), aes(x = Year , y = Base.Price.Per.Ton, col = Type, size = Tons)) +
        geom_jitter(width = 0.3, height = 50, alpha = .4) +
        scale_size(range = c(1, 10)) +
        facet_grid(. ~ Variety) +
        geom_smooth(method="loess", se=F) +
        xlab("Year") + 
        ylab(NULL) +
        ylim(0,15000) +
        theme_linedraw() + 
        guides(size = FALSE)
    }
  })
  
  output$results <- DT::renderDataTable({
    if (is.null(input$variety)){
      gc %>%
        filter(Year >= input$year[1],
               Year <= input$year[2],
               District_Number == input$dist,
               Type != "raisin",
               Type != "table",
               Variety != "all red",
               Variety != "all white") %>%
        group_by(Type, Year) %>%
        summarize(number_of_sales = n(),
                  average_price = round(mean(Base.Price.Per.Ton), digits = -1),
                  tonnage = round(sum(Tons), digits = 0),
                  total_value = tonnage * average_price) %>%
        arrange(desc(Year), Type)
      
    } else {
    
    gc %>%
      filter(Year >= input$year[1],
             Year <= input$year[2],
             Variety %in% input$variety,
             District_Number == input$dist) %>%
      group_by(Variety, Type, Year) %>%
      summarize(number_of_sales = n(),
                average_price = round(mean(Base.Price.Per.Ton), digits = -1),
                tonnage = round(sum(Tons), digits = 0),
                total_value = tonnage * average_price) %>%
        arrange(desc(Year), Type)
    }
  })
}

shinyApp(ui = ui, server = server)