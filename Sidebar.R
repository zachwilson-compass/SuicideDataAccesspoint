source('utilities.R')
source('reference.R')

Sidebar <- function (){
  # Required Packages
  required_packages <- c('shiny', 'shinydashboard', "shinyWidgets")
  check <- check_packages(required_packages)
  
  sidebar <- dashboardSidebar(

    sidebarMenu(
      sidebarSearchForm(textId='searchText', buttonId='searchButton', label = 'Search...'),
      
  
      menuItem('Dashboard', tabName = 'dashboard', icon = icon('dashboard'),
               menuSubItem('Overview', tabName = 'overview'),
               menuSubItem('Focus 1', tabName = 'focus-1')),
      menuItem('Reports', tabname = 'reports', icon = icon('file'),
               menuSubItem('Report 1', tabName = 'report-1'),
               menuSubItem('Report 2', tabName = 'report-2'),
               menuSubItem('Report 3', tabName = 'report-3')),
      menuItem('About', tabName = 'about', icon = icon('info'))
     
    ),
    hr(),
    hr(),
    tags$h4('Filters', align='center'),
    dateRangeInput('dateRange',
                   label = 'Date Range',
                   start = Sys.Date()-365, end = Sys.Date(),
                   separator = ' to ', 
                   weekstart = 1
                   ), 
    actionButton("clearDateRange", 
                 "Clear Date Range",
                 width = '85%'),
    pickerInput('countyPicker', 
                'County of Residence', 
                choices = getGeorgiaCountyList(), 
                multiple = TRUE,
                options = list(
                  `actions-box` = TRUE,
                  `selected-text-format` = 'count > 3',
                  `none-selected-text` = 'Nothing Filtered'
                )
        ),
    pickerInput('weaponPicker',
                'Weapon',
                choices = getWeaponsList(),
                multiple = TRUE,
                options = list(
                  `actions-box` = TRUE,
                  `selected-text-format` = 'count > 3',
                  `none-selected-text` = 'Nothing Filtered'
                )
        )

  )
  
  return(sidebar)
}


