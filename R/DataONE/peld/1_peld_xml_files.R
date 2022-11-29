########################################################################
## Este scritp lista os metadados (arquivos XML) mais atuais do diretório Peld e tabela o conteúdo num datframe | This code list the updated metadata files in PPBio directory, then it is compiled in dataframe. 
## Versão | Version  R 4.2.1
## Author : Tainá Rocha
########################################################################

## Pacotes | Packages

library(purrr)
library(xml2)
library(XML)
library(dplyr)

# Listando metadados (arquivos xmls) | List metadata files

dados = list.files("data-raw/dataOne/peld_raw/Documents")

# Pegando os nomes do arquivos e compilando numa tibble/datframe | Getting the filenames and compiling in a tibble/dataframe

metadata_all <- tibble::tibble(metadata = dados)

# Arquivos sequenciais como "dias.35.2 dias.35.3 dias.35.4" são o mesmo conjunto de dados, o número mais alto representa o conjunto de dado mais atualizado | Sequential files such as  "days.35.2 days.35.3 days.35.4" are the same dataset, the higher number represents the most up-to-date datase

# A pipeline cria ums tibble/datframe com o nome dos metadados mais atualizados | The following pipeline create a tibble/dataframe of the most updated metadata NAMES.


metadata_2_all= metadata_all |>
  tidyr::separate(metadata, c("name", "id", "version"), remove = FALSE) |>
  #dplyr::mutate(id = as.numeric(id), version = as.numeric(version)) |>
  dplyr::group_by(name, id) |>
  dplyr::slice_max(version, n = 1) |>
  dplyr::ungroup()

# Selecionando a coluna com nomes mais atualizados | Select  the column names (most updated) 

nomes = metadata_2_all$metadata

# Usando o objeto "nomes" para selecionar apenas os metadados mais atualizados da pasta | Using the "nomes" object to select only the most up-to-date metadata from the folder.

dado2 = sapply(nomes, function(x){list.files("data-raw/peld_raw/Documents",pattern = x)})

# Criando uma função para copiar os metadados selecionandos para outra pasta

copynfiles <- function(x){
  file.rename( from = file.path("/home/tai-rocha/Documents/Github/Projetos/PPBio/data-raw/dataOne/peld_raw/Documents", x) ,
               to = file.path("/home/tai-rocha/Documents/Github/Projetos/PPBio/data/DataOne/peld/xmls_updated", x) )
}

# Executando a função . Apply the function 

lapply(nomes, copynfiles)


## Trabalhando no novo diretório com os arquivos de interesse | Working in the new directory with the files of interest.

# Listando os arquivos | Listing files 

xml_peld_files <- list.files("data/DataOne/peld/xmls_updated", full.names = TRUE)

# Criando uma função para pegar o nó "dataset"

read_my_xml = function(x, path = "//dataset") {
  tmp = read_xml(x) # lendo o xml | read the xml file
  tmp = tmp %>% 
    xml_find_first(path)  %>%   # select the //dataset node
    xml_children # Selecionando todos os filhos deste nó | select all children of that node
  
  # Extrair todo o texto dos "nós filhos" | this extracts the text of all children 
  # aka the text between the > TEXT </ Tags
  out = tmp  %>%   xml_text 
  # Pegando o nome das TAGS | Takes the names of the tags <NAME> ... </NAME>
  names(out) = tmp  %>%   xml_name
  # Transformando em tibble/dataframe | Turns out to tibble - see https://stackoverflow.com/q/40036207/3301344
  bind_rows(out)
}

peld_final = map_df(xml_peld_files, read_my_xml) # map_df is similar to a loop + binding it to one tibble

readr::write_csv(peld_final, "data/DataOne/peld/1_peld_datasets_node.csv")
#######

