###Script para obtener algunos parametros basicos de Gen�tica de poblaciones
###compilado de Hierfstat latest features de Jerome Goudet (2015-12-03)
###Archivo de SNP�s tomado del gitHub de Mark Christie
###Ejercicio 4

library(adegenet)
library(hierfstat)

reads<-read.delim("../data/SNP_data.txt")
head(reads)

data(reads) 
is.genind(reads)

##Cuantos loci hay
n.loci    <- (ncol(reads)/2)-1    
n.loci
head(n.loci)

#cuantos individuos hay por poblaci�n
n.per.pop <- table(reads[, 2])   
n.per.pop

# boxplot of Ho, Hs, Ht

boxplot(basic.stats(reads)$perloc[,1:5]) 

##Estadistica descriptiva

#Riqueza alelica de primeros 20 loci

boxplot(t(allelic.richness(reads)$Ar[1:20,]))


#PCA de genotipos principales
x<-indpca(reads[,-2],ind.labels=reads[,2])
plot(x,col=reads[,1],cex=0.7)



