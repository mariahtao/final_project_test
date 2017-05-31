
library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(navbarPage('Data on Marvel Characters', 
                   tabPanel('Graph of Gender vs. Appearnces for Marvel Characters',
                            # Application title
                            titlePanel('Marvel Data'),
                            # Sidebar with a select input for both variables
                            sidebarLayout(
                              sidebarPanel(
                                # Chance color of the plot
                                selectInput('variable1', label = 'Gender',choices = list('Male','Female')),
                                selectInput("variable2", label = 'Apperances',choices = list('Appearances'))
    ),
    # Show a plot of the generated distribution
    mainPanel(
      h2("Introduction:"),
      h4("This dataset is to show how gender affects the appearance times for the character."),
      plotlyOutput("map"),
      h2("Conclusion:"),
      h4("In conclusion this dataset shows that the male characetrs are featured more than female characters.")
    )
  )
))
)
