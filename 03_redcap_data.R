# REDCap data pull

library(tidyverse)
library(janitor)
library(here)
library(flextable)
library(labelled)
library(rmarkdown)
library(REDCapTidieR)

key <- Sys.getenv("REDCAP_FATIGUE_SURVEY_KEY")
redcap_url  <-  "https://redcapproduction.umms.med.umich.edu/api/"

datfr <- read_redcap(redcap_uri = redcap_url, token = key)

datfr %>% 
  rmarkdown::paged_table()

datfr |> 
  make_labelled() %>% 
  bind_tibbles() 

saveRDS(demographics, file = here("demographics.Rd"))
saveRDS(crohns_disease_fatigue_assessment, file = here("cd_fatigue.Rd"))
saveRDS(ulcerative_colitis_fatigue_assessment, file = here("uc_fatigue.Rd"))