#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Statistical Distributions"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    mainPanel(
      plotOutput("distPlot")
    ),
    sidebarPanel(
      selectInput(inputId = "dist",
                  label = "Choose a distribution:",
                  choices = c("Normal" = 'normal',
                              "Binomial" = 'binom',
                              "Poisson" = 'poisson',
                              "Uniform" = 'uniform',
                              "Geometric" = 'geometric',
                              "Negative Binomial" = "nbinom"
                              )),
      sliderInput(inputId = 'nObs',
                  label = 'Number of Observations',
                  min = 1,
                  max = 1000,
                  value = 10),
      
      conditionalPanel(
        condition = "input.dist == 'normal'",
        sliderInput("normMean", "Mean", min=0, max=1000, value=0),
        sliderInput("normSd", "Standart Deviation", min=1, max=1000, value=1)
      ),
      conditionalPanel(
        condition = "input.dist == 'binom'",
        sliderInput("binomSize", "Number of Trails", min=1, max=1000, value=5),
        sliderInput("binomProb", "Probability of Success on each trail", min=0, max=1, value=0.4)
      ),
      conditionalPanel(
        condition = "input.dist == 'poisson'",
        sliderInput("poisLambda", "Lambda", min=0.00, max=1.00, value=0.05)
      ),
      conditionalPanel(
        condition = "input.dist == 'uniform'",
        sliderInput("unifMin", "Lower Limit", min=0, max=1000, value=75),
        sliderInput("unifMax", "Upper Limit", min=1, max=1000, value=100)
      ),
      conditionalPanel(
        condition = "input.dist == 'geometric'",
        sliderInput("geomProb", "Probability of Success in each trial", min=0, max=1, value=0.15)
      ),
      conditionalPanel(
        condition = "input.dist == 'nbinom'",
        sliderInput("nbinomSize", "Target for number of successful trials", min=1, max=1000, value=50),
        sliderInput("nbinomProb", "Probability of Success in each trail", min=0, max=1, value=0.7)
      )
    )
    
    # Show a plot of the generated distribution
    
  )
))
