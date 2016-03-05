#!/usr/bin/python
# -*- coding: utf-8 -*-

import csv

archivo_dibujitos = "../simbolos/simbolos_UGR.csv"
archivo_datos = "../listas/201415matriculasgradoramas.csv"
archivo_plantilla = "plantilla.html"
archivo_salida = "../index.html"

churro_commpleto = ""
icono = {}

with open(archivo_plantilla, 'r') as plantilla:
    pagina_completa = plantilla.read()

with open(archivo_dibujitos, 'r') as dibujitos:
    lista_dibujitos = csv.reader(dibujitos,delimiter='\t')

    # Nos saltamos la primera línea
    lista_datos.next()

    for fila in lista_dibujitos:
        try:
            icono[fila[0]] = fila[1]
        except IndexError:
            pass

with open(archivo_datos, 'r') as datos:
    lista_datos = csv.reader(datos)

    # Nos saltamos la primera línea
    lista_datos.next()
    for fila in lista_datos:
        try:
            churro_hombres = ("<span class='hombres' title='" + fila[1] + " (hombres)'>" + icono[fila[1]] + "</span> ") * int(fila[2])
            churro_mujeres = ("<span class='mujeres' title='" + fila[1] + " (mujeres)'>" + icono[fila[1]] + "</span> ") * int(fila[3])

        except KeyError:
            churro_hombres = ("<span class='hombres' title='" + fila[1] + " (hombres)'>X</span> ") * int(fila[2])
            churro_mujeres = ("<span class='mujeres' title='" + fila[1] + " (mujeres)'>X</span> ") * int(fila[3])

        churro_commpleto = churro_commpleto + churro_hombres + churro_mujeres

pagina_completa = pagina_completa.replace("[REPLACE]", churro_commpleto)


with open(archivo_salida, 'w') as pagina:
    pagina.write(pagina_completa)

# print churro_commpleto
