source('utilities.R')
source('reference.R')
source('DataManagement.R')

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
    tags$h4('Filters', align='center'),
    dateRangeInput('dateRange',
                   label = 'Date of Death',
                   start = NA, end = NA,
                   separator = ' to ', 
                   weekstart = 1
                   ), 
    actionButton("clearDateRange", 
                 "Clear Date Range",
                 width = '85%',
                 style = 'simple',
                 color = 'danger'
        ),
    
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

    pickerInput('filter_mannerofdeath',
                'Manner of Death',
                choices = getData_mannerofdeath(),
                multiple = TRUE,
                options = list(
                  `actions-box` = TRUE,
                  `selected-text-format` = 'count > 3',
                  `none-selected-text` = 'Nothing Filtered'
                )
        ),
    sliderTextInput('filter_age', 
                    label = 'Age', 
                    choices = c(0:98,'99+'),
                    selected = c(0,'99+'),
                    
    ),
    pickerInput('filter_sex',
                'Race',
                choices = getData_sex(),
                multiple = TRUE,
                options = list(
                  `actions-box` = TRUE,
                  `selected-text-format` = 'count > 3',
                  `none-selected-text` = 'Nothing Filtered'
                )
      ),
    pickerInput('filter_race',
                'Race',
                choices = getData_race(),
                multiple = TRUE,
                options = list(
                  `actions-box` = TRUE,
                  `selected-text-format` = 'count > 3',
                  `none-selected-text` = 'Nothing Filtered'
                )
      ),
    pickerInput('filter_ethnicity',
                'Ethnicity',
                choices = getData_ethnicity(),
                multiple = TRUE,
                options = list(
                  `actions-box` = TRUE,
                  `selected-text-format` = 'count > 3',
                  `none-selected-text` = 'Nothing Filtered'
                )
      ),
    pickerInput('filter_education',
                'Race',
                choices = getData_education(),
                multiple = TRUE,
                options = list(
                  `actions-box` = TRUE,
                  `selected-text-format` = 'count > 3',
                  `none-selected-text` = 'Nothing Filtered'
                )
      )

  )
  
  tags$button(id='clearDateRange', type="button", class=paste("btn action-button",'primary btn-primary',collapse=" "))
  
  return(sidebar)
}


