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
                  selected = "Spielfilmlänge"),
      
      
      selectInput(inputId = "z", 
                  label = "Color by:",
                  choices = c("Bewertung", "Genre"),
                  selected = "Genre")
    ),
    
    
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
  )
)
