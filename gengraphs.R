# Libreria de graficos
library(ggplot2)

# Suponemos utf8
trabajando <- read.csv2(  "./listas/INE.csv", 
                          col.names=c("Carreras",rep(c("Hombres","Mujeres"),3)),
                          header = FALSE, 
                          sep=",",
                          dec="."
                        )
                        
matriculas <- read.csv2(  "./listas/201415matriculasgradoramas.csv",
                          col.names = c("Ramas","Carreras","Hombres","Mujeres","Total"), 
                          header = TRUE, 
                          sep=","
                        )


# Limpiamos un poco el dataset
trabajando <- na.omit( trabajando )




# Number of columns of dataset
n <- ncol(trabajando)

trabajando.titul <- sapply( trabajando$Carreras, tolower )
matriculas.titul <- sapply( matriculas$Carreras, tolower )
# Asignaturas comunes a los dos datasets
comunes <- intersect( trabajando.titul, matriculas.titul)



trabajando <- trabajando[ order( trabajando$Carreras ), ]
matriculas <- matriculas[ order( matriculas$Carreras ), ]



trabajando <- trabajando[,c(1,n-1,n)]
matriculas<- matriculas[ c("Carreras", "Hombres", "Mujeres") ]

