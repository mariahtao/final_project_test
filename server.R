# Read in libraries

library(plotly)
library(dplyr)
library(png)

# Identifying source and reading in data
source('./script/gender_ID.R')
df <- read.csv("data/marvel-wikia-data.csv", stringsAsFactors = FALSE)

# Define server logic to plot circular graph graph
shinyServer(function(input, output) { 
  output$circularPlot <- renderPlot({
    selection <- input$variable
    return(CircleGraph(df, selection))
  })
})
