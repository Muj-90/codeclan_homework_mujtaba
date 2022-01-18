
library(shiny)
library(shinythemes)
install.packages(shinythemes)
library(tidyverse)


recovery_times <- read_csv("recovery_times.csv")
ui <- fluidPage(
  theme = shinytheme("united"),
  titlePanel("Recovery times أوقات الشفاء "),
  
  sidebarLayout(
    sidebarPanel(
      
      radioButtons("treatment_input",
                   "what type of treatment ما نوع العلاج?",
                   choices = c("treatment_a", "treatment_b","control")
      ),
      
      selectInput("team_input",
                  "what is the result ما هي النتيجة?",
                  choices = c("",
                              "Excellent ممتاز",
                              "Good حسن",
                              "Average متوسط",
                              "Poor فقير"
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
      filter(treatment_group == input$treatment) %>%
      ggplot() +
      aes(x = treatment_group, y = recovery, fill = treatment_group) +
      geom_col()
  })
}

shinyApp(ui, server)
