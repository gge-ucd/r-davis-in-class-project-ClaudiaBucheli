library(tidyverse)
library(lubridate)







mloa <-read_csv("https://raw.githubusercontent.com/gge-ucd/R-Davis/master/data/mauna_loa_met_2001_minute.csv")


mloa1 <- mloa %>% 
  filter(rel_humid != -99) %>% 
  filter(temp_C_2m != -999.99) %>% 
  filter(windSpeed_m_s !=-999.99) %>% 
  mutate(datetime = ymd_hm(paste0("year", "-", "month", "-", "day","-","hour24", ":",
                                  "min", ":"),tz="UTC")) %>%
  mutate(datetimeLocal = with_tz(datetime,tz = "Pacific/Honolulu"))

  
         