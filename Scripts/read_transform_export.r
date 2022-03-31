library(tidyverse)
library(readxl)
library(ggplot2)
getwd()

xlfile <- file.path("Data", "results_and_targets.xlsx")

df <- read_xlsx(xlfile) %>% select(-starts_with("ach_"), -positivity, -prep_linkage, -tx_linkage) %>%
  mutate(across(where(is.numeric), round, 0)) %>%
glimpse()

targets <- df %>% select(-gender, -hiv_tests, -positive_test_results, -negative_test_results, -prep_initiations, -treatment_initiations) %>% 
  pivot_longer(contains("target"), names_to = "indicator", values_to = "targets") %>%
  mutate(indicator = recode(indicator, "target_prep" = "PrEP initiations",
                            "target_test" = "HIV tests",
                            "target_test_pos" = "Positive HIV tests",
                            "target_treatment" = "Treatment initiations"),
         region = paste0(region, " Region")) %>%
  group_by(year, region, indicator) %>% summarise(targets = sum(targets)) %>%
  glimpse()

table(targets$indicator, targets$year)
targets %>% ggplot2::ggplot(aes(x = indicator, y = targets, fill=indicator)) + geom_col() + facet_grid(region ~ year)

help("facet_grid")


dest_results <- file.path("Dataout","results.csv")
dest_targets <- file.path("Dataout","targets.csv")  
  
  
write.csv(results, dest_results)
write.csv(targets, dest_targets)