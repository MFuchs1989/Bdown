
library(shiny)
library(tidyverse)



ui <- fluidPage(
  
  
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


server <- function(input, output) {
  
  
  output$scatterplot <- renderPlot({
    ggplot(data = movie2, aes_string(x = input$x, y = input$y,
                                     color = input$z)) +
      geom_point()
  })
}

shinyApp(ui = ui, server = server)




