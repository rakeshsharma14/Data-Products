
library(shiny)
library(ggplot2)
library(tidyverse)
library(curl)

### Define server logic

shinyServer(function(input, output) {
  
  ## load the data
  
  data(diamonds)
  
  ## create the initial output
  
  output$distPlot <- renderPlot({
    
    # draw the diamonds data and its influence regarding carat and price
    
    p <-
      ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point()
    p <-
      p + geom_smooth(method = "lm") + xlab("Carat") + ylab("Price")
    p <- p + xlim(0, 6) + ylim (0, 20000)
    p
  }, height = 700)
  
  
  # create linear model
  
  output$predict <- renderPrint({
    
    fit <- lm(price~carat,data=diamonds)
    
    unname(predict(fit, data.frame(carat = input$lm)))
  })
  
})