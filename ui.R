# This app is developed with Shiny to help folks select a car for their trip.

library(markdown)
shinyUI(navbarPage("Traveler Assistance App",
                   tabPanel("Select Your Vehicle",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Please use the filters below:"),
                                numericInput('dis', 'Driving Distance (in miles):', 0, min = 1, max = 1000),
                                numericInput('cost', 'Gas Price per gallon (US Dollars):', 0, min = 2, max = 4, step=0.01),
                                numericInput('gas', 'Your Budget on Gasoline (Dollars):', 0, min=1, max=1000),
                                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8)),
                                sliderInput('disp', 'Displacement Volume (Liters)', min=70, max=480, value=c(70,480), step=10),
                                sliderInput('hp', 'Horsepower (hp)', min=50, max=340, value=c(50,340), step=10),
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1))
                              ),
                              mainPanel(
                                dataTableOutput('table')
                              )
                            )
                   )
))   