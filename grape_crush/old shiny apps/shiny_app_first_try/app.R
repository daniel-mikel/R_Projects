library(shiny)
library(ggplot2)
library(dplyr)
library(DT)

gc <- read.csv(file = "/home/dan/Data/NASS/Grape_Crush/gc_csv/all_gc_clean.csv", 
               stringsAsFactors = FALSE)

gc$Base.Price.Per.Ton <- as.numeric(gc$Base.Price.Per.Ton)
gc$Brix.Code <- as.numeric(gc$Brix.Code)
gc$Tons <- as.numeric(gc$Tons)
gc$Year <- as.integer(gc$Year)

ui <- fluidPage(
  titlePanel("Historic Grape Crush"),
  sidebarLayout(),
  mainPanel(
    plotOutput("gcplot"),
    br(), br(),
    DT::dataTableOutput("results")
  )
)

server <- function(input, output) {
  output$gcplot <- renderPlot({
      ggplot(gc, aes(x = Year , y = Base.Price.Per.Ton, col = District)) +
      geom_point() +
      geom_jitter(width = 0.3, height = 50) +
      ylim(0,20000)
  })
  
  output$results <- DT::renderDataTable({
    filtered()
  })
}

shinyApp(ui = ui, server = server)