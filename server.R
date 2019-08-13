PokemonData <- read.csv("PokemonData.csv")

library(shiny)
library(dplyr)
library(DT)

# This section applies the filters set by the user

function(input, output, session) {

    filtered <- reactive({ 
      
    PokemonData %>% filter(generation %in% input$Generation, type1 %in% input$Type1, type2 %in% input$Type2, is_legendary %in% input$Legendary) 
      
    })
    
    output$table1 <- renderDataTable({
        datatable(filtered(), options = list(orderClasses = TRUE, lengthMenu = c(10, 25, 50)))
      })
}
