library(shiny)
library(ggplot2)


movie2 = read.csv("movie2.csv")

server <- function(input, output) {
  
  
  output$scatterplot <- renderPlot({
    ggplot(data = movie2, aes_string(x = input$x, y = input$y,
                                     color = input$z)) +
      geom_point()
  })
  
  output$correlation <- renderText({
    r <- round(cor(movie2[, input$x], movie2[, input$y], use = "pairwise"), 3)
    paste0("Correlation = ", r, "Beachte: Wenn die Beziehung zwischen den zwei Variablen nicht linear ist, wird der Korrelationskoeffizient nicht sinnvoll sein.")
    
    
  })
}





