## Este scritp baixa dos dados referent ao PPBio do DataOne via dataone R pckg |
## Code to download PPBIO data from DataOne via dataone R pckg
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
## Dowload data : 21 October 2022

library(dataone)
library(datapack)
library(EML)
library(tidyverse)
library(XML)
library(datapack)
library(uuid)

cn = CNode("PROD")
d1c = getMNode(cn, 'urn:node:PPBIO')

# Ask for the id, title and abstract
queryParams = list(q="ppbio", fl="id,title,abstract,author,beginDate, endDate, attribute, attributeName", rows='2000') 
result = query(d1c, solrQuery=queryParams, as="data.frame", parse=FALSE)

write_csv(result, "data-raw/dataOne/ppbio_raw/ppbio_dataone_Rpckg.csv") # Need more cleanning