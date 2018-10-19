library(shiny)


setwd("C:/Users/Michi/Documents/Bdown/content/shiny/P24a")
movie <- read_csv("IMDB-Movie-Data.csv")

movie %>% separate(Genre, into = c("main genre", "further genre1", "further genre2")) %>% 
  select(Genre = `main genre`, Titel = Title, Spielfilmlänge = `Runtime (Minutes)`, Bewertung = Rating,     Wählerstimmen = Votes, Einnahmen = `Revenue (Millions)`, Metascore) -> movie2


ui <- fluidPage(
  
  
  sidebarLayout(
    
    
    sidebarPanel(
      
      
      selectInput(inputId = "y", 
                  label = "Y-axis:",
                  choices = c("Spielfilmlänge", "Bewertung", "Wählerstimmen", "Einnahmen", "Metascore"), 
                  selected = "Bewertung"),
      
      
      selectInput(inputId = "x", 
                  label = "X-axis:",
                  choices = c("Spielfilmlänge", "Bewertung", "Wählerstimmen", "Einnahmen", "Metascore"), 
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