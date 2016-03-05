# Libreria de graficos
library(ggplot2)

data <- read.csv2("./listas/INE.csv", header = FALSE, sep=",",dec=".", row.names=c("Carreras",rep(c("Hombres","Mujeres"),2)))


prueba <- c("Hombres", "Mujeres")

prueba**2
rep(prueba,2)