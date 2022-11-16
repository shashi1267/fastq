#set directories
getwd()

#install BiocManager library
install.packages("BiocManager")
library(BiocManager)
BiocManager::install("ShortRead")
library(ShortRead)
browseVignettes("ShortRead")

#Loading the data
fq = readFastq("file2.fastq")
fq
View(fq)

fq[1:3]
sread(fq)
sread(fq[1:2])

quality(fq)

#number of sequences
length(fq)


#length of reads
readlength =width(fq)
readlength

#summary of first 10 sequences
readlength[1:10]

#generating summary of fastq sequences
#fastq reads
fq_reads = sread(fq)
fq_reads
id_reads = id(fq)
id_reads

#seLlength
seq_length = as.data.frame(fq_reads@ranges@width)
seq_length

#quality scores
quality_scores = quality(fq)
quality_scores[1:5]

scores = as(quality_scores,"matrix")
scores
mean_score_for_each_sequence = rowMeans(scores,na.rm = TRUE)
mean_score_for_each_sequence
mean_score_for_each_position = colMeans(scores,na.rm = TRUE)
mean_score_for_each_position
boxplot(scores,xlab="Position",ylab="Phred score")
View(scores)
