library(textreadr)
library(dplyr)
library(tidyverse)
library(janitor)
library(xml2)
library(XML)
library(stringr)
library(taxlist)

## 1
peld_1 = read_dir("data-raw/peld_raw/Documents/")

peld_1 = tibble::as_tibble(peld_1)

peld_datmerged_1 = peld_1 |> 
  dplyr::group_by(document) |> 
  dplyr::summarise(content = paste(content, collapse = " "))
  print(head(peld_datmerged_1))

# Sequential files like dias.35.2 dias.35.3 dias.35.4 ....... are the same dataset with the highest number being the most recent, so you can delete the older versions
  
## dias dataset

dias = peld_datmerged_1 |> 
  filter(str_detect(document, '^dias')) |> 
  arrange(desc(document)) |> 
  filter(document %in% c("dias_36_3", "dias_35_7", "dias_32_3" )) 
  
#  Not work because it's not a html, it's a xml... 
# dias_final <- stringi::stri_extract_all_regex(str =#dias$content, pattern = "[0-9]+") %>%
#   unlist %>%
#   matrix(ncol = 5, byrow = T) %>%
#   data.frame %>%
#   setNames(c("title", "creator id", "givenName", "surName", "organizationName")) %>%
#   bind_cols(dias["document"], .)
 

## drucker dataset

drucker = peld_datmerged_1 |> 
  filter(str_detect(document, '^drucker')) |> 
  arrange(desc(document)) |> 
  filter(document == "drucker_3_10")

## fecosta dataset

fecosta = peld_datmerged_1 |> 
  filter(str_detect(document, '^fecosta')) |> 
  arrange(desc(document)) |> 
  filter((document %in% c("10_8", "fecosta_11_3", "fecosta_12_7", "fecosta_13_3", "fecosta_14_6", "fecosta_141_1", "fecosta_143_18", "fecosta_16_12", "fecosta_17_9", "fecosta_185_6", "fecosta_186_5", "fecosta_187_13", "fecosta_188_4", "fecosta_194_3", "fecosta_197_4", "fecosta_207_9", "fecosta_236_15", "fecosta_240_8", "fecosta_245_4", "fecosta_247_4", "fecosta_25_2", "fecosta_26_8", "fecosta_31_2", "fecosta_34_3", "fecosta_4_5", "fecosta_41_3", "fecosta_42_9", "fecosta_44_2", "fecosta_45_17", "fecosta_46_7", "fecosta_47_3", "fecosta_48_2", "fecosta_50_3", "fecosta_55_3", "fecosta_62_11", "fecosta_69_4", "fecosta_70_7", "fecosta_94_1", "fecosta_95_10")))


fernanda_costa = peld_datmerged_1 |> 
  filter(str_detect(document, '^fernanda_costa_5_5'))

# J scientist 

jscientist = peld_datmerged_1 |> 
  filter(str_detect(document, "^jscientist_7_2"))

#kamelgaco

kamelgaco = peld_datmerged_1 |> 
    filter(str_detect(document, "^kamelgaco")) |> 
    arrange(desc(document)) |> 
    filter((document %in% c("kamelgaco_5_1", "kamelgaco_6_9", "kamelgaco_8_12", "kamelgaco_9_2")))
  


#  liliandias

liliandias = peld_datmerged_1 |> 
  filter(str_detect(document,"^liliandias")) |>  
  arrange(desc(document)) |> 
  filter((document %in% c("liliandias_98_2", "liliandias_97_2", "liliandias_97_2", "liliandias_96_2", "liliandias_95_2", "liliandias_94_3", "liliandias_93_3", "liliandias_92_3", "liliandias_91_1", "liliandias_9_2", "liliandias_87_1", "liliandias_82_1", "liliandias_79_1", "liliandias_77_1", "liliandias_75_1", "liliandias_72_1", "liliandias_63_2", "liliandias_61_2", "liliandias_57_1", "liliandias_51_2", "liliandias_48_1", "liliandias_42_1","liliandias_4_2", "", "", "", "", "liliandias_38_1", "liliandias_36_5", "liliandias_33_5", "liliandias_17_3", "liliandias_164_2", "liliandias_163_2", "liliandias_162_2", "liliandias_161_2", "liliandias_16_4", "liliandias_159_2", "liliandias_158_2", "liliandias_157_2", "liliandias_156_2", "liliandias_155_2", "liliandias_154_2", "liliandias_153_2", "liliandias_15_4", "liliandias_148_2", "liliandias_140_2", "liliandias_14_4", "liliandias_139_2", "liliandias_138_2", "liliandias_137_2", "liliandias_136_2", "liliandias_135_2", "liliandias_134_2", "liliandias_133_2", "liliandias_132_2", "liliandias_131_2", "liliandias_130_2", "liliandias_13_4", "liliandias_129_2", "liliandias_128_2", "liliandias_126_2", "liliandias_125_2", "liliandias_124_2", "liliandias_123_2", "liliandias_122_2", "liliandias_121_2", "liliandias_120_2", "liliandias_12_4", "liliandias_119_2", "liliandias_118_2", "liliandias_117_2", "liliandias_116_2", "liliandias_115_2", "liliandias_114_2", "liliandias_113_2", "liliandias_112_2", "liliandias_111_2", "liliandias_110_2", "liliandias_11_6", "liliandias_109_2", "liliandias_108_2", "liliandias_107_2", "liliandias_104_3", "liliandias_103_3", "liliandias_102_3", "liliandias_101_3", "liliandias_100_3", "liliandias_10_5")))
  
  
# melo

melo = peld_datmerged_1 |> 
  filter(str_detect(document,"^melo")) |>  
  arrange(desc(document)) |> 
  filter((document %in% c("melo_95_10", "melo_94_8","melo_92_12", "melo_91_3", "melo_8_2", "melo_79_4", "melo_75_8", "melo_74_8", "melo_72_2", "melo_70_13", "melo_68_19", "melo_66_7", "melo_65_11", "melo_64_8", "melo_62_9", "melo_59_3", "melo_58_13", "melo_55_12", "melo_52_15", "melo_48_15", "melo_46_1", "melo_45_38", "melo_44_8", "melo_43_16", "melo_37_22", "melo_33_18", "melo_30_13", "melo_3_2", "melo_26_2", "melo_24_2", "melo_22_2", "melo_15_6", "melo_134_7", "melo_133_5", "melo_129_12", "melo_121_6", "melo_116_4", "melo_114_1", "melo_109_5", "melo_108_4", "melo_106_2", "melo_104_2", "melo_103_16", "melo_102_14")))
  

# menger

menger = peld_datmerged_1 |> 
  filter(str_detect(document,"^menger")) |>  
  arrange(desc(document)) |> 
  filter((document %in% c("menger_99_1", "menger_98_2", "menger_95_1", "menger_93_1", "menger_91_4", "menger_91_3", "menger_90_3", "menger_89_1", "menger_87_3", "menger_86_5", "menger_82_4", "menger_78_3", "menger_76_4", "menger_74_1", "menger_71_4", "menger_70_3", "menger_7_9", "menger_68_3", "menger_64_2", "menger_62_3", "menger_60_3", "menger_58_2", "menger_56_1", "menger_54_2", "menger_53_1", "menger_52_2", "menger_51_1", "menger_50_2", "menger_48_2", "menger_46_4", "menger_45_3", "menger_441_2", "menger_439_2", "menger_438_1", "menger_437_4", "menger_435_6", "menger_434_4", "menger_422_2", "menger_421_3", "menger_420_2", "menger_416_3", "menger_41_5", "menger_39_4", "menger_37_3", "menger_368_2", "menger_366_2", "menger_365_3", "menger_364_1", "menger_362_3", "menger_361_2", "menger_360_3" ,"menger_36_3", "menger_358_3", "menger_357_2", "menger_356_4" ,"menger_352_2", "menger_35_3", "menger_347_2", "menger_346_5", "menger_344_2", "menger_340_2", "menger_337_1", "menger_335_2", "menger_333_3", "menger_332_3", "menger_331_3", "menger_33_10", "menger_328_2", "menger_327_3", "menger_325_1", "menger_322_3", "menger_321_3", "menger_320_2", "menger_32_1", "menger_318_3", "menger_316_3", "menger_315_3", "menger_314_2", "menger_312_2", "menger_311_3", "menger_310_2", "menger_31_2", "menger_309_2", "menger_308_4", "menger_307_4", "menger_306_5", "menger_305_4", "menger_304_4", "menger_303_3", "menger_302_4", "menger_301_3", "menger_300_4", "menger_3_6", "menger_299_3", "menger_298_3", "menger_297_3", "menger_296_2", "menger_295_2", "menger_294_3", "menger_293_4", "menger_292_2", "menger_291_2", "menger_290_3", "menger_289_3", "menger_288_2", "menger_287_2", "menger_286_2", "menger_285_2", "menger_284_2", "menger_283_2", "menger_282_2", "menger_281_2", "menger_280_2", "menger_28_8", "menger_279_3", "menger_278_3", "menger_276_3", "menger_275_2", "menger_274_5", "menger_273_1", "menger_272_2", "menger_271_3", "menger_270_3", "menger_269_1", "menger_268_3", "menger_265_2", "menger_262_2", "menger_255_1", "menger_254_2", "menger_253_3", "menger_252_2", "menger_251_1", "menger_248_4", "menger_247_2", "menger_245_2", "menger_244_5", "menger_243_2", "menger_242_3", "menger_241_3", "menger_240_1", "menger_24_7", "menger_239_3", "menger_238_2", "menger_237_3", "menger_233_2", "menger_230_5", "menger_229_1", "menger_226_7", "menger_225_7", "menger_224_1", "menger_223_1", "menger_222_2", "menger_220_2", "menger_219_1", "menger_218_1", "menger_216_3", "menger_215_1", "menger_213_1", "menger_211_2", "menger_210_7", "menger_208_1", "menger_206_8", "menger_205_2", "menger_203_14", "menger_199_1", "menger_197_2", "menger_194_2", "menger_192_1", "menger_190_1", "menger_19_7", "menger_187_1", "menger_185_4", "menger_184_1", "menger_183_3", "menger_182_1", "menger_180_2", "menger_18_12", "menger_179_1", "menger_177_1", "menger_174_3", "menger_173_2", "menger_170_2", "menger_17_4", "menger_165_1", "menger_163_5", "menger_16_3", "menger_156_3", "menger_155_3", "menger_153_6", "menger_151_2", "menger_149_6", "menger_145_2", "menger_143_1", "menger_142_2", "menger_141_1", "menger_140_1", "menger_139_1", "menger_138_2", "menger_132_1", "menger_131_1", "menger_130_1", "menger_129_1", "menger_128_6", "menger_126_3", "menger_125_5", "menger_124_2", "menger_123_1", "menger_122_9", "menger_119_5", "menger_117_5", "menger_115_2", "menger_113_3", "menger_108_3", "menger_107_1", "menger_106_2", "menger_105_3", "menger_104_1", "menger_103_2", "menger_102_2", "menger_101_2", "menger_100_2")))
  
## Bind

Bind_all = bind_rows(dias, drucker, fecosta, fernanda_costa, jscientist, kamelgaco, liliandias, melo, menger)

dim(Bind_all) 

# separate column
#ncols = max(stringr::str_count(Bind_all$content, ",")) + 1
#colll = cbind(Bind_all, stringr::str_split_fixed(Bind_all$content, ",", ncols))

final_1 = separate(data = Bind_all, col = content, into = c("1", "2","3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"), sep = "\\>")  

final_2 = taxlist::clean_strings(final_1$`19`)

final_2 = tibble::as.tibble(final_2)


write_csv(final_2, "data/peld/test_1_peld.csv") # Need more cleanning 

########### Parte 2
## naman

naman = peld_datmerged_1 |> 
  filter(str_detect(document,"^naman")) |>  
  arrange(desc(document)) |> 
  arrange(desc(document)) |> 
  filter((document %in% c("naman_3_22", "naman_9_13", "naman_10_15", "naman_11_27", "naman_12_11", "naman_13_12", "naman_14_10", "naman_15_11", "naman_16_10", "naman_17_11", "naman_18_9", "naman_20_5", "naman_21_5", "naman_22_5", "naman_23_5", "naman_24_5", "naman_25_6", "naman_26_5", "naman_27_5", "naman_29_8", "naman_32_3", "naman_33_2", "naman_34_6", "naman_35_6", "naman_40_3", "naman_42_5", "naman_43_5", "naman_44_5", "naman_45_6", "naman_46_5", "naman_47_6", "naman_48_6", "naman_49_5", "naman_50_5", "naman_51_5", "naman_52_4", "naman_69_2", "naman_73_9", "naman_74_5", "naman_79_18", "naman_80_6", "naman_83_7", "naman_88_8", "naman_89_4", "naman_99_4", "naman_101_3", "naman_102_9", "naman_106_3", "naman_110_2", "naman_112_9", "naman_114_2", "naman_115_2", "naman_118_5", "naman_120_2", "naman_123_1", "naman_124_1", "naman_129_7", "naman_131_2", "naman_132_5", "naman_134_3", "naman_135_5", "naman_137_3", "naman_138_3", "naman_139_2", "naman_143_2", "naman_144_2", "naman_145_4", "naman_148_5", "naman_149_2", "naman_150_2", "naman_153_2", "naman_158_6", "naman_159_4", "naman_169_1", "naman_173_3", "naman_174_3", "naman_176_4", "naman_177_3", "naman_178_4", "naman_180_4", "naman_183_3", "naman_185_3", "naman_190_4", "naman_192_4", "naman_194_3", "naman_195_3", "naman_196_3", "naman_199_3", "naman_200_2", "naman_204_3", "naman_205_4", "naman_211_2", "naman_212_2", "naman_222_7", "naman_240_4", "naman_243_7", "naman_250_3", "naman_254_6", "naman_263_2", "naman_269_9", "naman_278_3", "naman_306_7", "naman_317_4", "naman_318_3", "naman_324_3", "naman_327_5", "naman_328_4", "naman_334_2", "naman_337_4", "naman_346_4", "naman_363_2", "naman_380_4", "naman_382_4", "naman_383_5", "naman_384_3", "naman_385_3", "naman_386_4", "naman_387_4", "naman_388_3", "naman_389_3", "naman_390_3", "naman_400_2", "naman_404_2", "naman_404_2", "naman_406_6", "naman_411_2", "naman_413_2", "naman_415_2", "naman_417_2", "naman_419_2", "naman_421_2", "naman_423_2", "naman_425_2", "naman_427_2", "naman_429_2", "naman_453_3", "naman_456_3", "naman_458_2", "naman_461_2", "naman_464_2", "naman_467_2", "naman_474_3", "naman_475_3", "naman_477_2", "naman_478_6", "naman_483_4", "naman_486_2", "naman_488_3", "naman_491_4", "naman_494_3", "naman_496_2", "naman_499_3", "naman_504_2", "naman_510_2", "naman_511_2", "naman_522_6", "naman_540_2", "naman_541_4", "naman_544_4", "naman_594_1", "naman_597_2", "naman_602_1", "naman_607_3", "naman_611_2", "naman_616_3", "naman_619_1", "naman_620_3", "naman_641_4", "naman_651_1", "naman_654_2")))


pablojones_peld = peld_datmerged_1 |> 
  filter(str_detect(document,"^peld")) |>  
  arrange(desc(document)) |> 
  arrange(desc(document)) |> 
  filter((document %in% c("peld_1_2","peld_2_1")))

pezzini = peld_datmerged_1 |> 
  filter(str_detect(document,"^pezzini")) |>  
  arrange(desc(document)) |> 
  arrange(desc(document)) |> 
  filter((document %in% c("pezzini_3_5","pezzini_8_2", "pezzini_10_1", "pezzini_11_1", "pezzini_14_7", "pezzini_15_2", "pezzini_19_1", "pezzini_21_1", "pezzini_22_1", "pezzini_34_1", "pezzini_35_1", "pezzini_36_2", "pezzini_37_4", "pezzini_38_7", "pezzini_44_5", "pezzini_50_2", "pezzini_51_6", "pezzini_60_20", "pezzini_61_4", "pezzini_64_4", "pezzini_65_3", "pezzini_66_4", "pezzini_67_1", "pezzini_69_10", "pezzini_76_3", "pezzini_83_6", "pezzini_90_3", "pezzini_91_3", "pezzini_92_3", "pezzini_93_3", "pezzini_94_3", "pezzini_95_6", "pezzini_96_4", "pezzini_97_3", "pezzini_98_3", "pezzini_99_3", "pezzini_108_4", "pezzini_113_6", "pezzini_115_2")))



