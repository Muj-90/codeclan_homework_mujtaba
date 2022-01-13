library(shiny)
library(shinythemes)
library(tidyverse)

fitness_levels <- read_csv("shiny_hw/data/fitness_levels.csv")
ui <- fluidPage(
    titlePanel("Title"),
    
    sidebarLayout(
        sidebarPanel(
            "Sidebar"
        ),
        
        mainPanel(
            "Main section"
        )
    )
)


server <- function(input, output) {
}

shinyApp(ui = ui, server = server)