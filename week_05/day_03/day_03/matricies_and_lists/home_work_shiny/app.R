library(shiny)
library(shinythemes)
library(tidyverse)

library(CodeClanData)
recovery_times <- read_csv("recovery_times.csv")
  
  titlePanel(tags$b("Five Country Medal Comparison")),
  
  theme = shinytheme("sandstone"),
  
  fluidRow(
    column(
      6,
      radioButtons("season_input",
                   tags$i("Summer or Winter Olympics?"),
                   choices = c("Summer", "Winter")
      )
    ),
    column(
      6,
      radioButtons("medal_input",
                   tags$i("Compare Which Medals?"),
                   choices = c("Gold", "Silver", "Bronze")
      )
    )
  ),
  
  fluidRow(
    
    tabsetPanel(
      tabPanel(
        "Plot",
        plotOutput("medal_plot")
      ),
      tabPanel(
        "Text",
        "This is some text in a different tab."
      )
    )
  )
)


server <- function(input, output) {
  output$medal_plot <- renderPlot({
    
    olympics_overall_medals %>%
      filter(team %in% c(
        "United States",
        "Soviet Union",
        "Germany",
        "Italy",
        "Great Britain"
      )) %>%
      filter(medal == input$medal_input) %>%
      filter(season == input$season_input) %>%
      ggplot() +
      aes(x = team, y = count, fill = medal) +
      geom_col() +
      scale_fill_manual(values = c("Gold" = "#D4AF37",
                                   "Silver" = "#C0C0C0",
                                   "Bronze" = "#B08D57"))
  })
}

shinyApp(ui = ui, server = server)