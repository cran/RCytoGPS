## ----opts, echo=FALSE, results="hide"-----------------------------------------
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
data(cytoData)
colnames(cytoData)
bandData <- CytobandData(cytoData)
Acolumns <- c("A.Loss", "A.Gain", "A.Fusion")

## ----gb, fig.cap="Figure 1: Cytoband level data along the genome.", fig.width=14, fig.height=7----
opar <- par(mfrow=c(2,1))
barplot(bandData, "A.Loss", col = "forestgreen")
barplot(bandData, "B.Loss", col="orange")
par(opar)

## ----v.plot2Chrom, fig.width=8, fig.height=5,fig.cap = "Figure 2: Vertical stacked barplot of LGF frequencies on chromosome 2 for type A samples."----
image(bandData, what = Acolumns[1:3], chr = 2)

## ----h.plot2Chrom, fig.width=5, fig.height=8, fig.cap = "Figure 3: Horizontal stacked barplot of LGF frequencies on chromosome 2 for type A samples."----
image(bandData, Acolumns[1:3], chr = 2, horiz = TRUE)

## ----v.plot1Chrom, fig.width=8, fig.height=5, fig.cap = "Figure 4: Vertical stacked barplot of LGF frequencies on chromosome 5 for type A and B samples."----
image(bandData, what = list("A.Loss", "B.Loss"), chr = 5)


## ----h.plot1Chrom, fig.width=5, fig.height=8, fig.cap = "Figure 5: Horizontal stacked barplot of LGF frequencies on chromosome 5 for type A and B samples."----
image(bandData, what = list("A.Loss", "B.Loss"), chr = 5, horiz = TRUE)

## ----makeid, fig.width=10, fig.height=8, fig.cap="Figure 6: Idiogram for one data columm."----
image(bandData, what = Acolumns[1], chr = "all", pal = "orange")

## ----biid, fig.width=15, fig.height=12, fig.cap="Figure 7: Idiogram to contrast two data columms."----
image(bandData, what = Acolumns[1:2], chr = "all",
      pal=c("orange", "forestgreen"))

## ----biid3, fig.width=17, fig.height=17, fig.cap="Figure 8: Idiogram to contrast two data columms."----
image(bandData, what = Acolumns[1:2], chr = "all", nrows = 3,
      pal=c("orange", "forestgreen"))

## ----hbiid, fig.width=8, fig.height=10, fig.cap="Figure 9: Idiogram to contrast two data columms."----
image(bandData, what = Acolumns[1:2], chr = "all", 
      pal=c("orange", "forestgreen"), horiz = TRUE)

## ----stackid, fig.width=17, fig.height=15, fig.cap="Figure 10: Idiogram for many data columns."----
image(bandData, what = Acolumns[1:3], chr = "all", 
              pal=c("forestgreen", "orange", "purple"), nrows=3, horiz = FALSE)

## ----hstackid, fig.width=14, fig.height=9, fig.cap="Figure 11: Idiogram for many data columns."----
image(bandData, what = Acolumns, chr = "all", 
              pal=c("forestgreen", "orange", "purple"), nrows=3, horiz= TRUE)

## ----si-----------------------------------------------------------------------
sessionInfo()

