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

# ## From DataOne
# 
# cn = CNode("PROD")
# d1c = getMNode(cn, 'urn:node:PPBIO')
# 
# # Ask for the id, title and abstract
# queryParams = list(q="ppbio", fl="id,title,abstract,author,beginDate, endDate, attribute, attributeName", rows='2000') 
# result = query(d1c, solrQuery=queryParams, as="data.frame", parse=FALSE)
# 
# # write_csv(result, "data-raw/ppbio_raw/ppbio_dataone.csv") # Need more cleanning 


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
  filter((document %in% c("liliandias_4_2","liliandias_98_3", "liliandias_97_3", "liliandias_96_3", "liliandias_95_3", "liliandias_94_4", "liliandias_93_4", "liliandias_92_4", "liliandias_91_3", "liliandias_9_7", "liliandias_87_2", "liliandias_82_6", "liliandias_79_2", "liliandias_77_2", "liliandias_75_2", "liliandias_72_2", "liliandias_63_4", "liliandias_61_6", "liliandias_57_2", "liliandias_51_6", "liliandias_48_3", "liliandias_42_2","liliandias_4_5", "liliandias_38_2", "liliandias_36_6", "liliandias_33_6", "liliandias_17_4",  "liliandias_16_5", "liliandias_15_5", "liliandias_140_3", "liliandias_14_5", "liliandias_139_3", "liliandias_138_3", "liliandias_137_3", "liliandias_136_3", "liliandias_135_3", "liliandias_134_3", "liliandias_133_4", "liliandias_132_3", "liliandias_131_4", "liliandias_130_3", "liliandias_13_5", "liliandias_129_3", "liliandias_128_3", "liliandias_126_3", "liliandias_125_3", "liliandias_124_3", "liliandias_123_3", "liliandias_122_3", "liliandias_121_3", "liliandias_120_3", "liliandias_12_5", "liliandias_119_3", "liliandias_118_3", "liliandias_117_3", "liliandias_116_3", "liliandias_115_3", "liliandias_114_3", "liliandias_113_3", "liliandias_112_3", "liliandias_111_3", "liliandias_110_3", "liliandias_11_7", "liliandias_109_3", "liliandias_108_3", "liliandias_107_3", "liliandias_104_4", "liliandias_103_4", "liliandias_102_4", "liliandias_101_4", "liliandias_100_4", "liliandias_10_6")))

# melo

melo = ppbio_datmerged_1 |> 
  filter(str_detect(document,"^melo")) |>  
  arrange(desc(document)) |> 
  filter((document %in% c("melo_3_2","melo_95_10", "melo_94_9","melo_92_13", "melo_91_3", "melo_8_2", "melo_79_4", "melo_75_8", "melo_74_9", "melo_72_2", "melo_70_13", "melo_68_19", "melo_66_7", "melo_65_11", "melo_64_8", "melo_62_10", "melo_59_3", "melo_58_13", "melo_55_12", "melo_52_15", "melo_48_15", "melo_46_1", "melo_45_42", "melo_44_8", "melo_43_16", "melo_37_22", "melo_33_18", "melo_30_13", "melo_26_2", "melo_24_2", "melo_22_2", "melo_15_6", "melo_134_7", "melo_133_5", "melo_129_12", "melo_121_6", "melo_116_4", "melo_114_1", "melo_109_5", "melo_108_4", "melo_106_2", "melo_104_2", "melo_103_16", "melo_102_15")))



Bind_all = bind_rows(amorim, autogen, david, dias, drucker, fecosta, fernanda_costa, jscientist, kamelgaco, liliandias, melo)

B_t = Bind_all |> 
tidyr::separate(content, into= paste0('Chr', 1:30), sep = '[<>]' )

B_t_2 = Bind_all |> 
  tidyr::separate(content, into= paste0('Chr', 1:30), sep = '=' )

# Bind_all[c('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '24', '25', '26', '27', '28', '29','30')] <- str_split_fixed(Bind_all$content, ' >', 31)

rm(Bind_all)

# menger

menger = peld_datmerged_1 |> 
  filter(str_detect(document,"^menger")) |>  
  arrange(desc(document)) |> 
  filter((document %in% c("menger_99_1", "menger_98_2", "menger_95_1", "menger_93_1", "menger_91_4", "menger_91_3", "menger_90_3", "menger_89_1", "menger_87_3", "menger_86_5", "menger_82_4", "menger_78_3", "menger_76_4", "menger_74_1", "menger_71_4", "menger_70_3", "menger_7_9"ok, "menger_68_3", "menger_64_2", "menger_62_3", "menger_60_3", "menger_58_2", "menger_56_1", "menger_54_2", "menger_53_1", "menger_52_2", "menger_51_1", "menger_50_2", "menger_48_2", "menger_46_4", "menger_45_3", "menger_441_2", "menger_439_2", "menger_438_1", "menger_437_4", "menger_435_6", "menger_434_4", "menger_422_2", "menger_421_3", "menger_420_2", "menger_416_3", "menger_41_5", "menger_39_4", "menger_37_3", "menger_368_2", "menger_366_2", "menger_365_3", "menger_364_1", "menger_362_3", "menger_361_2", "menger_360_3" ,"menger_36_3"ok, "menger_358_3", "menger_357_2", "menger_356_4" ,"menger_352_2", "menger_35_3"ok, "menger_347_2", "menger_346_5", "menger_344_2", "menger_340_2", "menger_337_1", "menger_335_2", "menger_333_3", "menger_332_3", "menger_331_3", "menger_33_10"ok, "menger_328_2", "menger_327_3", "menger_325_1", "menger_322_3", "menger_321_3", "menger_320_2", "menger_32_1"ok, "menger_318_3", "menger_316_3", "menger_315_3", "menger_314_2", "menger_312_2", "menger_311_3", "menger_310_2", "menger_31_2"ok, "menger_309_2", "menger_308_4", "menger_307_4", "menger_306_5", "menger_305_4", "menger_304_4", "menger_303_3", "menger_302_4", "menger_301_3", "menger_300_4", "menger_3_6"ok, "menger_299_3", "menger_298_3", "menger_297_3", "menger_296_2", "menger_295_2", "menger_294_3", "menger_293_4", "menger_292_2", "menger_291_2", "menger_290_3", "menger_289_3", "menger_288_2", "menger_287_2", "menger_286_2", "menger_285_2", "menger_284_2", "menger_283_2", "menger_282_2", "menger_281_2", "menger_280_2", "menger_28_8"ok, "menger_279_3", "menger_278_3", "menger_276_3", "menger_275_2", "menger_274_5", "menger_273_1", "menger_272_2", "menger_271_3", "menger_270_3", "menger_269_1", "menger_268_3", "menger_265_2", "menger_262_2", "menger_255_1", "menger_254_2", "menger_253_3", "menger_252_2", "menger_251_1", "menger_248_4", "menger_247_2", "menger_245_2", "menger_244_5", "menger_243_2", "menger_242_3", "menger_241_3", "menger_240_1", "menger_24_7"ok, "menger_239_3", "menger_238_2", "menger_237_3", "menger_233_2", "menger_230_5", "menger_229_1", "menger_226_7", "menger_225_7", "menger_224_1", "menger_223_1", "menger_222_2", "menger_220_2", "menger_219_1", "menger_218_1", "menger_216_3", "menger_215_1", "menger_213_1", "menger_211_2", "menger_210_7", "menger_208_1", "menger_206_8", "menger_205_2", "menger_203_14", "menger_199_1", "menger_197_2", "menger_194_2", "menger_192_1", "menger_190_1", "menger_19_7"ok, "menger_187_1", "menger_185_4", "menger_184_1", "menger_183_3", "menger_182_1", "menger_180_2", "menger_18_12"ok, "menger_179_1", "menger_177_1", "menger_174_3", "menger_173_2", "menger_170_2", "menger_17_4"ok, "menger_165_1", "menger_163_5", "menger_16_3"ok, "menger_156_3", "menger_155_3", "menger_153_6", "menger_151_2", "menger_149_6", "menger_145_2", "menger_143_1", "menger_142_2", "menger_141_1", "menger_140_1", "menger_139_1", "menger_138_2", "menger_132_1", "menger_131_1", "menger_130_1", "menger_129_1", "menger_128_6", "menger_126_3", "menger_125_5", "menger_124_2", "menger_123_1", "menger_122_9", "menger_119_5", "menger_117_5", "menger_115_2", "menger_113_3", "menger_108_3", "menger_107_1", "menger_106_2", "menger_105_3", "menger_104_1", "menger_103_2", "menger_102_2", "menger_101_2", "menger_100_2")))