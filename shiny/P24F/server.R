library(shiny)
library(ggplot2)
library(tools)


movie2 = read.csv("movie2.csv")

server <- function(input, output, session) {
  
 
  output$scatterplot <- renderPlot({
    ggplot(data = movie2, aes_string(x = input$x, y = input$y, color = input$z)) +
      geom_point(alpha = input$alpha, size = input$size) +
      labs(title = isolate({ input$plot_title }) )
  })
  
}


shinyApp(ui = ui, server = server)






