library(readr)
library(dplyr)
aaa103 <- read_csv("C:/Users/User/Desktop/bigdata/103aaa.csv")
aaa104 <- read_csv("C:/Users/User/Desktop/bigdata/104aaa.csv")
aaa105 <- read_csv("C:/Users/User/Desktop/bigdata/105aaa.csv")
aaa106 <- read_csv("C:/Users/User/Desktop/bigdata/106aaa.csv")

aaa103<-aaa103[,c(-3,-4,-5,-6,-7,-8,-9,-10)]
aaa104<-aaa104[,c(-3,-4,-5,-6,-7,-8,-9,-10)]
aaa105<-aaa105[,c(-3,-4,-5,-6,-7,-8,-9,-10)]
aaa106<-aaa106[,c(-3,-4,-5,-6,-7,-8,-9,-10)]

for(i in c(1:6)){#把第1到7欄位的vector分別取出來
  aaa103[[i]]<-gsub("—|…|、|_","",aaa103[[i]])#把—和…取代成空字串
}
for(i in c(1:6)){
  aaa104[[i]]<-gsub("—|…|、|_","",aaa104[[i]])
}
for(i in c(1:6)){
  aaa105[[i]]<-gsub("—|…|、|_","",aaa105[[i]])
}
for(i in c(1:6)){
  aaa106[[i]]<-gsub("—|…|、|_","",aaa106[[i]])
}

a103106<-inner_join(aaa103,aaa106,by="大職業別")
a103106$兩年度薪資比例<-as.numeric(a103106$`大學-薪資.y`)/as.numeric(a103106$`大學-薪資.x`)
a103106<-arrange(a103106,desc(兩年度薪資比例))
b103106<-a103106[a103106$兩年度薪資比例>1,]
b103106<-na.omit(b103106)
b103106$大職業別
head(b103106$大職業別,10)

c103106<-a103106[a103106$兩年度薪資比例>1.05,]
c103106<-na.omit(c103106)
c103106$大職業別
career<-c()
for(i in c(1:nrow(c103106))){
  career<-c(career,strsplit(c103106$大職業別,"-")[[i]][1])
}
knitr::kable(table(career))



bbb103<-aaa103
bbb103$`大學-女/男`<-as.numeric(bbb103$`大學-女/男`)
bbb103<-na.omit(bbb103)
ratio103<-bbb103[bbb103$`大學-女/男`<100,]
ratio103<-arrange(ratio103,`大學-女/男`)

bbb104<-aaa104
bbb104$`大學-女/男`<-as.numeric(bbb104$`大學-女/男`)
bbb104<-na.omit(bbb104)
ratio104<-bbb104[bbb104$`大學-女/男`<100,]
ratio104<-arrange(ratio104,`大學-女/男`)

bbb105<-aaa105
bbb105$`大學-女/男`<-as.numeric(bbb105$`大學-女/男`)
bbb105<-na.omit(bbb105)
ratio105<-bbb105[bbb105$`大學-女/男`<100,]
ratio105<-arrange(ratio105,`大學-女/男`)

bbb106<-aaa106
bbb106$`大學-女/男`<-as.numeric(bbb106$`大學-女/男`)
bbb106<-na.omit(bbb106)
ratio106<-bbb106[bbb106$`大學-女/男`<100,]
ratio106<-arrange(ratio106,`大學-女/男`)

compare<-rbind(ratio103,ratio104,ratio105,ratio106)
knitr::kable(compare)
knitr::kable(data.frame("top10_103年"=head(ratio103$大職業別,10),
                        "top10_104年"=head(ratio104$大職業別,10),
                        "top10_105年"=head(ratio105$大職業別,10),
                        "top10_106年"=head(ratio106$大職業別,10)))


ccc103<-aaa103
ccc103$`大學-女/男`<-as.numeric(ccc103$`大學-女/男`)
ccc103<-na.omit(ccc103)
ratio103b<-ccc103[ccc103$`大學-女/男`>100,]
ratio103b<-arrange(ratio103b,desc(`大學-女/男`))

ccc104<-aaa104
ccc104$`大學-女/男`<-as.numeric(ccc104$`大學-女/男`)
ccc104<-na.omit(ccc104)
ratio104b<-ccc104[ccc104$`大學-女/男`>100,]
ratio104b<-arrange(ratio104b,desc(`大學-女/男`))

ccc105<-aaa105
ccc105$`大學-女/男`<-as.numeric(ccc105$`大學-女/男`)
ccc105<-na.omit(ccc105)
ratio105b<-ccc105[ccc105$`大學-女/男`>100,]
ratio105b<-arrange(ratio105b,desc(`大學-女/男`))

ccc106<-aaa106
ccc106$`大學-女/男`<-as.numeric(ccc106$`大學-女/男`)
ccc106<-na.omit(ccc106)
ratio106b<-ccc106[ccc106$`大學-女/男`>100,]
ratio106b<-arrange(ratio106b,desc(`大學-女/男`))

compare1<-rbind(c(2014,"","","","",""),head(ratio104b,10),
               head(ratio105b,10),head(ratio106b,10))
knitr::kable(compare1)


ddd106<-aaa106
ddd106$研究大學比<-as.numeric(ddd106$`研究所及以上-薪資`)/as.numeric(ddd106$`大學-薪資`)
ddd106<-arrange(ddd106,desc(研究大學比))
head(ddd106$大職業別)


eee106<-aaa106
knitr::kable(eee106[eee106$大職業別=="資訊及通訊傳播業",c(2,3,5)])
pro<-as.numeric(eee106[eee106$大職業別=="資訊及通訊傳播業",5])
univisity<-as.numeric(eee106[eee106$大職業別=="資訊及通訊傳播業",3])
pro-univisity

