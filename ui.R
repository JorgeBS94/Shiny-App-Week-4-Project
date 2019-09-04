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
        h4("Instructions"),
        div(style="text-align:justify","We are going to fit 3 different regression models to the mtcars data set. We are interested in the
        relationship between fuel consumption (in miles/gallon) and the engine displacement (cu.in). Judging from
        the plot, such a relationship seems non-linear. Hence, we will fit models of increasing complexity and
        compare their Residual Standard Errors, which should drop when fitting more complicated functions. However, a visual examination
        of the plots allows to observe that high order polynomials may be overfitting the training data. Hence, they will tend
        to generalise badly in a test data set that was never observed before. To use the app, simply click on the boxes
        placed to the left to show one or a combination of the 3 proposed models. This will cause the fitted lines to appear,
        as well as the estimates of the RSE for the selected models."),
        plotOutput("my_plot"),
        h4("Mean value of the response variable (mpg):"),
        textOutput("Mean_res"),
        h4("Residual Standard Error (RSE) of Linear Regression:"),
        textOutput("Mod1"),
        h4("Residual Standard Error (RSE) of Quadratic Regression:"),
        textOutput("Mod2"),
        h4("Residual Standard Error (RSE) of Polynomial Regression:"),
        textOutput("Mod3")
    )
  )
))
