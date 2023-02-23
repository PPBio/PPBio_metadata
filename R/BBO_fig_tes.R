#############################################################################################
##Este scritp faz uma mineração de texto para análise exploratória | This code do a text mining for exploratory analysis
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
#############################################################################################

## Pacotes | Packages

library(rgdal)
library(wordcloud)

source("R/stop_words_pt.R")
data("stop_words")
stop_words


shapefile = readOGR("data/shapefile/AtlasMar_BiomasBrasil.shp")

text_data = read.csv("data/DataOne/ppbio/bbo_fig_marketing.csv")$Text

text_data_upper = sapply(text_data, toupper)

wordcloud(words = text_data_upper, min.freq = 5, mask = shapefile, scale=c(2,1), max.words=100, random.order=FALSE, rot.per=0.15, colors=brewer.pal(8, "Dark2"))

#wordcloud(words = text_data, min.freq = 5, mask = shapefile, scale=c(2,1), max.words=100, random.order=FALSE, casefold="upper")


