#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
setwd("D:/Data/ddp-week4/hr-app1")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("HR Pay Rate Information for Fictitious Company"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 30,
                   value = 8),

       selectInput("select", label=h3("Choose department"),
                   choices = list("Admin Office" = 'Admin Offices',
                                  "IT/IS" = 'IT/IS',
                                  "Software Engineering" = 'Software Engineering',
                                  "Sales" = 'Sales')
                   )

    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       plotlyOutput("scatterplt1")
    )
  )
))
