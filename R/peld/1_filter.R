

library(textreadr)
library(dplyr)

library(tidyverse)

## 1
peld_1 <- read_dir("data-raw/peld_raw/Documents/")

peld_1 <- tibble::as_tibble(test_1)

peld_datmerged_1 <- peld_1 |> 
  dplyr::group_by(document) |> 
  dplyr::summarise(content = paste(content, collapse = ","))
  print(head(peld_datmerged_1))
  
## 2 

dias <- peld_datmerged_1 |> 
  filter(str_detect(document, '^dias'))
    
