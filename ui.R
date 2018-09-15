# library----
library(shiny)
library(shinythemes)

# ui----
shinyUI(navbarPage(
  "checker",
  tabPanel("About",
    fluidRow(
      column(12,
        includeMarkdown("about.md")
      )
    )),
  tabPanel("[作成中]Utility",
    titlePanel("Utility"),
    fluidRow(
      column(
        3,
        h4("Aファイル"),
        fileInput("file_input_U", label = NULL, buttonLabel = "Select A file"),
        tableOutput("fileContents_U")
      )
    )),
  tabPanel("A checker",
    fluidPage(
      titlePanel("A Format Checker"),
      fluidRow(
        column(
        3,
        h4("Aファイル"),
        fileInput("file_input_A", label = NULL, buttonLabel = "Select A file"),
        tableOutput("fileContents_A")
      ),
      column(3),
      column(6,
        h4("フォーマット確認結果を表示"),
        verbatimTextOutput("verba_text_A")
      )
    ))
  ),
  tabPanel("F checker",
    fluidPage(
      titlePanel("F Format Checker"),
      fluidRow(
      column(
        3,
        h4("Aファイル"),
        fileInput("file_input_F_A", label = NULL, buttonLabel = "Select A file"),
        tableOutput("fileContents_F_A")
      ),
      column(
        3,
        h4("Fファイル"),
        fileInput("file_input_F_F", label = NULL, buttonLabel = "Select F file"),
        tableOutput("fileContents_F_F")
      ),
      column(6,
        h4("フォーマット確認結果を表示"),
        verbatimTextOutput("verba_text_F"))
    )))
))
