## Este scritp gera gráficos para os dados do gbif
## Versão | Version  R 4.3
## Author : Tainá Rocha
## Data : 07 June 2023
## Last update: 09 June 2023


library(dplyr)
library(ggplot2)
library(knitr)
library(readr)
library(stringr)
library(wordcloud)


gbif_ppbio = readr::read_csv("data/gbif/ppbioBind.csv")

## Kingdom

gbif_ppbio |>
  filter(year > 2004) |> 
  filter(!grepl('incertae sedis', kingdom)) |>
  group_by(kingdom) |>
  count() |>
  kable()

g = gbif_ppbio |>
  filter(year > 2004) |> 
  filter(!grepl('incertae sedis', kingdom)) |>
  group_by(kingdom) |>
  count() #|>
  #kable()

h = ggplot(g, aes(x = kingdom, y = n))
h +  geom_bar(stat = "identity", fill ="gray", width = 0.5) +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = "kingdom", y = "n",
       title = "Kingdom") +
  scale_y_sqrt() +
  xlab(" ") + ylab("n") +
  theme_bw() +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
        )

## Family t1

gbif_ppbio_f1 = gbif_ppbio |>
  filter(year > 2004) |> 
  filter(!grepl('incertae sedis', family)) |>
  group_by(family) |>
  count() |>
  filter(n > 500 & n < 5000) #|> 
  #arrange(desc(n)) |>
  #kable() 

gbif_ppbio_f1$family = factor(gbif_ppbio_f1$family, levels = gbif_ppbio_f1$family[order(gbif_ppbio_f1$n, decreasing = TRUE)])

ggplot(gbif_ppbio_f1, aes(x = family, y = n)) +
  geom_bar(stat = "identity", fill ="gray") +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = " ", y = "N",
       title = "Families") +
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
f2_gbif_ppbio = gbif_ppbio |>
  filter(year > 2004) |> 
  filter(!grepl('incertae sedis', family)) |>
  group_by(family) |>
  count() |>
  filter(n > 100 & n < 501) |>
  na.omit()
#arrange(desc(n)) |>
#kable() 

f2_gbif_ppbio$family = factor(f2_gbif_ppbio$family, levels = f2_gbif_ppbio$family[order(f2_gbif_ppbio$n, decreasing = TRUE)])

ggplot(f2_gbif_ppbio, aes(x = family, y = n)) +
  geom_bar(stat = "identity", fill ="gray") +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = " ", y = "N",
       title = "Families") +
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
f3_gbif_ppbio = gbif_ppbio |>
  filter(year > 2004) |>
  filter(!grepl('incertae sedis', family)) |>
  group_by(family) |>
  count() |>
  filter(n > 29 & n < 101) |>
  na.omit()

f3_gbif_ppbio$family = factor(f3_gbif_ppbio$family, levels = f3_gbif_ppbio$family[order(f3_gbif_ppbio$n, decreasing = TRUE)])

ggplot(f3_gbif_ppbio, aes(x = family, y = n)) +
  geom_bar(stat = "identity", fill ="gray") +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = " ", y = "N",
       title = "Families") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
  )


####
f3_gbif_ppbio$family = factor(f3_gbif_ppbio$family, levels = f3_gbif_ppbio$family[order(f3_gbif_ppbio$n, decreasing = TRUE)])

ggplot(f3_gbif_ppbio, aes(x = family, y = n)) +
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


## Family t4

f4_gbif_ppbio = gbif_ppbio |>
  filter(!grepl('incertae sedis', family)) |>
  group_by(family) |>
  count() |>
  filter(n > 500 & n < 4000) |>
  na.omit()

f4_gbif_ppbio$family = factor(f4_gbif_ppbio$family, levels = f4_gbif_ppbio$family[order(f4_gbif_ppbio$n, decreasing = TRUE)])

ggplot(f4_gbif_ppbio, aes(x = family, y = n)) +
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
state = gbif_ppbio |>
  filter(year > 2004) |> 
  filter(countryCode == "BR") |> 
  mutate(across('stateProvince', str_replace, 'BA.', 'Bahia')) |> 
  mutate(across('stateProvince', str_replace, 'Baha', 'Bahia')) |> 
  mutate(across('stateProvince', str_replace, 'Minas Gerias', 'Minas Gerais')) |> 
  mutate(across('stateProvince', str_replace, 'Para', 'Pará')) |> 
  mutate(across('stateProvince', str_replace, 'Piaui', 'Piauí')) |> 
  mutate(across('stateProvince', str_replace, 'Rio de Janeirp', 'Rio de Janeiro')) |> 
  group_by(stateProvince) |>
  count() |>
  na.omit() #|>   
  #kable()

state$stateProvince = factor(state$stateProvince, levels = state$stateProvince[order(state$n, decreasing = TRUE)])

ggplot(state, aes(x = stateProvince, y = n)) +
  geom_bar(stat = "identity", fill ="gray") +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
  labs(x = " ", y = "N",
       title = "States") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(text = element_text(size=15),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.ontop = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid = element_blank()
        )


## Instution  Bar graphic
Inst = gbif_ppbio |>
  filter(year > 2004) |> 
  group_by(institutionCode) |>
  count() |>
  na.omit()  
  #kable()
 
ggplot(Inst, aes(x = institutionCode, y = n)) +
    geom_bar(stat = "identity", fill = "grey", width = 0.25) +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +  # Add text labels with n values
    labs(x = "_", y = "N",
         title = "Institutions") +
    theme_bw() +
    #theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    theme(text = element_text(size=15),
          plot.background = element_blank(),
          panel.grid.major = element_blank(),
          panel.ontop = element_blank(),
          panel.grid.minor = element_blank(),
          panel.grid = element_blank()
    )
  
  
## Indentication cloud names

gbif_ppbio |>
  filter(year > 2004) |> 
  filter(!grepl("^-", identifiedBy)) |> 
  filter(!grepl("^[0-9]+", identifiedBy)) |>
  group_by(identifiedBy) |>
  count() |>
  na.omit() |>  
  kable()

IDfiltered_data = gbif_ppbio |>
  filter(year > 2004) |> 
  filter(!grepl("^-", identifiedBy)) |> 
  filter(!grepl("^[0-9]+", identifiedBy)) |>
  filter(!grepl("Administrador", identifiedBy)) |>
  group_by(identifiedBy) |>
  count() |>
  na.omit()

# Create a word cloud
wordcloud(IDfiltered_data$identifiedBy, IDfiltered_data$n, random.order = FALSE)
