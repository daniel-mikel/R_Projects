library(shiny)
library(shinythemes)
library(shinyWidgets)
library(tidyverse)
library(scales)

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

Simple_Cap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}

fun_title <- function(variety){
  if(length(variety) >= 3){
    paste0(str_c(sapply((variety[1:(length(variety)-1)]), Simple_Cap), collapse = ", "), " and ", sapply((variety[length(variety)]), Simple_Cap))
  } else if (length(variety) == 1){
    paste0(sapply((variety), Simple_Cap))
  } else {
    str_c(sapply((variety), Simple_Cap), collapse = " and ")
  }
}


ui <- fluidPage(
  theme = shinytheme("flatly"),
  # strong("California Wine Grape Varieties, Dollars per Ton"),
  dropdownButton(sliderInput("Year", "Choose a year:", 
                             min = 2005, max = 2016, 
                             value = 2017, 
                             sep = ""),
                 selectizeInput("variety", "Select a variety and year",
                             sort(unique(gc$Variety)),
                             selected = c("all red"),
                             multiple = FALSE),
                 radioButtons("Vort", "Display Production in ",
                              c("Tons" = "Tons",
                                "Dollars" = "Dollars")),
                 circle = TRUE, status = "danger", size = "sm",
                 icon = icon("gear"), label = NULL, tooltip = FALSE, right = FALSE,
                 up = FALSE, width = NULL
  ),
  mainPanel(
    plotOutput("gcplot", height = 600),
    width = 12
  )
)

server <- function(input, output){
  filtered <- reactive({
    if(input$Vort == "Tons"){
    gc %>%
      filter(Year == input$Year,
             Variety == input$variety) %>%
      group_by(District_Disc, District_Number, Type) %>%
      summarise(Yaxis = sum(Tons)) %>%
      arrange(District_Number) 
    } else {
      gc %>%
        filter(Year == input$Year,
               Variety == input$variety) %>%
        group_by(District_Disc, District_Number, Type) %>%
        summarise(Yaxis = sum(Tons * Base.Price.Per.Ton)) %>%
        arrange(District_Number) 
    }
  })
  
  output$gcplot <- renderPlot({
    ggplot(filtered(), aes(x = as.factor(District_Number), y = Yaxis, fill = Type)) +
      geom_col() + 
      scale_fill_manual(values = cols) +
      xlab(NULL) + 
      ylab(paste("Production in", input$Vort)) + 
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
      scale_y_continuous(labels = comma) +
      ggtitle(paste("Production in", input$Vort, "for", fun_title(input$variety), "Wine Grapes by District")) +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 30, hjust = 1),
            plot.title = element_text(size = 18))
  })
}

shinyApp(ui = ui, server = server)