## Este scritp ....  |
## Code to download PPBIO data from ebird
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
## Dowload data : 26 October 2022

library(data.table)
library(readr)

dataone = read_csv("data/DataOne/Version_DataOe.csv")

gbif = read_csv("data/gbif/gbif_bind.csv")

splink = read_csv("data/speciesLink/splink_bind.csv")

jabot = read_csv("data/JABOT/jabot_PP_final.csv")

inat = read_csv("data/iNaturalist/inat_bind_final.csv")

####### Merge all... need to standardized cluns 

all = bind_rows(list(dataone,gbif, splink,jabot, inat))
