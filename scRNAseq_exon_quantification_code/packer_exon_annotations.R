wideScreen <- function(howWide=Sys.getenv("COLUMNS")) {
  options(width=as.integer(howWide))
}
wideScreen()

library(VisCello)
library(Seurat)
#library(monocle3)

##library(DropletQC)

############################################################################3
##Load Packer annotated
packer_eset=readRDS("/home/jmurr/scRNAseq/Celegans.Packer.Cello/eset.rds")
packer_clist=readRDS("/home/jmurr/scRNAseq/Celegans.Packer.Cello/clist.rds")




############################################################################3
##Load Packer counts remapped to WS277 and update in packer_eset
##FIXME - update once waterston combined lane analysis is done


Packer_samples = c("Sample_Murray_b01", "Sample_Murray_b02", "Sample_Murray_r17",
                   "Sample_Waterston_300_min_10X_lane_1","Sample_Waterston_300_min_10X_lane_2","Sample_Waterston_300_min_10X_lane_3",
                   "Sample_Waterston_400_min_10X_lane_1","Sample_Waterston_400_min_10X_lane_2","Sample_Waterston_400_min_10X_lane_3",
                   "Sample_Waterston_500_min_batch_1_10X_lane_1","Sample_Waterston_500_min_batch_1_10X_lane_2","Sample_Waterston_500_min_batch_1_10X_lane_3",
                   "Sample_Waterston_500_min_batch_2_10X_lane_1","Sample_Waterston_500_min_batch_2_10X_lane_2"
                   )

                   ##"AGGR-Waterston_300_min", "AGGR-Waterston_400_min", "AGGR-Waterston_500_min_batch_1", "AGGR-Waterston_500_min_batch_2")


##fixme remove, unrelated
###ref2Cors = cor(data.frame(exprs(packer_eset["ref-2",])),data.frame(exprs(packer_eset)),method="spearman")
packerCells = colnames(packer_eset)
##list suffixes used in packer data
suffixes <- unique(substr(packerCells,17,100))

cellsUpdated=0
newExprs = NULL
for(i in Packer_samples){

    data_file <- paste("/home/jmurr/scRNAseq/exons/", i ,"/outs/raw_feature_bc_matrix.h5", sep="")
    message(data_file)

    data_matrix = Read10X_h5(data_file, use.names = TRUE, unique.features = TRUE)

    if(grepl("Murray",i)){
        ##e.g. Sample_Murray_b01
        suffix = paste("-",substr(i,15,100),sep="")
    }else{
        ##e.g. Sample_Waterston_300_min_10X_lane_1
        ##plus
        ##AAACCTGAGACAATAC-1
        ##to
        ##AAACCTGAGACAATAC.300.1.1
        minutes <- substr(i,18,20)
        if(minutes==500){
            batch <- substr(i,32,32)
        }else if(minutes==400){
            batch=2
        }else{
            batch=1
        }
        lane=substr(i,nchar(i),nchar(i))
        suffix=paste("-",paste(minutes,batch,lane,sep="."),sep="")
    }
    message(suffix)
    theseCells = colnames(data_matrix)
    theseCells_withSuffix = paste(substr(theseCells,1,16),suffix,sep="")
    nchar(theseCells)

    overlappingCells <- intersect(packerCells,theseCells_withSuffix)
    overlappingCells <- theseCells_withSuffix[theseCells_withSuffix %in% overlappingCells]
    names_of_overlappingCells <- theseCells[theseCells_withSuffix %in% overlappingCells]
    
    message(paste("Overlapping cells:", length(overlappingCells)))
    cellsUpdated = cellsUpdated + length(overlappingCells)
    
    theseExprs = data_matrix[,names_of_overlappingCells]
    colnames(theseExprs) <- overlappingCells
    newExprs = cbind(newExprs,theseExprs)
    ##    head(colnames(packer_eset))
##    head(colnames(data_matrix))
##    head(substr(colnames(datxa_matrix),1,17))
}
message(paste("Cells Updated:",cellsUpdated))
message(paste("Cells in Packer:",length(colnames(packer_eset))))
dim(newExprs)


packer_seurat= CreateSeuratObject(counts=Matrix(newExprs[,colnames(packer_eset)], sparse = T),project="packer",min.cells=0,min.features=1)
packer_seurat <- NormalizeData(object = packer_seurat, normalization.method = "LogNormalize", 
    scale.factor = 10000)



fData=data.frame(symbol=rownames(packer_seurat))
rownames(fData)=rownames(packer_seurat)
pData=pData(packer_eset)


packer_eset2  <- new("ExpressionSet",
                     assayData = assayDataNew("environment", exprs=packer_seurat@assays$RNA@counts, 
                                              norm_exprs = packer_seurat@assays$RNA@data),
                     phenoData =  new("AnnotatedDataFrame", data= pData),
                     featureData = new("AnnotatedDataFrame", data = fData)
                     )


saveRDS(packer_eset2, "/home/jmurr/scRNAseq/Celegans.Packer.exons.cello/eset.rds") 





