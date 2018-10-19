library(shiny)
library(ggplot2)
library(tidyverse)


movie2 = read.csv("movie2.csv")

server <- function(input, output) {
  
  
  output$scatterplot <- renderPlot({
    ggplot(data = movie2, aes_string(x = input$x, y = input$y)) +
      geom_point()
  })
  
  
  output$avg_x <- renderText({
    avg_x <- movie2 %>% pull(input$x) %>% mean() %>% round(2)
    paste("Average", input$x, "=", avg_x)
  })
  
  
  output$avg_y <- renderText({
    avg_y <- movie2 %>% pull(input$y) %>% mean() %>% round(2)
    paste("Average", input$y, "=", avg_y)
  })
  
  
  output$lmoutput <- renderPrint({
    x <- movie2 %>% pull(input$x)
    y <- movie2 %>% pull(input$y)
    summ <- summary(lm(y ~ x, data = movie2)) 
    print(summ, digits = 3, signif.stars = FALSE)
  })
  
}




