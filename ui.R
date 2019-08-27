library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Example of overfitting in the mtcars dataset"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        checkboxInput("showMod1","Show Linear Regression"),
        checkboxInput("showMod2","Show Quadratic Regression"),
        checkboxInput("showMod3","Show Polynomial Degree 6 Regression")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("my_plot"),
       h3("Residual Sum of Squares Linear Regression:"),
       textOutput("Mod1"),
       h3("Residual Sum of Squares Quadratic Regression:"),
       textOutput("Mod2"),
       h3("Residual Sum of Squares Polynomial 4 Regression:"),
       textOutput("Mod3")
    )
  )
))
