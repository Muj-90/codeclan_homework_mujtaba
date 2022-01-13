
library(shiny)
library(shinythemes)
install.packages(shinythemes)
library(tidyverse)


recovery_times <- read_csv("recovery_times.csv")
ui <- fluidPage(
  theme = shinytheme("cerulean"),
  titlePanel("recovery times"),
  
  sidebarLayout(
    sidebarPanel(
      
      radioButtons("treatment_input",
                   "what type of treatment?",
                   choices = c("treatment_a", "treatment_b","control")
      ),
      
      selectInput("team_input",
                  "what is the result?",
                  choices = c("",
                              "Excellent",
                              "Good",
                              "Average",
                              "Poor"
                  )
      )
    ),
    
    mainPanel(
      plotOutput("prognosis_plot")
    )
  )
)

server <- function(input, output) {
  output$prognosis_plot <- renderPlot({
    
    recovery_times %>%
      filter(prognosis == "prognosis") %>%
      filter(treatment_group == input$treatment_group_input) %>%
      ggplot() +
      aes(x = treatment_group, y = recovery, fill = prognosis) +
      geom_col()
  })
}

shinyApp(ui, server)