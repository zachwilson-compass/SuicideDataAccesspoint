source('utilities.R')

Body <- function (){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard')
  check <- check_packages(required_packages)
  
  
  body <- dashboardBody(

    # Second tab content
    tabItem(tabName = "dashboard",
            h2("[Insert Dashboard Here]")
      )
    
  )
  
  return(body)
}