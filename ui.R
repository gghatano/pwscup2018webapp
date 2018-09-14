
# library----
library(shiny)
library(shinythemes)

# ui----
shinyUI(
  fluidPage(theme = shinytheme("spacelab"),
            titlePanel("F format checker"),
            fluidRow(
              column(4,
                     fileInput("file_input",label = "Input File:"),
                     tableOutput("fileContents") 
              ),
              column(4,
                     verbatimTextOutput("verba_text") 
              )
            )
  )
)