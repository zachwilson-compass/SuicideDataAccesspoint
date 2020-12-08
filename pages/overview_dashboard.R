source('utilities.R')


getPageOverviewDashboard <- function(){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard', "shinyWidgets")
  check <- check_packages(required_packages)
  
  
  
  output <- tabItem(tabName = "overview",
          h2("Overview Dashboard"),
          fluidRow(
            valueBox(200, 'Suicides',icon=icon('user'), color='red'),
            valueBox('Firearm', 'Top Weapon',icon=icon('cog'), color='red')
          )
  )
  
  
  
  return(output)
}