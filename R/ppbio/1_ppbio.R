library(dataone)
library(datapack)
library(EML)
library(tidyverse)
library(XML)
library(datapack)
library(uuid)
library(textreadr)
library(dplyr)
library(janitor)
library(xml2)
library(XML)
library(stringr)
library(taxlist)

###############

## From DataOne

cn = CNode("PROD")
d1c = getMNode(cn, 'urn:node:PPBIO')

# Ask for the id, title and abstract
queryParams = list(q="ppbio", fl="id,title,abstract,author,beginDate, endDate, attribute, attributeName", rows='2000') 
result = query(d1c, solrQuery=queryParams, as="data.frame", parse=FALSE)

# write_csv(result, "data-raw/ppbio_raw/ppbio_dataone.csv") # Need more cleanning 


################
## From folder

ppbio_f = read_dir("data-raw/ppbio_raw/Metacat/documents from metacat 02062022")

ppbio_f = tibble::as_tibble(ppbio_f)

ppbio_datmerged_1 = ppbio_f |> 
  dplyr::group_by(document) |> 
  dplyr::summarise(content = paste(content, collapse = " "))
print(head(ppbio_datmerged_1))

# Sequential files like dias.35.2 dias.35.3 dias.35.4 ....... are the same dataset with the highest number being the most recent, so you can delete the older versions

## Amorin dataset


amorim = ppbio_datmerged_1 |> 
  filter(str_detect(document, '^amorim')) |> 
  arrange(desc(document)) 

## Autogen 

autogen = ppbio_datmerged_1 |> 
  filter(str_detect(document, '^autogen')) |> 
  arrange(desc(document)) 

## David

david = ppbio_datmerged_1 |> 
  filter(str_detect(document, '^david')) |> 
  arrange(desc(document)) 

## Dias 

dias = ppbio_datmerged_1 |> 
  filter(str_detect(document, '^dias')) |> 
  arrange(desc(document)) |> 
  filter(document %in% c("dias_36_3", "dias_35_7", "dias_32_3" )) 

## Druker 

drucker = ppbio_datmerged_1 |> 
  filter(str_detect(document, '^drucker')) |> 
  arrange(desc(document)) |> 
  filter(document == "drucker_3_11")

## Fecosta dataset

fecosta = ppbio_datmerged_1 |> 
  filter(str_detect(document, '^fecosta')) |> 
  arrange(desc(document)) |> 
  filter((document %in% c("fecosta_4_5", "fecosta_10_8", "fecosta_11_3", "fecosta_12_7", "fecosta_13_3", "fecosta_14_6", "fecosta_141_1", "fecosta_143_18", "fecosta_16_12", "fecosta_17_9", "fecosta_185_6", "fecosta_186_5", "fecosta_187_13", "fecosta_188_4", "fecosta_194_3", "fecosta_197_4", "fecosta_207_9", "fecosta_236_15", "fecosta_240_8", "fecosta_245_4", "fecosta_247_4", "fecosta_25_2", "fecosta_26_8", "fecosta_31_3", "fecosta_34_3", "fecosta_4_5", "fecosta_41_3", "fecosta_42_9", "fecosta_44_2", "fecosta_45_5", "fecosta_46_7", "fecosta_47_3", "fecosta_48_2", "fecosta_50_3", "fecosta_55_4", "fecosta_62_11", "fecosta_69_4", "fecosta_70_7", "fecosta_95_10")))


fernanda_costa = ppbio_datmerged_1 |> 
  filter(str_detect(document, '^fernanda_costa_5_5'))

# J scientist 

jscientist = ppbio_datmerged_1 |> 
  filter(str_detect(document, "^jscientist_7_2"))

#kamelgaco

kamelgaco = ppbio_datmerged_1 |> 
  filter(str_detect(document, "^kamelgaco")) |> 
  arrange(desc(document)) |> 
  filter((document %in% c("kamelgaco_5_1", "kamelgaco_6_9", "kamelgaco_8_12", "kamelgaco_9_2")))


#  liliandias

liliandias = ppbio_datmerged_1 |> 
  filter(str_detect(document,"^liliandias")) |>  
  arrange(desc(document)) |> 
  filter((document %in% c("liliandias_98_3", "liliandias_97_3", "liliandias_96_3", "liliandias_95_3", "liliandias_94_4", "liliandias_93_4", "liliandias_92_4", "liliandias_91_3", "liliandias_9_7", "liliandias_87_2", "liliandias_82_6", "liliandias_79_2", "liliandias_77_2", "liliandias_75_2", "liliandias_72_2", "liliandias_63_4", "liliandias_61_6", "liliandias_57_2", "liliandias_51_6", "liliandias_48_3", "liliandias_42_2","liliandias_4_5", "liliandias_38_2", "liliandias_36_6", "liliandias_33_6", "liliandias_17_4",  "liliandias_16_5", "liliandias_15_4", "liliandias_140_2", "liliandias_14_4", "liliandias_139_2", "liliandias_138_2", "liliandias_137_2", "liliandias_136_2", "liliandias_135_2", "liliandias_134_2", "liliandias_133_2", "liliandias_132_2", "liliandias_131_2", "liliandias_130_2", "liliandias_13_4", "liliandias_129_2", "liliandias_128_2", "liliandias_126_2", "liliandias_125_2", "liliandias_124_2", "liliandias_123_2", "liliandias_122_2", "liliandias_121_2", "liliandias_120_2", "liliandias_12_4", "liliandias_119_2", "liliandias_118_2", "liliandias_117_2", "liliandias_116_2", "liliandias_115_2", "liliandias_114_2", "liliandias_113_2", "liliandias_112_2", "liliandias_111_2", "liliandias_110_2", "liliandias_11_6", "liliandias_109_2", "liliandias_108_2", "liliandias_107_2", "liliandias_104_3", "liliandias_103_3", "liliandias_102_3", "liliandias_101_3", "liliandias_100_3", "liliandias_10_5")))


