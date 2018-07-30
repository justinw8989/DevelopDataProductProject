# server.R file for the shiny app
# Data Source: "mtcars" dataset, available in R

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    disp.seq <- seq(from = input$disp[1], to = input$disp[2], by = 0.1)
    hp.seq <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    data <- transmute(mtcars, Model = rownames(mtcars), MilesPerGallon = mpg, 
                      GasolineExpenditure = input$dis/mpg*input$cost,
                      Cylinders = cyl, DisplacementVolume = disp, Horsepower = hp, 
                      Transmission = am)
    data <- filter(data, GasolineExpenditure <= input$gas, Cylinders %in% input$cyl, 
                   DisplacementVolume %in% disp.seq, Horsepower %in% hp.seq, Transmission %in% input$am)
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    data <- arrange(data, GasolineExpenditure)
    data
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})