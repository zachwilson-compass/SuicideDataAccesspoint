# This file is meant to test the Main.R file

# Source Files
source('Sidebar.R')
source('Body.R')
source('Header.R')
source('utilities.R')


# Manages required packages
required_packages <- c('shiny', 'shinydashboard')
check <- check_packages(required_packages)


# Pulls dashboard components
header <- Header()
body <- Body()
sidebar <- Sidebar()


# Creates User Interface
ui <- dashboardPage(
  header,
  sidebar,
  body
)


# Creates Server object
server <- function(input, output) {
  
  
}


# Creates Shiny App
shinyApp(ui, server)
