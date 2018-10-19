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
      
      
      sliderInput(inputId = "alpha", 
                  label = "Alpha:", 
                  min = 0, max = 1, 
                  value = 0.5)
    ),
    
    
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
  )
)
