########################################################################
## Este scritp baixa dos dados refernte ao PPBio da base Inaturalist
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
## Dowload data : 19 October 2022
########################################################################

library(rinat)
library(readr)

ppbio_inat = rinat::get_inat_obs(query = "PPBio")

readr::write_csv(ppbio_inat, "data-raw/iNaturalist/ppbio/ppbio_inat.csv")


peld_inat = rinat::get_inat_obs(query = "PELD")


readr::write_csv(peld_inat, "data-raw/iNaturalist/peld/peld_inat.csv")

