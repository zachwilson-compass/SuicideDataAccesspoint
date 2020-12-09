# Sources
source('utilities.R')


# Check Packages
required_packages <- c('tidyverse', 'charlatan')
check <- check_packages(required_packages)


n <- 1000

data_file <- data.frame(id <- 1:n)
data_file$name <- ch_name(n = n)
data_file$age <- ch_norm(n = n, mean = 50, sd = 10)
data_file$dateofdeath_unix <- ch_unix_time(n = n)
data_file$dateofdeath <- as.Date(as.POSIXct(data_file$dateofdeath_unix, origin="1970-01-01"))
data_file$sex_id <- ch_integer(n = n, min = 0, max = 2)
data_file$race_id <- ch_integer(n = n, min = 0, max = 7)
data_file$ethnicity_id <- ch_integer(n = n, min = 0, max = 1)
data_file$education_id <- ch_integer(n = n, min = 0, max = 6)
data_file$manner_of_death_id <- ch_integer(n = n, min= 0, max = 11)
data_file$county_id <- ch_integer(n = n, min = 1, max = 159)

counties <- data.frame(county_label = getGeorgiaCountyList()) %>% 
  rowid_to_column('county_id')

summary(counties)

data_file_complete <- data_file %>% 
  left_join(genFakeManner(), by = 'manner_of_death_id') %>% 
  left_join(genFakeEth(),by =  'ethnicity_id') %>% 
  left_join(genFakeEducation(),by =  'education_id') %>% 
  left_join(genFakeRace(), by = 'race_id') %>% 
  left_join(genFakeSex(), by = 'sex_id') %>% 
  left_join(counties, by = 'county_id')

data_file_complete %>% write.csv('data/data.csv')

data_file_complete %>% head()

data_file_complete$dateofdeath %>% summary()

genFakeManner <- function(){
  manner_of_death_label <- c(
    'Hanging',
    'Pesticide',
    'Drug Overdose',
    'Carbon Monoxide',
    'Other Toxin',
    'Firearm',
    'Drowning',
    'Fasting & Dehydration',
    'Transportation',
    'Electrocution',
    'Fire',
    'Uknown'
  )
  
  output <- data.frame(manner_of_death_label = manner_of_death_label, manner_of_death_id = 0:11)
}

genFakeEducation <- function(){
  education_label <- c('Did Not Complete High School',
    'High School Graduate',
    'Some College',
    'Associates Degree',
    'Bachelor\'s Degree',
    'Advanced Degree',
    'Unknown')
  
  output <- data.frame(eduction_label = education_label, education_id = 0:6)
}

genFakeSex <- function(){
  sex_label <- c('Male', 'Female', 'Other')
  output <- data.frame(sex_label = sex_label, sex_id = 0:2)
}

genFakeRace <- function(){
  race_label <- c('White',
                  'Black',
                  'American Indian / Alaskan Native',
                  'Asian',
                  'Hawaiian Native & Pacific Islanders',
                  'Other',
                  '2 Or More Races',
                  'Unknown')d
  
  output <- data.frame(race_label = race_label, race_id = 0:7)
  
}

genFakeEth <- function(){
  ethnicity_label <- c('Hispanic', 'Non-Hispanic')
  
  output <- data.frame(ethnicity_label = ethnicity_label, ethnicity_id = 0:1)
}
