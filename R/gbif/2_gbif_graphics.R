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

## Family t1

gbif_ppbio_t1 = gbif_ppbio |>
  filter(!grepl('incertae sedis', family)) |>
  group_by(family) |>
  count() |>
  filter(n > 29 & n < 101) #|> 
  #arrange(desc(n)) |>
  #kable() 


## Bar plot
# Using ggplot2 package

gbif_ppbio_t2$family = factor(gbif_ppbio_t1$family, levels = gbif_ppbio_t1$family[order(gbif_ppbio_t1$n, decreasing = TRUE)])

ggplot(gbif_ppbio_t1, aes(x = family, y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Family", y = "Count",
       title = "Distribution of Family Taxa in Plantae Kingdom") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )


## Family t2
 

gbif_ppbio_t2 = gbif_ppbio |>
  filter(!grepl('incertae sedis', family)) |>
  group_by(family) |>
  count() |>
  filter(n > 100 & n < 501) |>
  na.omit()
#arrange(desc(n)) |>
#kable() 


## Bar plot
# Using ggplot2 package

gbif_ppbio_t2$family = factor(gbif_ppbio_t2$family, levels = gbif_ppbio_t2$family[order(gbif_ppbio_t2$n, decreasing = TRUE)])

ggplot(gbif_ppbio_t2, aes(x = family, y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Family", y = "Count",
       title = "Distribution of Family Taxa in Plantae Kingdom") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )


## Family t3


gbif_ppbio_t3 = gbif_ppbio |>
  filter(!grepl('incertae sedis', family)) |>
  group_by(family) |>
  count() |>
  filter(n > 500 & n < 4000) |>
  na.omit()
#arrange(desc(n)) |>
#kable() 


## Bar plot
# Using ggplot2 package

gbif_ppbio_t3$family = factor(gbif_ppbio_t3$family, levels = gbif_ppbio_t3$family[order(gbif_ppbio_t3$n, decreasing = TRUE)])

ggplot(gbif_ppbio_t3, aes(x = family, y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Family", y = "Count",
       title = "Distribution of Family Taxa in Plantae Kingdom") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )

## Genus 


## Locality 
## State Provincia Bar graphic
gbif_ppbio |>
  filter(year > 2004) |> 
  filter(countryCode == "BR") |> 
  group_by(stateProvince) |>
  count() |>
  na.omit()  
  kable()

## Instution  Bar graphic
gbif_ppbio |>
  filter(year > 2004) |> 
  group_by(institutionCode) |>
  count() |>
  na.omit()  
  kable()
  
  
## Indentication cloud names
gbif_ppbio |>
  filter(year > 2004) |> 
  filter(!grepl("^-", identifiedBy)) |> 
  filter(!grepl("^[0-9]+", identifiedBy)) |>
  group_by(identifiedBy) |>
  count() |>
  na.omit() |>  
  kable()