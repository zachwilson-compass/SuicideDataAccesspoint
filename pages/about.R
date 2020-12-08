source('utilities.R')


getPageAbout <- function(){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard', "shinyWidgets")
  check <- check_packages(required_packages)
  
  output <- tabItem(tabName = 'about',
          h2('About This Application'))
  
  return(output)
}