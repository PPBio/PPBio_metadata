## Este scritp ....  |
## Code to download PPBIO data from ebird
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
## Dowload data : 26 October 2022

library(data.table)
library(ggplot2)
library(readr)

all = read_csv("data/all_merged.csv")

databases = all |> 
  