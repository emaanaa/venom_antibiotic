library(readxl)
library(tidyverse)
excel_sheets(venom_source_data.xlsx)
day2 <- read_excel("venom_source_data.xlsx", sheet = "Figure 4c_day 2")
day4 <- read_excel("venom_source_data.xlsx", sheet = "Figure 4c_day 4")

library(readxl)
library(tidyverse)

excel_sheets("venom_source_data.xlsx")
day2 <- read_excel("venom_source_data.xlsx", sheet = "Figure 4c_day 2")
day4 <- read_excel("venom_source_data.xlsx", sheet = "Figure 4c_day 4")
glimpse(day2)
library(readxl)
library(tidyverse)
day4_long <- day4 %>%
  pivot_longer(cols = -1, names_to = "Group",
               values_to = "CFU")
library(readxl)
day4 <- read_excel("venom_source_data.xlsx", sheet = "Figure 4c_day 4")
library(tidyverse)
day4_long <- day4 %>%
  pivot_longer(cols = -1, names_to = "Group",
               values_to = "CFU")
day4_long <- day4 %>%
  mutate(across(-1, as.character)) %>%
  pivot_longer(
    cols = -1,
    names_to = "GROUP",
    values_to = "CFU"
  ) %>% 
  mutate(CFU = as.numeric(CFU))

day4_long <- day4_long %>%
  rename(day = ...1)%>%
  mutate(GROUP = str_remove(GROUP, "\\.\\.\\.d+$"))
 day4_long <- day4_long %>%
   rename(group = GROUP, cfu = CFU)
 day4_long <- day4_long %>%
   mutate(group = str_remove(group, "\\.\\.\\.\\d+$"))
mouse_data <- bind_rows(day2_long, day4_long) 
ggplot(mouse_data, aes(x= group, y= cfu, fill = group)) + geom_boxplot() + scale_y_log10() + facet_wrap(~ day) + labs(title = "Bacterial Burden by Treatment Group", x = NULL, y = "CFU") + theme(axis.text.x = element_text(angle = 45, hjust = 1))
day2_test <- t.test(cfu~ group, data = mouse_data %>% filter(day== "Day 2", group %in% c("Control", "UniprotKB-7")))

day2_test