library(Seurat)
library(VisCello)

##To count UMI for exons
eset.exons <- readRDS("~/scRNAseq/Celegans.Packer.exons.cello/eset.rds")
clist.exons <- readRDS("~/scRNAseq/Celegans.Packer.exons.cello/clist.rds")




##To subset bam files?
eset <- readRDS("~/scRNAseq/Celegans.Packer.Cello/eset.rds")
clist <- readRDS("~/scRNAseq/Celegans.Packer.Cello/clist.rds")

cellNames = colnames(eset)

barcodes = substr(cellNames, 1, 16)
expts = substr(cellNames, 18,100)


expt <- "r17"
tissue <- "Hypodermis"

write.csv ("r17_Hypodermis.csv", colnames(eset["bli-4",expts == "r17" & eset$cell.type == "Hypodermis"]))
