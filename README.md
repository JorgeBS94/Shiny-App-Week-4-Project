# Shiny-App-Week-4-Project

## General information

This repository contains all the files necessary to run and understand the Shiny App developed for the Coursera course "Developing Data Products", by the Johns Hopkins University. Those files are the following:

`ui.R`: it contains the user interface of the application.

`server.R`: it contains the server part of the application, which is the actual definition of the content.

## Application documentation

The goal of this application is to illustrate the phenomenon of overfitting, which occurs when a complex model is used to approximate a function which is most likely not that complicated. To do so, we have employed the Motor Trend Car Road Tests datasets ("mtcars"), whose data was extracted from the 1974 Motor Trend US magazine. It contains 32 observations of 11 numeric variables. One of them is fuel consumption and the other 10 comprise different aspects of automobile performance.

In order to build this app, we have considered the relationship between variables "disp" and "mpg". The first is engine displacement, measured in cubic inches, which is the swept volume of pistons inside the car cylinders. The "mpg" variable measures the car throughput in miles run per gallon of fuel consumed. If we make a scatterplot of mpg vs disp, it is easy to observe that the relatioship between both variables may involve a non-linear function. As this function is unknown,we will just fit a series of statistical models and compare their Residual Standard Error (RSE), which measures the goodness of fit with respect to the response values in the training data. We will also display the mean value of the response variable, such that we can divide the RSE of each model to calculate the percentage error achieved.

Therefore, given the evident non-linear trend in the data, employing linear regression to model this relationship might result in a highly biased estimate, indicated by a higher RSE. On the contrary, fitting a high order polynomial may overfit the training set (E.g.: achieve a much lower RSE), capturing some of the randomness in the data and making the model less generalisable. Hence, even though we would need to observe the performance of our 3 models in a test set (E.g.: via cross-validation), from our visual representation we can predict that the quadratic model may be, initially, a sensible choice according to the bias-var tradeoff.