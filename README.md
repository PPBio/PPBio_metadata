# PPBIo and PELD: an overview of data produced by those programs

![ alt text for screen readers](https://github.com/PPBio/PPBio_metadata/blob/master/doc/img/PPBio_PELD%20data.png "Text to show on mouseover")

Fig.1. [Workflow draft](https://www.figma.com/file/lc17JYGhJAsKvktgFdQ0gx/PPBio_PELD-data?node-id=0%3A1). Feel free to make suggestions and changes.

## Metadata and data search

[Metadata table](https://mail.google.com/mail/u/0/?ogbl#inbox/FMfcgzGqRGVKGmwLlQvQdtnbWzbjPsvf?projector=1&messagePartId=0.1)

Keywords used: "PPBio"", "Programa de Pesquisa em Biodiversidade", "The Program for Biodiversity Research", "Brazilian Biodiversity Research Programme", "PEDL", "Long-Term Ecological Research Program- PELD"


- [x] DataOne

The metadata files are stored in the below links and downloaded to a directory named "data-raw" for a local machine. This directory is not hosted on Github because has many XML files making it too large and not suitable to host here. However, for the reproducibility purposes of analysis and scripts, you can use the below links to download the xmls metadata files and create the "data-raw" directory to put those files. But pay attention to other subdirectories in data-raw. If you want to run the code without any changes, create the same path and directories of the scripts. 


PPBio files- The [data from Metacat 02062022](https://onedrive.live.com/?authkey=%21ALdWS8Bdj1fu3nc&id=C8DF5FA20BD04A99%2175350&cid=C8DF5FA20BD04A99) stored some PPBio data.

PELD files- The [documents from metacat 02062022](https://onedrive.live.com/?authkey=%21ALdWS8Bdj1fu3nc&id=C8DF5FA20BD04A99%2173004&cid=C8DF5FA20BD04A99) stores some metadata of PELD.

[Peld Metacat](https://onedrive.live.com/?authkey=%21ALdWS8Bdj1fu3nc&id=C8DF5FA20BD04A99%2157919&cid=C8DF5FA20BD04A99) stores metadata and data of PELD 

- [X] [ebird](https://ebird.org/home) - Acessed 25 January 2023

- [ ] [ForestPlot.NET](https://forestplots.net/)

- [x] GBIF

Accessed aqnd dowloaded 17 October 2022

3 datasets for PPBIO 
3 datasets for PELD

- [X] [iNatarulaits](https://www.inaturalist.org/)

- [X] [JABOT](https://ipt.jbrj.gov.br/jabot/resource?r=rffp&request_locale=pt#anchor-description) - RFFP - Herbário da Faculdade de Formação de Professores da Universidade do Estado do Rio de Janeiro. Jabot - Banco de Dados da Flora Brasileira. Acessesd and downloaded 20 October 2022

- [X] [MPEG, Herbário virtual](http://colecoesbio.museu-goeldi.br/herbario.html). Accessed/ downloaded 20 October 2022. 

- [X] [MPEG, Coleções Zoológicas](https://www.museu-goeldi.br/assuntos/colecoes/biologicas/colecoes-de-zoologica). Accessed/ downloaded 20 October 2022. in progress

- [X] [REFLORA](https://reflora.jbrj.gov.br/reflora/herbarioVirtual/ConsultaPublicoHVUC/ConsultaPublicoHVUC.do). Acessed 25 January 2023

- [x] [SIBBr](https://www.sibbr.gov.br/) 

Accessed 11 October 2022

[PPBio](https://collectory.sibbr.gov.br/collectory/public/show/dp32?lang=pt_BR), [PELD](https://collectory.sibbr.gov.br/collectory/public/show/dp30?lang=pt_BR), [PELD - HCES](https://collectory.sibbr.gov.br/collectory/public/show/dr487?lang=pt_BR), [PELD - AGCV](https://collectory.sibbr.gov.br/collectory/public/show/dr504?lang=pt_BR), [PELD - PNCA](https://collectory.sibbr.gov.br/collectory/public/show/dr479?lang=pt_BR), [PELD - ELPA](https://collectory.sibbr.gov.br/collectory/public/show/dr505?lang=pt_BR), [PELD - ELPA](https://collectory.sibbr.gov.br/collectory/public/show/dr506?lang=pt_BR), [PELD - RLaC](https://collectory.sibbr.gov.br/collectory/public/show/dr611?lang=pt_BR), [PELD - RLaC](https://collectory.sibbr.gov.br/collectory/public/show/dr609?lang=pt_BR), [PELD - RLaC](https://collectory.sibbr.gov.br/collectory/public/show/dr610?lang=pt_BR), [PELD - RLaC](https://collectory.sibbr.gov.br/collectory/public/show/dr607?lang=pt_BR), [PELD - RLaC](https://collectory.sibbr.gov.br/collectory/public/show/dr608?lang=pt_BR)

- [x] speciesLink 
PPBio and PELD data acessed and dowloaded at 12 Octuber 2022 [search based on "PPBio" and PELD](https://specieslink.net/search/)


## Data Cleaning and Filters

- [x] DataONE- data extraction from xml files 
- [X] Merge and standardize files from different sources... in progress


## Analysis

Some tests for DataOne files based on text mining of "Title" 

<img align="left" width="500" height="400" src="https://github.com/PPBio/PPBio_metadata/blob/master/doc/img/test_1.png"> 
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


Fig.2 Word frequency using random threshold (n > 51 <100). 


<img align="left" width="500" height="400" src="https://github.com/PPBio/PPBio_metadata/blob/master/doc/img/test_2.png"> 
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

Fig3. Word frequency using random threshold (n > 50). 



## How to contribute ? 

Your contributions are welcome in any part of this project. Currently, the most urgent necessity is to get PPBIO and PEDL data from databases available in Step 1 and discover other sources of PPPBIO and PELD data.






