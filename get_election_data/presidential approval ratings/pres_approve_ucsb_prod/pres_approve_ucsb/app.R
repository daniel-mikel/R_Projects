library(shiny)
library(tidyverse)
library(scales)

tidy_pres <- read.csv("tidy_pres.csv", stringsAsFactors = FALSE)

tidy_pres$start_date <- as.Date(tidy_pres$start_date, 
                                format = "%Y-%m-%d")
tidy_pres$end_date <- as.Date(tidy_pres$end_date, 
                              format = "%Y-%m-%d")
tidy_pres$number <- as.factor(tidy_pres$number)

cols <- c("approve" = "#8BBF9F", "disapprove" = "#F7A278", "unsure" = "#A4BFEB")

ui <- fluidPage(
  titlePanel("Presidential Approval Rating"),
  fluidRow(
    column(selectizeInput("number", "Select POTUS",
                       choices = c("Franklin D. Roosevelt" = "32", 
                                   "Harry S. Truman" = "33",
                                   "Dwight D. Eisenhower" = "34",
                                   "John F. Kennedy" = "35",
                                   "Lyndon B. Johnson" = "36",
                                   "Richard Nixon" = "37",
                                   "Gerald Ford" = "38",
                                   "Jimmy Carter" = "39",
                                   "Ronald Reagan" = "40",
                                   "George H. W. Bush" = "41",
                                   "Bill J. Clinton" = "42",
                                   "George W. Bush" = "43",
                                   "Barack Obama" = "44",
                                   "Donald J. Trump" = "45"),
                       selected = "35"),
           width = 4),
    plotOutput("pres_plot")
  )
)

server <- function(input, output){

  output$pres_plot <- renderPlot({
    tidy_pres %>%
      filter(number == input$"number") %>%
      ggplot(aes(x = as.Date(end_date, format = "%Y-%m-%d"),
                 y = percent,
                 col = opinion)) +
      geom_jitter(alpha = 0.6, size = 1.5) +
      stat_smooth(span = 0.3, se= F) +
      scale_x_date(date_breaks = "4 month", labels = date_format("%m-%Y")) +
      scale_y_continuous(breaks = seq(0, 100, by = 10)) +
      ylab("Percent") +
      xlab(NULL) +
      theme_minimal() +
      theme(axis.text.x=element_text(angle=60, hjust=1)) + 
      scale_colour_manual(values = cols)
  })
}

shinyApp(ui = ui, server = server)

