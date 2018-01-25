library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Next Word Predict"),
  
  # Sidebar with a text input
  sidebarLayout(
    sidebarPanel(
        textAreaInput("text",
                      "Input",
                      value = "",
                      placeholder = "Type your input words here")
    ),
    
    
    # Show the predicted next words
    mainPanel(
        
        verbatimTextOutput("hint"),
        
        tableOutput('table')
    
    )
  )
))
