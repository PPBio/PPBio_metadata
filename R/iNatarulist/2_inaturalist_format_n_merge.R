########################################################################
## Este scritp formata os dados PELD e PPBio baixados da base Inaturalist |
## Code to format PELD and PPBIO data downloaded from iNaturalist
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
## Dowload data : 26 October 2022
########################################################################

library(data.table)
library(dplyr)
library(readr)

##### PELD

peld_inat = data.table::fread("data-raw/iNaturalist/peld/peld_inat.csv")

ppbio_inat = data.table::fread("data-raw/iNaturalist/ppbio/ppbio_inat.csv")

inat_bind = bind_rows(list(peld_inat, ppbio_inat)) 


write_csv(inat_bind, "data/iNaturalist/inat_bind.csv")

