library(shiny)
library(shinythemes)
library(shinyWidgets)
library(tidyverse)
library(stringr)


# This is the version of the GC Shiny App to embed in websites

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
# shiny app user interface
ui <- fluidPage(
  theme = shinytheme("flatly"),
  # strong("California Wine Grape Varieties, Dollars per Ton"),
  dropdownButton(sliderInput("year", "Select years", 2003, 2016, c(2013, 2016), sep = ""),
                 selectizeInput("variety", "Select one or more varieties",
                                sort(unique(gc$Variety)),
                                selected = c("all red", "all white"),
                                multiple = TRUE),
                 sliderInput("ylimits", "Select Price Range", 0, 30000, c(0, 8000), sep = ","),
                 selectizeInput("dist", "Select district",
                                choices = c("[1] Mendocino" = "[1] Mendocino",
                                            "[2] Lake" = "[2] Lake",
                                            "[3] Sonoma" = "[3] Sonoma",
                                            "[4] Napa" = "[4] Napa",
                                            "[5] Solano" = "[5] Solano",
                                            "[6] North Central Coast" = "[6] North Central Coast",
                                            "[7] Monterey and San Benito" = "[7] Monterey and San Benito",
                                            "[8] San Luis Obispo" = "[8] San Luis Obispo",
                                            "[9] Northern California" = "[9] Northern California",
                                            "[10] Sierra Foothills" = "[10] Sierra Foothills",
                                            "[11] San Joaquin and Sacramento" = "[11] San Joaquin and Sacramento",
                                            "[12] San Joaquin, Stanislaus, Merced" = "[12] San Joaquin, Stanislaus, Merced",
                                            "[13] Fresno, Madera, N. Tulare, Mono, Inyo" = "[13] Fresno, Madera, N. Tulare, Mono, Inyo",
                                            "[14] Kern, Kings, S. Tulare" = "[14] Kern, Kings, S. Tulare",
                                            "[15] L.A. and San Bernardino" = "[15] L.A. and San Bernardino",
                                            "[16] So Cal" = "[16] So Cal",
                                            "[17] Yolo" = "[17] Yolo"),
                                selected = "[3] Sonoma"),
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
    if (is.null(input$variety)){
      gc %>%
        filter(Year >= input$year[1],
               Year <= input$year[2],
               District_Disc == input$dist,
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
               District_Disc == input$dist)
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
        ggtitle(paste0("Price per Ton in District ", input$dist,", Red and White Wine Varieties Compaired")) +
        ylim(input$ylimits[1], input$ylimits[2]) +
        scale_x_continuous(breaks = input$year[1]:input$year[2]) + 
        theme_linedraw(base_size = 13) + 
        guides(size = FALSE) + 
        scale_colour_manual(values = cols)
      
    } else {
      
      ggplot(filtered(), aes(x = Year, y = Base.Price.Per.Ton, col = Type, size = Tons)) +
        geom_jitter(width = 0.3, height = 50, alpha = .2) +
        scale_size(range = c(1, 10)) +
        facet_grid(. ~ Variety) +
        geom_smooth(method="loess", se=F) +
        xlab(NULL) + 
        ylab(NULL) +
        ggtitle(paste0("Price per Ton in District ", input$dist, " for: ", fun_title(input$variety))) +
        ylim(input$ylimits[1], input$ylimits[2]) +
        scale_x_continuous(breaks = input$year[1]:input$year[2]) + 
        theme_linedraw(base_size = 13) + 
        guides(size = FALSE) + 
        scale_colour_manual(values = cols)
    }
  })
}

shinyApp(ui = ui, server = server)