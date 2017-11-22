library(shiny)
library(tidyverse)

gc <- read.csv("/home/dan/Data/NASS/Grape_Crush/gc_csv/all_gc_clean.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  titlePanel("My app"),
  sidebarLayout(
    sidebarPanel(sliderInput("year", "Input Year", 2003, 2016, c(2010, 2016)),
                 selectizeInput("variable", "Variable:",
                                unique(gc$Variety),
                                multiple = TRUE),
                 radioButtons("dist", "District",
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
                                          "So California" = 16,
                                          "Yolo" = 17))
    ),
    mainPanel(
      plotOutput("coolplot"),
      br(), 
      DT::dataTableOutput("results")
    )
  )
)

server <- function(input, output){
  filtered <- reactive({
    gc %>%
      filter(Year >= input$year[1],
             Year <= input$year[2],
             Variety %in% input$variable,
             District_Number == input$dist)
  })
  
  output$coolplot <- renderPlot({
    ggplot(filtered(), aes(x = Variety, y = Base.Price.Per.Ton, col = Type)) +
      geom_point() +
      geom_jitter(width = 0.2)
  })
  
  output$results <- DT::renderDataTable({
    gc %>%
      filter(Year >= input$year[1],
             Year <= input$year[2],
             Variety %in% input$variable,
             District_Number == input$dist) %>%
      group_by(Variety, Type) %>%
      summarize(number_of_sales = n(),
                average_price = mean(Base.Price.Per.Ton),
                tonnage = sum(Tons))
  })
}

shinyApp(ui = ui, server = server)