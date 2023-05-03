#~/downloads/cellranger-6.1.2/bin/cellranger mkref --nthreads=64 --memgb=100       --genome=elegans --fasta=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons/fasta/genome.fa --genes=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons/genes/genes.gtf


#STAR --runMode genomeGenerate --runThreadN 64 \
#     --limitSjdbInsertNsj 1500000 --genomeSAindexNbases 12 \
#     --genomeDir /home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons/star \
#     --genomeFastaFiles /home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons/fasta/genome.fa  \
#     --sjdbGTFfile /home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons/genes/genes.gtf



~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Murray_b01 --sample=Murray_b01 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Murray_b02 --sample=Murray_b02 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Murray_r17 --sample=Murray_r17 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_300_min_10X_lane_1 --sample=Waterston_300_min_10X_lane_1 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_300_min_10X_lane_2 --sample=Waterston_300_min_10X_lane_2 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_300_min_10X_lane_3 --sample=Waterston_300_min_10X_lane_3 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_400_min_10X_lane_1 --sample=Waterston_400_min_10X_lane_1 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_400_min_10X_lane_2 --sample=Waterston_400_min_10X_lane_2 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_400_min_10X_lane_3 --sample=Waterston_400_min_10X_lane_3 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons

~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_500_min_batch_1_10X_lane_1 --sample=Waterston_500_min_batch_1_10X_lane_1 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_500_min_batch_1_10X_lane_2 --sample=Waterston_500_min_batch_1_10X_lane_2 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_500_min_batch_1_10X_lane_3 --sample=Waterston_500_min_batch_1_10X_lane_3 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_500_min_batch_2_10X_lane_1 --sample=Waterston_500_min_batch_2_10X_lane_1 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons
~/downloads/cellranger-6.1.2/bin/cellranger count --localcores=20 --localmem=50 --id=Sample_Waterston_500_min_batch_2_10X_lane_2 --sample=Waterston_500_min_batch_2_10X_lane_2 --fastqs /kimdata/repo.murray/2020-Waterston  --transcriptome=/home/jmurr/src/exons/lib_CR_C.elegans.WS277.exons


#~/downloads/cellranger-6.1.2/bin/cellranger aggr --id=AGGR-Waterston_300_min --csv=Waterston_300_min.csv --normalize=mapped --localcores=16 --localmem=100
