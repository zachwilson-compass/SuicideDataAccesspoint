getData <- function() {
  
  # Sources
  source('utilities.R')
  
  
  # Check Packages
  required_packages <- c('tidyverse', 'lubridate')
  check <- check_packages(required_packages)
  
  data <- read.csv('data/data.csv')
  
  output <- data %>% 
    mutate(
      dateofdeath_date = as.Date(dateofdeath),
      dateofdeath_year = year(dateofdeath),
      dateofdeath_month = month(dateofdeath),
      dateofdeath_day = day(dateofdeath),
      dateofdeath_weekday = weekdays(dateofdeath_date),
      dateofdeath_week = floor_date(dateofdeath_date, unit='week'),
      dateofdeath_quarter = floor_date(dateofdeath_date, unit='quarter'),
      age_label = if_else(age >= 99, '99+', as.character(age))
    )
  
  return(output)
}

getData_mannerofdeath <- function(){
  output <- getData() %>% 
    select(manner_of_death_label) %>% 
    unique()
  
  return(output$manner_of_death_label)
}

getData_race <- function(){
  output <- getData() %>% 
    select(race_label) %>% 
    unique()
  
  return(output$race_label)
}

getData_sex <- function(){
  output <- getData() %>% 
    select(sex_label) %>% 
    unique()
  
  return(output$sex_label)
}

getData_ethnicity <- function(){
  output <- getData() %>% 
    select(ethnicity_label) %>% 
    unique()

  return(output$ethnicity_label)
}

getData_education <- function(){
  output <- getData() %>% 
    select(eduction_label) %>% 
    unique()
  
  return(output$eduction_label)
}


