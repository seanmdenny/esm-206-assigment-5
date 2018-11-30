# Load necessary packages

library(tidyverse)

# Load necessary data

phd_salary <- read_csv('Median salary for doctoral recipients.csv')

# Reformat phd_salary dataframe

phd_salary_employment <- phd_salary %>% 
  select(field, employment.male, employment.female) %>% 
  rename(male = employment.male,
         female = employment.female) %>% 
  gather(key = sex, value = employment, 2:3)

phd_salary_postdoc <- phd_salary %>% 
  select(field, postdoc.male, postdoc.female) %>%
  rename(male = postdoc.male,
         female = postdoc.female) %>% 
  gather(key = sex, value = postdoc, 2:3)

phd_salary2 <- full_join(phd_salary_employment, phd_salary_postdoc,
                         by = c('field', 'sex'))