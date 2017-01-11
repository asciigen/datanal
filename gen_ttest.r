---
title: "classification bt T-test"
author: "rakesh sharma, Deepak sharma"
date: "December 30, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r}
piclo <- read.csv("G:/udacity/piclo.csv")
piclo$reg <- as.double(paste(piclo$reg))
piclo$reg[5]  <- 64.0

```

T-test
```{r}

trt_group<-split(piclo,piclo$Treatmentsa.b,drop=FALSE)
trt_group
trt_group[1:3]
trt_group1<-trt_group[1-2]
out <- lapply(1:length(trt_group1),function (x) out[[x]]<- t.test(trt_group1[[x]]$reg))
out
trt_group2<-trt_group[1-3]
out2 <- lapply(1:length(trt_group2),function (x) out[[x]]<- t.test(trt_group2[[x]]$reg))
out2
```
```{r}
dt_result = piclo %>% group_by(Treatmentsa.b) %>% do(tidy(t.test(piclo$reg~piclo$Treatmentsa.b)))
#dt_result


```
For sorting
```{r}
piclo <- piclo[order(piclo$Treatmentsa.b),]
piclo
rownames(piclo) <- 1:nrow(piclo)
piclo

```
Apply T-test on two group
```{r}
twogrp <- piclo[1:15,]
View(twogrp)
lapply(twogrp[,c("reg", "emb", "trn")], function(x) t.test(x ~ twogrp$Treatmentsa.b, var.equal = TRUE))

```
```{r}
trt_group<-split(Iris,Iris$Species,drop=FALSE)
trt_group
trt_group[1:3]
trt_group1<-trt_group[1-2]
out <- lapply(1:length(trt_group1),function (x) out[[x]]<- t.test(trt_group1[[x]]$Sepal.length))
out
trt_group2<-trt_group[1-3]
out2 <- lapply(1:length(trt_group2),function (x) out[[x]]<- t.test(trt_group2[[x]]$Sepal.length))
out2
```
```