
library(dplyr)
library(stringr)

metadata_all = c("costa_1_1", "costa_1_2", "costa_1_3", "costa_13_12", "costa_13_13", "silva_2_11", "silva_2_12", "silva_2_13", "silva_13_10", "silva_13_13", "souza_190_10", "souza_190_11", "souza_190_13", "souza_191_1", "souza_191_13")

metadata_all= as.data.frame(metadata_all)

metadata_all

costa = metadata_all |> 
  filter(str_detect(metadata_all,"^costa")) |>  
  arrange(desc(metadata_all)) |> 
  filter((metadata_all %in% c("costa_1_3", "costa_13_13"))) # Selecionando os datasets mais atuais de Costa. 

silva = metadata_all |> 
  filter(str_detect(metadata_all,"^silva")) |>  
  arrange(desc(metadata_all)) |> 
  filter((metadata_all %in% c("silva_2_13", "silva_13_13"))) # Selecionando os datasets mais atuais de Silva 

souza = metadata_all |> 
  filter(str_detect(metadata_all,"^souza")) |>  
  arrange(desc(metadata_all)) |> 
  filter((metadata_all %in% c("souza_190_13", "souza_191_13"))) # Selecionando os datasets mais atuais de Souza 


Bind_all = bind_rows(costa, silva, souza) 
Bind_all