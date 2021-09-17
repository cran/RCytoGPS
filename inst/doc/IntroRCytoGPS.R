## ----opts, echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(fig.width=8, fig.height=5)

## ----mycss, results="asis", echo=FALSE----------------------------------------
cat('
<style type="text/css">
.figure { text-align: center; }
.caption { font-weight: bold; }
</style>
')

## ----Setup--------------------------------------------------------------------
library(RCytoGPS)

## ----sysfile------------------------------------------------------------------
wd <-  system.file("Examples/JSONfiles", package = "RCytoGPS")
dir(wd)

## ----readLGF------------------------------------------------------------------
temp <- readLGF(folder = wd)
rm(wd)

## ----peekTemp-----------------------------------------------------------------
class(temp)
names(temp)

## ----src----------------------------------------------------------------------
temp$source

## ----size---------------------------------------------------------------------
temp$size

## ----CL-----------------------------------------------------------------------
summary(temp$CL)

## ----raw----------------------------------------------------------------------
names(temp$raw)
R <- temp$raw[[2]]
names(R)
R$Status
dim(R$LGF)
rownames(R$LGF)
rm(R)

## ----freqelt------------------------------------------------------------------
F <- temp$frequency
class(F)
dim(F)
colnames(F)

## ----cytoData-----------------------------------------------------------------
cytoData <- data.frame(temp[["CL"]], temp[["frequency"]])

## ----Turning CytoData into an S4 Object---------------------------------------
bandData <- CytobandData(cytoData)

## ----gb, fig.cap="Cytoband level data along the genome.", fig.width=14, fig.height=7----
opar <- par(mfrow=c(2,1))
barplot(bandData, what = "CytoGPS_Result1.Loss", col = "forestgreen")
barplot(bandData, what = "CytoGPS_Result1.Gain", col = "orange")
par(opar)

## ----v.plot2Chrom, fig.width=8, fig.height=5,fig.cap = "Vertical stacked barplot of LGF frequencies on chromosome 3 for type 1 samples."----
datacolumns <- names(temp[["frequency"]])
datacolumns
image(bandData, what = datacolumns[1:3], chr = 2, labels = TRUE)

## ----makeid, fig.width=10, fig.height=8, fig.cap="Idiogram for one data columm."----
image(bandData, what = datacolumns[1], chr = "all", pal = "orange")

## ----biid, fig.width=10, fig.height=8, fig.cap="Idiogram to contrast two data columms."----
image(bandData, what = datacolumns[1:3], chr = "all", 
      pal=c("orange", "forestgreen", "purple"), horiz=TRUE)

## -----------------------------------------------------------------------------
sessionInfo()


