################################################
#                 PRACTICA 1,                  #
#                 ERICK J. PINEDA AMÉZQUITA    #
#                 17012140                     #
################################################



#install.packages("shinythemes")

library(shiny)
library(DT)
library(dplyr)
library(ggplot2)

shinyUI(fluidPage(
  
  titlePanel("Carga de archivos y libreria DT"),
  tabsetPanel(
    tabPanel("Cargar Archivo",
             sidebarLayout(
               sidebarPanel(
                 h2("Cargar Archivo 1 (.csv o .tsv)"),
                 fileInput("upload_file_1",
                           label = "Seleccione un archivo",
                           buttonLabel = "Cargar",
                           accept = c(".csv", ".tsv"))
               ),
               mainPanel(
                 tableOutput("contenido_archivo_1")
               )
             )),
    
    tabPanel("Carga Archivo DT",
             sidebarLayout(
               sidebarPanel(
                 h2("Cargar Archivo 2 (.csv o .tsv)"),
                 fileInput("upload_file_2",
                           label = "Seleccione un archivo",
                           buttonLabel = "Cargar",
                           accept = c(".csv", ".tsv"))
               ),
               mainPanel(
                 DT::dataTableOutput("contenido_archivo_2")
               )
             )),
    
    tabPanel("DT Option",
             h2("Formato Columna"),
             
             h3("Set de datos DIAMOND"),
             hr(),
             fluidRow(
               column(width = 12,
                      DT::dataTableOutput("tabla1"))),
             
             h2("Opciones, Filtros en columnas y descarga CSV"),
             h3("Set de datos MTCARS"),
             hr(),
             fluidRow(
               column(width = 12,
                      DT::dataTableOutput("tabla2"))),
             fluidRow(
               h3("Set de datos IRIS"),
               column(width = 12,
                      DT::dataTableOutput("tabla3")))
    ),
    tabPanel("Clicks en tabla",
             h2("Se presentan varios ejemplos para la selección de columnas y filas"),
             h3("Ojo: Observar que el resultado de la selección se despliega en un área de texto"),
             fluidRow(
               column(width = 12,
                      h2("Click en una fila"),
                      dataTableOutput("tabla4"),
                      verbatimTextOutput("tabla_4_single_click"))),
             
             fluidRow(
               column(width = 12,
                      h2("Click en multiples filas"),
                      dataTableOutput("tabla5"),
                      verbatimTextOutput("tabla_5_multi_click"))),
             fluidRow(
               column(width = 12,
                      h2("Click en una columna"),
                      dataTableOutput("tabla6"),
                      verbatimTextOutput("tabla_6_single_click"))),
             fluidRow(
               column(width = 12,
                      h2("Click en multiples columnas"),
                      dataTableOutput("tabla7"),
                      verbatimTextOutput("tabla_7_multi_click"))),
             fluidRow(
               column(width = 12,
                      h2("Click en una celda"),
                      dataTableOutput("tabla8"),
                      verbatimTextOutput("tabla_8_single_click"))),
             fluidRow(
               column(width = 12,
                      h2("Click en multiples celdas y despliegue de resultado (print) "),
                      dataTableOutput("tabla9"),
                      verbatimTextOutput("tabla_9_multi_click"))
             ))
  )
))