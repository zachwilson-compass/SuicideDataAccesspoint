source('utilities.R')

Body <- function (){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard')
  check <- check_packages(required_packages)
  
  # Sources pages
  sourceMultiple('pages', '*.R')
  
  
  # Creates body
  body <- dashboardBody(

    tabItems(
      getPageOverviewDashboard(),
      
      tabItem(tabName = 'focus-1',
              h2('Focused Dashboard')),

      getPageReport1(),
      getPageReport2(),
      getPageReport3(),

      getPageAbout()
      
      
      
    )
  )
  
  return(body)
}


