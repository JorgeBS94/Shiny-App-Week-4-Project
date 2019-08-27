library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    #Load the dataset
    dataset <- mtcars
    
    #Create models
    model1 <- lm(mpg~disp,data = dataset)
    model2 <- lm(mpg~disp+I(disp^2),data = dataset)
    model3 <- lm(mpg~poly(disp,6),data = dataset)
    
    #Create the plot as an output
    output$my_plot <- renderPlot({
      g <- ggplot(aes(x = disp,y = mpg),data = dataset) + geom_point() + theme_bw() +
            labs(x = "Car weight(Kg)",y = "Miles per gallon", title = "Car consumption vs weight") +
            theme(plot.title = element_text(hjust = 0.5,face = "bold",color = "orange"),axis.title.x = element_text(face = "bold"),
                axis.title.y = element_text(face = "bold"),legend.text = ) + 
          scale_color_manual(name="Model",labels=c("Linear","Quadratic","Polynomial 10"),
                             values=c("red","green","blue"))
      print(g)
      #Now we add the regression lines depending on the user inputs
      if(input$showMod1){
          dataset <- cbind(dataset,pred1 = predict(model1))
          g <- g + geom_line(aes(x = disp,y=pred1,colour = "red"),dataset)
          print(g)
      }
      if(input$showMod2){
          dataset <- cbind(dataset,pred2 = predict(model2))
          g <- g + geom_line(aes(x = disp,y = pred2,colour = "green"),dataset)
          print(g)
      }
      if(input$showMod3){
          dataset <- cbind(dataset,pred3 = predict(model3))
          g <- g + geom_line(aes(x = disp,y = pred3,colour = "blue"),dataset)
          print(g)
      }
    })
    
    #Add the RSE of each model
    output$Mod1 <- renderText({
        if(input$showMod1){
            summary(model1)$sigma
        }
        })
    output$Mod2 <- renderText({
        if(input$showMod2){
            summary(model2)$sigma
        }
    })
    output$Mod3 <- renderText({
        if(input$showMod3){
            summary(model3)$sigma
        }
    })
  
})
