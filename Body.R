source('utilities.R')

Body <- function (){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard')
  check <- check_packages(required_packages)
  
  
  body <- dashboardBody(

    tabItems(
      tabItem(tabName = "overview",
              h2("Overview Dashboard"),
              fluidRow(
                valueBox(200, 'Suicides',icon=icon('user'), color='red'),
                valueBox('Firearm', 'Top Weapon',icon=icon('cog'), color='red')
              )
        ),
      
      tabItem(tabName = 'focus-1',
              h2('Focused Dashboard')),

      tabItem(tabName='report-1',
              h2('Report 1')),
      
      tabItem(tabName='report-2',
              h2('Report 2')),
      
      tabItem(tabName='report-3',
              h2('Report 3')),
      
      tabItem(tabName = 'about',
              h2('About This Application'))
      
      
    )
  )
  
  return(body)
}


