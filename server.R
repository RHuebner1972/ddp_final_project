#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#
#
#
#  This app uses both Shiny and Plotly, and is designed for the user to explore the different departments
# within a fictitious company. This is HR data and payroll pay rate date (hourly rate). By selecting
# the number of bins, as well as the department, the user can see the distribution of pay within
# each department.

library(shiny)
library(plotly)
library(data.table)

df <- read.csv('HRDataset_v7.csv', sep=',')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    x <- df
    x <- x[ which(df$Department == input$select),   ]
    z <- x$Pay.Rate
    bins <- seq(min(z), max(z), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(z, breaks = bins, col = 'blue', border = 'white', xlab = input$select, main = 'Histogram of Pay Rate')

  })

  output$scatterplt1 <- renderPlotly({

    filtered <- df[ which(df$Department ==input$select), ]

    plot_ly(filtered, type = 'scatter',
            mode = 'markers',
            x = ~Age,
            y = ~Pay.Rate

            ) # end plot_ly
  })


})
