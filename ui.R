

source('./script/gender_ID.R')


# Read in libraries
library(shiny)
library(plotly)

# Side panel requirement 
shinyUI(navbarPage('Data on Marvel Characters', 
                   tabPanel('Gender and ID for Marvel Data',
                            # Application title
                            titlePanel('Gender in relation to ID and living characters'),
                            # Sidebar with a select input for both variables
                            sidebarLayout(
                              sidebarPanel(
                                selectInput("variable1", label = 'X',choices=list('ID')),
                                # Options for y axis
                                selectInput("variable2", label = 'Y',choices=list('Gender'))
                              ),
                              # Show a plot of the generated distribution
                              mainPanel(
                                h2("Introduction:"),
                                h4("This dataset is to show how gender affects the how a character identifies with their ID."),
                                plotlyOutput('map'),
                                h2("Conclusion:"),
                                h4("In conclusion this dataset shows that the male characetrs are featured more than female characters.")
                              )
                            )
                   )
))
