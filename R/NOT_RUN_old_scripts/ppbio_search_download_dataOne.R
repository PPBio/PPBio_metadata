library(dataone)
library(datapack)
library(EML)
library(tidyverse)
library(XML)
library(datapack)
library(uuid)

cn = CNode("PROD")
d1c = getMNode(cn, 'urn:node:PPBIO')

# Ask for the id, title and abstract
queryParams = list(q="ppbio", fl="id,title,abstract", rows='2000') 
result = query(d1c, solrQuery=queryParams, as="data.frame", parse=FALSE)

write_csv(result, "data/ppbio/ppbio_dataone.csv") # Need more cleanning 

result[1, c("id", "title")]

id = result[1, 'id']

######################


metadata = rawToChar(getObject(d1c, id))
doc = xmlRoot(xmlTreeParse(metadata, asText=TRUE, trim = TRUE, ignoreBlanks = TRUE))
tf = tempfile()
saveXML(doc, tf)
file.show(tf)

##
dataRaw = getObject(d1c, "ppbio.1.3")
dataChar = rawToChar(dataRaw)
theData = textConnection(dataChar)
df = read.csv(theData, stringsAsFactors=FALSE)
df[1,]



d1c <- D1Client("PROD", "urn:node:PPBIO")
id <- paste("urn:node:PPBIO:", UUIDgenerate(), sep="")
testdf <- data.frame(x=1:10,y=11:20)
csvfile <- paste(tempfile(), ".csv", sep="")
write.csv(testdf, csvfile, row.names=FALSE)

# Build a DataObject containing the csv, and upload it to the Member Node
d1Object <- new("DataObject", id, format= "text/csv", filename=csvfile)
uploadDataObject(d1c, d1Object, public=TRUE)


d1c <- D1Client("PROD", "urn:node:PPBIO")
pkg <- getDataPackage(d1c, id="urn:uuid:04cd34fd-25d4-447f-ab6e-73a572c5d383", quiet=FALSE)



node.id<-result$id
doc_DF<-list() #vamos criar nossa lista de resultados para o loop poder rodar. vai ser nesse objeto que nossos resultados vão ser salvos


for(i in node.id){
  cat(red$bold("    We are reading ") %+% yellow$bold(i) %+% red$bold('!!\n\n')) 
  
pid <- i
if(is.na( pid==T)) {doc <- i } else  {locations <- resolve(cn, pid)
mnId <- locations$data[, "nodeIdentifier"]
mn <- getMNode(cn, mnId)

obj <- getObject(cn, pid)
obj

dataObj <- getDataObject(d1c, pid)
if(is.null(dataObj)== T) {cat(red('Object ')%+% yellow(i) %+% red('  has no data to download\n\n') )
  doc=i}   else    { print(cat(red('Downloading data from object ')%+% yellow(i) %+% red('!  All going well\n\n') ))
    bytes <- getData(dataObj)
metadataXML <- rawToChar(bytes)
doc <- read_eml(metadataXML)}}
doc_DF[[i]]<- doc

cat(red$bold("    Exporting for ") %+% yellow$bold(i) %+% red$bold(' is done!!\n\n')) 
}
