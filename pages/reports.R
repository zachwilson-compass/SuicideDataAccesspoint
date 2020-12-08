source('utilities.R')


getPageReport1 <- function(){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard', "shinyWidgets")
  check <- check_packages(required_packages)
  
  
  
  output <- tabItem(tabName = "report-1",
                    h2("Report 1")
  )
  
  
  
  return(output)
}

getPageReport2 <- function(){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard', "shinyWidgets")
  check <- check_packages(required_packages)
  
  
  
  output <- tabItem(tabName = "report-2",
                    h2("Report 2")
  )
  
  
  
  return(output)
}

getPageReport3 <- function(){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard', "shinyWidgets")
  check <- check_packages(required_packages)
  
  
  
  output <- tabItem(tabName = "report-3",
                    h2("Report 3")
  )
  
  
  
  return(output)
}