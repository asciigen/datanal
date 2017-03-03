# install.packages("blockrand")
# install.packages("psych")

# library(psych)
# require(blockrand)

condition <-  block.random( n= 150,c(block = 3,drug = 2))
headTail(condition)
condition
write.csv(condition,"randomized_design.csv")
pairs.panels(condition)
