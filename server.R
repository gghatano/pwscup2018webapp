# library----
library(shiny)
library(shinythemes)
library(dplyr)

# server----
shinyServer(
  function(input, output) { 
    ## check A file
    output$fileContents_A <- renderTable({
      inFile <- input$file_input_A
      if (is.null(inFile))
        return(NULL)
      
      output$verba_text_A <- renderText({
        system("ls -l > ./res.txt")
        lines = readLines("res.txt")
        system("rm ./res.txt")
        text = paste(lines, collapse = "\n")
        print(text)
        # text = inFile$datapath
      })
      
      read.csv(inFile$datapath) %>% return
    })
    
    
    ## F checker A
    output$fileContents_F_A <- renderTable({
      inFile_F_A <<- input$file_input_F_A
      if (is.null(inFile_F_A))
        return(NULL)
      
      output$verba_text_F <- renderText({
        text = "次はFファイルをアップロード"
        text %>% return
      })
      
      read.csv(inFile_F_A$datapath) %>% return
    })
    
    ## F checker F
    output$fileContents_F_F <- renderTable({
      inFile_F_F <<- input$file_input_F_F
      if (is.null(inFile_F_F))
        return(NULL)
      
      output$verba_text_F <- renderText({
        # text = inFile_F_F$datapath
        datapath_F_A = inFile_F_A$datapath
        datapath_F_F = inFile_F_F$datapath
        datapath_F_T = "./pwscup2018sample/drill/data/T.csv"
        
        command = paste("bash ./checker-F.sh", datapath_F_T, datapath_F_F, datapath_F_A, "&> ./res.txt", sep =" ")
        
        ## cleanup result
        system("ls -l > ./res.txt")
        lines = readLines("res.txt")
        system("rm ./res.txt")
        text = paste(lines, collapse = "\n")
        
        text %>% return
      })
      
      read.csv(inFile_F_F$datapath) %>% return
    })
    
    #### default verba_text
    output$verba_text_A <- renderText({
      text <- "Aファイルをアップロードしてください"
    })
    output$verba_text_F <- renderText({
      text <- "まずはAファイルをアップロードしてください"
    })
  }
)