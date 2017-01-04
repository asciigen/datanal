drought_data <- read.csv("drought_data_new.csv",header = TRUE, sep = ",")
diff_c_d <- read.csv("drought_control_vs_treated.csv", header = TRUE,sep = ",")
real_c_d <- read.csv("drought_c_d_real.csv",header = TRUE,sep = ",")

pca <- prcomp(real_c_d[,8])
summary(pca)

plot(scale(pca$x[,1]),xlim = c(1,12), xlab = "Cultivars", ylab = "PC1",
          main="Classification using Proline percent changes", pch=c(21),
          bg = c("red", "green","blue")[unclass(real_c_d$Species)],
     legend("topleft", title="Type of Species", inset = 0.01, horiz = TRUE, 
            c("T. Erecta", "T. Patula","T. Tenuifolia"), fill=c("red", "green","blue")))

# a <- text(pca$x[,1], labels = real_c_d$Species, cex=0.7, col="blue")

