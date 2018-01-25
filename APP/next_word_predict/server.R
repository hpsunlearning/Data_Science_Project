library(shiny)
library(data.table)

source("function.R")
load("data.RData")

shinyServer(function(input, output) {
    
    output$table <- renderTable({
        x = input$text
        x = gsub(",|\\.|;|:"," ",x)
        y = unlist(strsplit(x,split=" "))
        y = y[which(y!="")]
        if (length(y)<1) {
            res = ""
        }else {
            res = SB_Word_predict(n4,n3,n2,n1,y)[,1]
        }
        res
    
    },rownames = TRUE)

    output$hint <- renderText({
        x = input$text
        x = gsub(",|\\.|;|:"," ",x)
        y = unlist(strsplit(x,split=" "))
        y = y[which(y!="")]      
        if (length(y)<1) {
            res = "Please enter at least one word, English only"
        }else {
            res = "Here comes the predict:"
        }
        res
   
   })

})
