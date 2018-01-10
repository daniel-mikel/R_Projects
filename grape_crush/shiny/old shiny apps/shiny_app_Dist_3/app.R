library(shiny)
library(tidyverse)

gc <- read.csv("/home/dan/R/projects/grape_crush/shiny_app_Dist_3/data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  titlePanel("My app"),
  sidebarLayout(
    sidebarPanel(selectizeInput("variable", "Variable:",
                                unique(gc$Variety),
                                multiple = TRUE)
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
    filter(Variety %in% input$variable)
  })
  
  output$coolplot <- renderPlot({
      ggplot(filtered(), aes(x = Variety, y = Base.Price.Per.Ton, col = Type)) +
      geom_point() +
      geom_jitter(width = 0.2)
  })
  
  output$results <- DT::renderDataTable({
    gc %>%
      filter(Variety %in% input$variable) %>%
      group_by(Variety, Type) %>%
      summarize(number_of_sales = n(),
                average_price = mean(Base.Price.Per.Ton),
                tonnage = sum(Tons))
  })
}

shinyApp(ui = ui, server = server)