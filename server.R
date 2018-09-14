# library----
library(shiny)
library(shinythemes)

# server----
shinyServer(
  function(input, output) { 
    output$fileContents <- renderTable({
      inFile <- input$file_input
      
      if (is.null(inFile))
        return(NULL)
      
      output$verba_text <- renderText({
        ## text <- inFile$datapath
        text <- system("bash checker.bash", intern = TRUE)
      })
      
      read.csv(inFile$datapath) %>% head %>% return
    })
    
    output$verba_text <- renderText({
      text <- "Check Result"
    })
  }
)