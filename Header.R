source('utilities.R')

Header<- function (){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard')
  check <- check_packages(required_packages)
  
  # Creates Header
  header <- dashboardHeader(title = "Accesspoint")
  
  # Returns header from function
  return(header)
  
}


