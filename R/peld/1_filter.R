

library(textreadr)
library(dplyr)
library(tidyverse)
library(janitor)
library(xml2)
library(XML)

## 1
peld_1 <- read_dir("data-raw/peld_raw/Documents/")

peld_1 <- tibble::as_tibble(peld_1)

peld_datmerged_1 <- peld_1 |> 
  dplyr::group_by(document) |> 
  dplyr::summarise(content = paste(content, collapse = " "))
  print(head(peld_datmerged_1))
  
## dias dataset

dias <- peld_datmerged_1 |> 
  filter(str_detect(document, '^dias')) |> 
  arrange(desc(document)) |> 
  filter(document %in% c("dias_36_3", "dias_35_7", "dias_32_3" )) 
  
## Not work because it's not a html, it's a xml... dias_final <- stringi::stri_extract_all_regex(str = dias$content, pattern = "[0-9]+") %>%
#   unlist %>%
#   matrix(ncol = 5, byrow = T) %>%
#   data.frame %>%
#   setNames(c("title", "creator id", "givenName", "surName", "organizationName")) %>%
#   bind_cols(dias["document"], .)
 

## drucker dataset

drucker <- peld_datmerged_1 |> 
  filter(str_detect(document, '^drucker')) |> 
  arrange(desc(document)) |> 
  filter(document == "drucker_3_10")

## fecosta dataset

fecosta <- peld_datmerged_1 |> 
  filter(str_detect(document, '^fecosta')) |> 
  arrange(desc(document)) |> 
  filter((document %in% c("10_8", "fecosta_11_3", "fecosta_12_7", "fecosta_13_3", "fecosta_14_6", "fecosta_141_1", "fecosta_143_18", "fecosta_16_12", "fecosta_17_9", "fecosta_185_6", "fecosta_186_5", "fecosta_187_13", "fecosta_188_4", "fecosta_194_3", "fecosta_197_4", "fecosta_207_9", "fecosta_236_15", "fecosta_240_8", "fecosta_245_4", "fecosta_247_4", "fecosta_25_2", "fecosta_26_8", "fecosta_31_2", "fecosta_34_3", "fecosta_4_5", "fecosta_41_3", "fecosta_42_9", "fecosta_44_2", "fecosta_45_17", "fecosta_46_7", "fecosta_47_3", "fecosta_48_2", "fecosta_50_3", "fecosta_55_3", "fecosta_62_11", "fecosta_69_4", "fecosta_70_7", "fecosta_94_1", "fecosta_95_10")))

## Bind

Bind_all<- bind_rows(dias, drucker, fecosta)
dim(Bind_all) 

# separate column
#ncols <- max(stringr::str_count(Bind_all$content, ",")) + 1
#colll <- cbind(Bind_all, stringr::str_split_fixed(Bind_all$content, ",", ncols))

final_test_1 <- separate(data = Bind_all, col = content, into = c("1", "2","3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"), sep = "\\>")

final_t2 <- janitor::clean_names(final_test_1)
