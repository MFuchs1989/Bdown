library(shiny)
library(ggplot2)
library(tools)

movie2 = read.csv("movie2.csv")

fluidPage(
  
  
  sidebarLayout(
    
    
    sidebarPanel(
      
      
      textInput(inputId = "plot_title", 
                label = "Plot title", 
                placeholder = "Enter text to be used as plot title"),
      
      
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
                  selected = "Genre"),
      
      sliderInput(inputId = "alpha", 
                  label = "Alpha:", 
                  min = 0, max = 1, 
                  value = 0.5),
      
      
      sliderInput(inputId = "size", 
                  label = "Size:", 
                  min = 0, max = 5, 
                  value = 2)
      
      
    ),
    
    
    mainPanel(
      plotOutput(outputId = "scatterplot")
      
    )
  )
)
