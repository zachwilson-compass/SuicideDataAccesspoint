source('utilities.R')

Server<- function (input, output, session){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard', 'shinyWidgets')
  check <- check_packages(required_packages)
  
  # Observes clear date range event
  observeEvent(input$clearDateRange, {
    updateDateRangeInput(session, 'dateRange', start=NA, end=NA)
  })
  

  
}


