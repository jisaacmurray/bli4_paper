library(Seurat)
library(VisCello)

##To count UMI for exons
eset.exons <- readRDS("~/scRNAseq/Celegans.Packer.exons.cello/eset.rds")
clist.exons <- readRDS("~/scRNAseq/Celegans.Packer.exons.cello/clist.rds")

#bli-4 exons
##e.g. K04F10.4a.1.e1
bli4_exons <- rownames(eset.exons)[substr(rownames(eset.exons),1,8) == "K04F10.4"]


##plot.cell.type category quantification
bli_data = c(sum(exprs(eset.exons)),rowSums(exprs(eset.exons[bli4_exons,])))
cells = unique(eset.exons$plot.cell.type)

for(i in cells){
    message(i)
    bli_data = rbind(bli_data, c(sum(exprs(eset.exons[,eset.exons$plot.cell.type == i])), rowSums(exprs(eset.exons[bli4_exons,eset.exons$plot.cell.type == i]))))
}
rownames(bli_data) = c("All", cells)
colnames(bli_data) = c("All", bli4_exons)

bli_rpm <- bli_data/bli_data[,1] * 1000000
colnames(bli_rpm) <- paste(colnames(bli_rpm), "rpm", sep="_")

write.csv(cbind(bli_data,bli_rpm), file="bli4_umi_data.plot.cell.type.csv",  quote=F)

##broader "UMAP display" category quantification
bli_data = c(sum(exprs(eset.exons)),rowSums(exprs(eset.exons[bli4_exons,])))
Categories = names(clist.exons)
for(i in Categories){
    message(i)
    this_clist <- clist.exons[[i]]
    these_names <- rownames(this_clist@proj$PCA) ##PCA arbitrarily chosen as likely present for all
    bli_data = rbind(bli_data, c(sum(exprs(eset.exons[,these_names])), rowSums(exprs(eset.exons[bli4_exons,these_names]))))
}
rownames(bli_data) = c("All", Categories)
colnames(bli_data) = c("All", bli4_exons)

bli_rpm <- bli_data/bli_data[,1] * 1000000
colnames(bli_rpm) <- paste(colnames(bli_rpm), "rpm", sep="_")

write.csv(cbind(bli_data,bli_rpm), file="bli4_umi_data.Categories.csv",  quote=F)


##To subset bam files?
eset <- readRDS("~/scRNAseq/Celegans.Packer.Cello/eset.rds")
clist <- readRDS("~/scRNAseq/Celegans.Packer.Cello/clist.rds")

cellNames = colnames(eset)

barcodes = substr(cellNames, 1, 16)
expts = substr(cellNames, 18,100)



Categories = names(clist.exons)
for(i in Categories){
    for(j in expts){
        i="r17"
        j="Hypodermis and seam"

        
    }
}


expt <- "r17"
tissue <- "Hypodermis"

write.csv ("r17_Hypodermis.csv", colnames(eset["bli-4",expts == "r17" & eset$cell.type == "Hypodermis"]))
