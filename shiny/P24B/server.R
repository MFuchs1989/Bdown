library(shiny)
library(ggplot2)


movie2 = read.csv("movie2.csv")

function(input, output) {
  
  
  output$scatterplot <- renderPlot({
    ggplot(data = movie2, aes_string(x = input$x, y = input$y,
                                     color = input$z)) +
      geom_point(alpha = input$alpha)
  })
}



