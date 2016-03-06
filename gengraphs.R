# Libreria de graficos
library(ggplot2)
rm ( list = ls() )

# Suponemos utf8
trabajando <- read.csv2(  "./listas/INE.csv", 
                          col.names=c("carreras",rep(c("hombres","mujeres"),3)),
                          header = FALSE, 
                          sep=",",
                          dec=".",
                          skip=1,
                          stringsAsFactors = FALSE
                        )               

graduados <- read.csv2(  "./listas/201415matriculasgradoramas.csv",
                          col.names = c("ramas","carreras","hombres","mujeres","Total"), 
                          header = TRUE, 
                          sep=",",
                          stringsAsFactors = FALSE
                        )

# Limpiamos un poco los datasets
trabajando <- na.omit( trabajando )
graduados <- na.omit( graduados )


# Deja los dos datasets con solo las asignaturas comunes
trabajando.titul <- tolower( trabajando$carreras )
graduados.titul <- tolower( graduados$carreras )
comunes <- intersect( trabajando.titul, graduados.titul)

trabajando <- trabajando[ which( is.element( 
                                            tolower( trabajando$carreras ),
                                            comunes 
                                            )
                                )
                        , ]
graduados <- graduados[ which( is.element( 
                                          tolower( graduados$carreras ), 
                                          comunes 
                                          ) 
                               ) 
                        , ]
trabajando <- trabajando[ order( trabajando$carreras ), ]
graduados <- graduados[ order( graduados$carreras ), ]
  



# data frame para representar ratios
data <- data.frame( comunes, 
                    as.numeric(trabajando$hombres) / as.numeric(trabajando$mujeres), 
                    as.numeric(graduados$hombres) / as.numeric(graduados$mujeres )
                  )
colnames(data) <- c("titulacion", "ratio.trabajando", "ratio.graduados" )


graph <-  ggplot(data,aes( x=ratio.graduados,y=ratio.trabajando, colour=titulacion, size=4) ) + 
          xlab("Ratio hombres/mujeres graduados") +
          ylab("Ratio hombres/mujeres trabajando") +
          theme(legend.position="none")+
          geom_point()+
          geom_abline(intercept=0, slope=1, colour="red")
          
graph