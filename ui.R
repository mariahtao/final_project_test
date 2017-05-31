
library(shiny)
library(plotly)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(navbarPage('Data on Marvel Characters', 
                   tabPanel('Gender and ID for Marvel Data',
                            # Application title
                            titlePanel('Gender vs ID'),
                            # Sidebar with a select input for variables
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("variable1", label = 'ID',choices = list("Secret Identity", "Public Identity", "No Dual Identity", "Known to Authorities Identity"))
    ),
    # Suumary and Conclusion 
    mainPanel(
      h2("Introduction:"),
      h4("This dataset is to show how gender affects the how a character identifies with their ID."),
      plotlyOutput("circularPlot"),
      h2("Conclusion:"),
      h4("In conclusion this dataset shows that the male characetrs are featured more than female characters.")
    )
  )
))
)
