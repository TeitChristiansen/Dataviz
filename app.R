#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(tidyverse)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Datavisualisering", title = div(img(heigh = 100, Width = 125, src = "dania.logo.png"))),
    
    theme = shinytheme("cosmo"),
    
    headerPanel("dataanalyse er niiice"),
    
    

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("xaxis", "vælg x-akse", choices = names(K2_passat), selected = "km_per_liter", TRUE, multiple= FALSE),
            
            selectInput("yaxis", label = "vælg y-akse", choices = names(K2_passat), multiple = FALSE),
            sliderInput("size", "vælg størrelse på punkter",
                        min = 1,
                        max = 20,
                        value = 5),
      
            submitButton("lav ændringer"),
            
            ),

    
    # Show a plot of the generated distribution
        mainPanel(
            "her er plots værsgo",
            
            tabsetPanel(id = "tabs",
                        tabPanel("plot", plotOutput("plot")),
                        tabPanel("tabel", tableOutput("tabel"))),
            
            
          
        )
    )

)
# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$plot <- renderPlot({
        ggplot(K2_passat, aes(x= input$xaxis, y = input$yaxis)) + 
        geom_point()
    })

    
}

# Run the application 
shinyApp(ui = ui, server = server)
