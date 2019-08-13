library(shiny)
library(DT)
library(shinyWidgets)
library(shinythemes)

PokemonData <- read.csv("PokemonData.csv")

# Define UI for the application
shinyUI(fluidPage(
    
    theme = shinytheme("lumen"),
    
    setBackgroundImage(src = "ogpokemon.png"), 
    
    titlePanel(h1("Favorite Pokemon Survey Results")),
    
    sidebarLayout(
            sidebarPanel(h3("Filter by generation, type and legendary status"), 
            pickerInput(inputId = "Generation",label = "Generation",
                        choices = sort(unique(PokemonData$generation)), selected = NULL, multiple = TRUE, options = list(`actions-box` = TRUE)),                         
            pickerInput(inputId = "Type1",label = "Type1",
                        choices = sort(levels(PokemonData$type1)), selected = NULL, multiple = TRUE, options = list(`actions-box` = TRUE)),
            pickerInput(inputId = "Type2",label = "Type2",
                        choices = sort(levels(PokemonData$type2)), selected = "", multiple = TRUE, options = list(`actions-box` = TRUE)),
            pickerInput(inputId = "Legendary",label = "Legendary",
                        choices = sort(unique(PokemonData$is_legendary)), selected = NULL, multiple = TRUE, options = list(`actions-box` = TRUE))),                         

    mainPanel(tabsetPanel(
        
    tabPanel(h3("Pokemon selection"), tags$br(), dataTableOutput('table1')),
          
    tabPanel(h3("Documentation"), br(),
        helpText(h4(
            "This app allows  one to visualize the results from a survey asking more than 50,000 Reddit users on r/Pokemon to vote for their favorite Pokemon. The user is able to filter pokemon based on their generation, type and legendary status. A table will be presented as a result. The table can then be ordered by name, vote count and rank.")
            ,br(),
            
        helpText(h4(
                "The Reddit thread which provided the data for this project can be found here: 
                https://www.reddit.com/r/pokemon/comments/c04rvq/survey_testing_the_every_pok%C3%A9mon_is_someones/."),br(),
        helpText(h4(
                    "The source code for this application can be found at: 
                    https://github.com/wowkazmir/Developing-Data-Products.")
            ))
            
            )))
        )
    )))


