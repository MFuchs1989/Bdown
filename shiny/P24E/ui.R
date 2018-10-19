library(shiny)
library(ggplot2)

movie2 = read.csv("movie2.csv")

fluidPage(
  
  
  sidebarLayout(
    
    
    sidebarPanel(
      
      
      selectInput(inputId = "y", 
                  label = "Y-axis:",
                  choices = c("Spielfilmlaenge", "Bewertung", "Waehlerstimmen", "Einnahmen", "Metascore"), 
                  selected = "Bewertung"),
      
      
      selectInput(inputId = "x", 
                  label = "X-axis:",
                  choices = c("Spielfilmlaenge", "Bewertung", "Waehlerstimmen", "Einnahmen", "Metascore"), 
                  selected = "Spielfilmlänge")
      
    ),
    
    
    mainPanel(
      plotOutput(outputId = "scatterplot"),
      textOutput(outputId = "avg_x"), 
      textOutput(outputId = "avg_y"), 
      verbatimTextOutput(outputId = "lmoutput")
    )
  )
)
