library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    
    if(input$dist == "normal"){
      distPlot <- hist(rnorm(input$nObs, mean = input$normMean, sd = input$normSd),
                       main = paste("Histogram of Normal Distribution"),
                       xlab = NULL)
    }
    else if(input$dist == "binom"){
      distPlot <- hist(rbinom(input$nObs, size = input$binomSize, prob = input$binomProb),
                       main = paste("Histogram of Binomial Distribution"),
                       xlab = NULL)
    }
    else if(input$dist == "poisson"){
      distPlot <- hist(rpois(input$nObs, lambda = input$poisLambda),
                       main = paste("Histogram of Poisson Distribution"),
                       xlab = NULL)
    }
    else if(input$dist == "uniform"){
      distPlot <- hist(runif(input$nObs, 
                             min = ifelse(input$unifMin >= input$unifMax,
                                          (input$unifMax - 1),
                                          input$unifMin),
                             max = ifelse(input$unifMin >= input$unifMax,
                                          (input$unifMin + 1),
                                          input$unifMax)),
                       main = paste("Histogram of Uniform Distribution"),
                       xlab = NULL)
    }
    else if(input$dist == "geometric"){
      distPlot <- hist(rgeom(input$nObs,prob = input$geomProb),
                       main = paste("Histogram of Geometric Distribution"),
                       xlab = NULL)
    }
    else if(input$dist == "nbinom"){
      distPlot <- hist(rnbinom(input$nObs, size = input$nbinomSize, prob = input$nbinomProb),
                       main = paste("Histogram of Negative Binomial Distribution"),
                       xlab = NULL)
    }
    
  })
  
})
