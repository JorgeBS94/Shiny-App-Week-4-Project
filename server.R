library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    #Load the dataset
    dataset <- mtcars
    
    #Create models
    model1 <- lm(mpg~disp,data = dataset)
    model2 <- lm(mpg~disp+I(disp^2),data = dataset)
    model3 <- lm(mpg~poly(disp,6),data = dataset)
    dataset <- cbind(dataset,pred1 = predict(model1),pred2 = predict(model2),pred3 = predict(model3))
    
    #Create the plot as an output
    output$my_plot <- renderPlot({
        g <- ggplot(aes(x = disp,y = mpg),data = dataset) + geom_point() + theme_bw() +
            labs(x = "Car weight(Kg)",y = "Miles per gallon", title = "Fuel consumption vs weight") +
            theme(plot.title = element_text(hjust = 0.5,face = "bold",color = "orange"),axis.title.x = element_text(face = "bold"),
                axis.title.y = element_text(face = "bold")) 
        print(g)
      
      #We add lines with the correct colours
        
      if (input$showMod1){
          g <- g + geom_line(aes(x = disp,y=pred1,color = "red"),data = dataset)
      }
      if (input$showMod2){
          g <- g + geom_line(aes(x = disp,y = pred2,color = "green"),data = dataset)
      }
      if (input$showMod3){
          g <- g + geom_line(aes(x = disp,y = pred3,color = "blue"),data = dataset)
      }
        
      #Now we add the correct legend. Ggplot causes a problem, because we need to map a color function
        #inside aes that does not depend on the data. If we do so, scale_color_manual is not going to 
        #recognise the colors used as input. 
        
      if (input$showMod1 | input$showMod2 | input$showMod3){
          g <- g + scale_color_identity(name="Model",breaks = c("red","green","blue"),
                                      labels = c("Linear","Quadratic","Polynomial"),guide = "legend")
          print(g)
      }
    })
    
    #Add the mean value of the response
    mean_res <- mean(dataset$mpg)
    output$Mean_res <- renderText({
        mean_res
    })
    #Add the RSE of each model
    output$Mod1 <- renderText({
        if(input$showMod1){
            error_1 <- summary(model1)$sigma
            paste(error_1,"=",round(error_1/mean_res,3)," % training error")
        }
        })
    output$Mod2 <- renderText({
        if(input$showMod2){
            error_2<-summary(model2)$sigma
            paste(error_2,"=",round(error_2/mean_res,3)," % training error")
        }
    })
    output$Mod3 <- renderText({
        if(input$showMod3){
            error_3<-summary(model3)$sigma
            paste(error_3,"=",round(error_3/mean_res,3)," % training error")
        }
    })
})
