# library----
library(shiny)
library(shinythemes)
library(dplyr)

# server----
shinyServer(
  function(input, output) { 
    ## check A file
    output$fileContents_A <- renderTable({
      inFile_A<- input$file_input_A
      if (is.null(inFile_A))
        return(NULL)
      
      output$verba_text_A <- renderText({
        
        ## data path
        datapath_A = inFile_A$datapath
        datapath_T = "/srv/shiny-server/pwscup2018webapp/pwscup2018sample/drill/data/T.csv"
        
        ## execute 
        command = paste("/bin/bash ./checker-A.bash", 
                        datapath_T, datapath_A, 
                        sep =" ")
        system(command)
        lines = readLines("./res.txt")
        text = paste(lines, collapse = "\n")
        
        if( text == "" ){
          text = "OK!"
        }
        
        text %>% return
      })
      
      read.csv(inFile_A$datapath, header = FALSE) %>% 
        head %>% return
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
      
      read.csv(inFile_F_A$datapath, header=FALSE) %>% 
        select(1,2) %>% head %>% return
    })
    
    ## F checker F
    output$fileContents_F_F <- renderTable({
      inFile_F_F <<- input$file_input_F_F
      if (is.null(inFile_F_F))
        return(NULL)
      
      output$verba_text_F <- renderText({
        
        datapath_F_A = inFile_F_A$datapath
        datapath_F_F = inFile_F_F$datapath
        datapath_F_T = "/srv/shiny-server/pwscup2018webapp/pwscup2018sample/drill/data/T.csv"
        
        command = paste("/bin/bash ./checker-F.bash", 
                        datapath_F_T, datapath_F_A, datapath_F_F, 
                        sep =" ")
        ## execute
        system(command)
        
        ## cleanup result
        lines = readLines("./res.txt")
        # system("pwd")
        text = paste(lines, collapse = "\n")
        
        if( text == "" ){
          text = "OK!"
        }
        
        text %>% return
      })
      
      ## display dataset 
      read.csv(inFile_F_F$datapath, header = FALSE) %>% 
        select(1,2) %>% head %>% return
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
