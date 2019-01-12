

library(shiny)
library(ggplot2)

# load data

data("diamonds")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Application title
  titlePanel("Predict Diamond Price with Carat"),
  
  sidebarLayout(
    sidebarPanel(
      h4("Select Carat"),
      
      sliderInput(
        "lm",
        "Carat",
        min = min(diamonds$carat),
        max = max(diamonds$carat),
        value = max(diamonds$carat) / 2,
        step = 0.1
      ),
      
      h4("Predicted Price"),
      
      verbatimTextOutput("predict"),
      
      width = 4
    ),
    
    # Show a plot of the carat/price relationship
    
    mainPanel(tabsetPanel(
      tabPanel("Plot", plotOutput("distPlot"))
      ))
    )
  ))