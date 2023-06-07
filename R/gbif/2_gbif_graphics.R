## Este scritp gera gráficos para os dados do gbif
## Versão | Version  R 4.3
## Author : Tainá Rocha
## Dowload data : 07 June 2023


library(dplyr)
library(ggplot2)
library(knitr)
library(readr)


gbif_ppbio = readr::read_csv("data/gbif/ppbioBind.csv")

## Kingdom

gbif_ppbio |>
  filter(!grepl('incertae sedis', kingdom)) |>
  group_by(kingdom) |>
  count() |>
  kable()

g = gbif_ppbio |>
  filter(!grepl('incertae sedis', kingdom))  

h = ggplot(g, aes(kingdom))
h + geom_bar( width = 0.5) +
  scale_y_sqrt() +
  xlab(" ") + ylab("N") +
  theme_bw() +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
        )

## Family

gbif_ppbio |>
  filter(!grepl('incertae sedis', family)) |>
  group_by(family) |>
  count() |>
  kable()


i = gbif_ppbio |>
  filter(!grepl('incertae sedis', family))  

j = ggplot(i, aes(family))
j + geom_bar( width = 0.5) +
  scale_y_sqrt() +
  xlab(" ") + ylab("N") +
  theme_bw() +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )