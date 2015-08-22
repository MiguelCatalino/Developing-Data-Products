


# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://www.rstudio.com/shiny/
#

library(shiny)
require(rCharts)
library(dplyr)
require(markdown)

shinyUI(
    navbarPage(
        "Weather Events Vizualizer based on NOAA Storm Databases",
        
        # Application title
        #headerPanel("Analysis Report of Impact by Weather Events based on NOAA Storm Databases"),
        tabPanel(
            "Explore the Data",
            # Sidebar with a slider input for number of bins
            sidebarPanel(
                sliderInput(
                    "timeline",
                    "Timeline:",
                    min = 1950,
                    max = 2011,
                    value = c(2000,2011)
                ),
                uiOutput("stateControl"),
                actionButton(
                    inputId = "clearBtn",label = "Clear Selection",
                    icon = icon("square-o")
                ),
                actionButton(
                    inputId = "selectAll",
                    label = "Select All",
                    icon = icon("check-square-o")
                )
            ),
            
            
            # Show a plot of the generated distribution
            mainPanel(tabsetPanel(
                tabPanel(p(icon("table"),"Dataset"),
                         dataTableOutput(outputId = "tableId")),
                tabPanel(
                    p(icon("line-chart"),"Charts"),
                    h4("Top 10 Events: Fatalities",align = "center"),
                    showOutput("fatalitiesChart","nvd3"),
                    h4("Top 10 Events: Injuries",align = "center"),
                    showOutput("injuriesChart","nvd3"),
                    h4("Top 10 Events: Properties Damage",align = "center"),
                    showOutput("propDmgChart","nvd3"),
                    h4("Top 10 Events: Crop Damage",align = "center"),
                    showOutput("cropDmgChart","nvd3")
                )
            ))
        ),
        tabPanel("About", mainPanel(includeMarkdown("about.md")))
    )
)
