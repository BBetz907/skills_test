library(tidyverse)
library(readxl)
library(ggplot2)
getwd()

xlfile <- file.path("Data", "results_and_targets.xlsx")

df <- read_xlsx(xlfile) %>% select(-starts_with("ach_"), -positivity, -prep_linkage, -tx_linkage) %>%
  mutate(across(where(is.numeric), round, 0)) %>%
glimpse()


results_long <- df %>% select(-starts_with("target_")) %>% 
  pivot_longer(hiv_tests:prep_initiations, names_to = "indicator", values_to = "results") %>%
  # mutate(indicator = recode(indicator, "target_prep" = "PrEP initiations",
  #                           "target_test" = "HIV tests",
  #                           "target_test_pos" = "Positive HIV tests",
  #                           "target_treatment" = "Treatment initiations")) %>%
  group_by(year, gender, region, indicator) %>% summarise(results = sum(results, na.rm = TRUE)) %>%
  glimpse()
table(results_long$indicator)
results_long %>% filter(indicator %in% c("hiv_tests", "positive_test_results", "treatment_initiations")) %>% ggplot2::ggplot(aes(x = indicator, y = results, fill = region)) + geom_col() + facet_wrap(region ~ year, nrow = 5)

results
targets 

results <- results_long %>% pivot_wider(names_from = indicator, values_from = results) 

results %>% ggplot2::ggplot(aes(x = year, y = hiv_tests , fill=gender)) + geom_col() + facet_wrap(gender ~ region, nrow = 2)


targets <- df %>% select(-gender, -hiv_tests, -positive_test_results, -negative_test_results, -prep_initiations, -treatment_initiations) %>% 
  pivot_longer(contains("target"), names_to = "indicator", values_to = "targets") %>%
  mutate(indicator = recode(indicator, "target_prep" = "prep_initiations",
                            "target_test" = "hiv_tests",
                            "target_test_pos" = "positive_hiv_tests",
                            "target_treatment" = "treatment_initiations"),
         region = paste0(region, " Region")) %>%
  group_by(year, region, indicator) %>% summarise(targets = sum(targets, na.rm=TRUE)) %>%
  mutate(targets = round(targets*runif(1, 0.9, 1.5)), #multiply targets by random number to re-align with results
         targets = ifelse(region=="Central Region" & year == 2022 & indicator == "hiv_tests", 0, targets)) %>% #recode 1 value
  glimpse()



help("case_when")

table(targets$indicator, targets$region)
list(unique(results_long$indicator))

targets %>% ggplot2::ggplot(aes(x = indicator, y = targets, fill=indicator)) + geom_col() + facet_grid(region ~ year)

help("facet_grid")


dest_results <- file.path("Dataout","results.csv")
dest_targets <- file.path("Dataout","targets.csv")  
  
  
write_csv(results, dest_results)
write_csv(targets, dest_targets)



#1. PEPFAR data often come with results and targets, but sometimes they come in separate files with slightly different structures. Merge these two data sources so that for every indicator, we can calculate % achievement (results/targets). (Hint: you may need to reshape one or more data sets and possibly recode values of a string variable). What challenges do you experience in combining results and targets data sets? 


#Using the merged data: What was the percent achievement for the indicator HTS_TST_POS during the year 2021 in Central Region? Create a table to show percent achievement for this indicator and region from 2021 to 2023.

#What type of visuals would  you consider using if you wanted to compare achievement for multiple indicators, across multiple years? Bonus if you can create and include such a visual here.


#Create a chart or two to show how HTS_TST_POS achievement changed from FY20 to FY22 at the national level (i.e. irrespective of region). (You may choose to visualize only achievement or your could consider visualizing achievement and indicator results and/or targets.) What types of charts are well-suited for this task of showing trends?

# comparison - male to female