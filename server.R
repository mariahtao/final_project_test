
# Read in libraries
library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)

# Identifying source and reading in data
source('./script/gender_ID.R') 
marvel.data <- read.csv("data/marvel-wikia-data.csv", stringsAsFactors = FALSE)

# Define server logic to plot graph
shinyServer(function(input, output) { 
  # Returning the map with plotly
  output$map <- renderPlotly({ 
    variable1.input <- switch(input$variable1, 
                              'Gender' = marvel.data$SEX)
    variable2.input <- switch(input$variable2, 
                              'ID' = marvel.data$ID)
    return(graphData(marvel.data, variable1.input, variable2.input, input$variable1, input$variable2))
  }) 
})