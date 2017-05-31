# Read in libraries
library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)

source('./graphfunction.R')
df <- read.csv(file="TheDataIWantToReadIn.csv", header=TRUE)

# Define server logic to plot graph
shinyServer(function(input, output) { 
  # Returning the map with plotly
  output$map <- renderPlotly({ 
    variable1.input <- switch(input$variable1, 
                              'Male' = df$sex,
                              'Female' = df$sex)
    variable2.input <- switch(input$variable2, 
                              'Appearances' = df$APPEARANCES)
    return(graphData(df, variable1.input, variable2.input, input$variable1,input$variable2))
  }) 
})
