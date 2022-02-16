data<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
which(data$ACR==3 & data$AGS==6)
install.packages("jpeg")
library(jpeg)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg" , "A:/Pictures/rquiz.jpeg",mode="wb")
imag_data<-readJPEG("A:/Pictures/rquiz.jpeg",native = TRUE)
quantiles<-quantile(imag_data,probs = c(0.30, 0.80))

plot(imag_data)
quantile(imag_data,.80)
?quantile
?download.file
installed.packages("dplyr")
library(dplyr)
read_File <- readLines("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")
GPD_data<-read.csv(textConnection(read_File[c(-1,-2,-3,-5)]),header = TRUE)
GPD_data<-rename(GPD_data, CountryCode=X)
EDU_data<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")

merged_Data<-merge(GPD_data,EDU_data, by=c("CountryCode"))
merged_Data$Ranking<-as.numeric(merged_Data$Ranking)
sorted_MD<-arrange(merged_Data, desc(Ranking))
tapply(sorted_MD$Ranking,sorted_MD$Income.Group, mean,na.rm=TRUE)

install.packages("Hmisc")
library(Hmisc)

groups<-cut2(merged_Data$Ranking,g=5,na.rm=TRUE)
table(groups,merged_Data$Income.Group)
