source('utilities.R')

Sidebar <- function (){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard')
  check <- check_packages(required_packages)
  
  sidebar <- dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
    )
  )
  
  return(sidebar)
}