

# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://www.rstudio.com/shiny/
#

library(shiny)
source("dataprocessing.R")

shinyServer(function(input, output) {
    values <- reactiveValues()
    values$states <- states
    output$stateControl <- renderUI({
        checkboxGroupInput('states','States:',levels(states),selected = values$states)
    })
    observe({
        if (input$selectAll == 0)
            return()
        values$states <- states
    })
    observe({
        if (input$clearBtn == 0)
            return()
        values$states <- c()
    })
    
    info <- reactive({
        filterData(data,input$timeline[1],input$timeline[2],input$states)
    })
    output$tableId <- renderDataTable({
        info()
    })
    output$fatalitiesChart <- renderChart({
        plotFatalities(info())
    })
    output$injuriesChart <- renderChart({
        plotInjuries(info())
    })
    output$propDmgChart <- renderChart({
        plotPropDmg(info())
    })
    output$cropDmgChart <- renderChart({
        plotCropDmg(info())
    })
    
    
})
