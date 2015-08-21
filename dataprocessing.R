library(dplyr)
library(rCharts)
filename = "data/data.csv"
data <- read.csv(filename)
##data$Year <- year(as.Date(data$BGN_DATE,"%m/%d/%Y"))
##data$Month<- month(as.Date(data$BGN_DATE,"%m/%d/%Y"),label=TRUE)
##newdata <- aggregate(cbind(FATALITIES,INJURIES,PROPDMG,CROPDMG) ~ STATE + EVTYPE+Year+Month,
##                     data,sum,na.rm = TRUE)
states <- sort(unique(data$STATE))

filterData <- function(dt,minYear,maxYear,state) {
    result <- dt %>% filter(Year >= minYear,Year <= maxYear)
    result <- result[result$STATE %in% state,]
    return(result)
}

plotFatalities <- function(dt, dom = "fatalitiesChart",
                           xAxisLabel = "Events",
                           yAxisLabel = "Number of Fatalities") {
    fatalities_bytype <- aggregate(FATALITIES ~ EVTYPE,dt,sum,na.rm = TRUE)
    fatalities_bytype <-
        fatalities_bytype[order(-fatalities_bytype$FATALITIES),]
    fatalities_bytype <- fatalities_bytype[1:10,]
    fatalities <- nPlot(
        FATALITIES ~ EVTYPE,
        data = fatalities_bytype,
        type = "multiBarChart",
        dom = dom, width = 650
    )
    fatalities$chart(margin = list(left = 100))
    fatalities$yAxis(axisLabel = yAxisLabel, width = 80)
    fatalities$xAxis(axisLabel = xAxisLabel, width = 70)
    return(fatalities)
}
plotInjuries <- function(dt, dom = "injuriesChart",
                         xAxisLabel = "Events",
                         yAxisLabel = "Number of Injured") {
    injuries_bytype <- aggregate(INJURIES ~ EVTYPE,dt,sum,na.rm = TRUE)
    injuries_bytype <-
        injuries_bytype[order(-injuries_bytype$INJURIES),]
    injuries_bytype <- injuries_bytype[1:10,]
    injuries <- nPlot(
        INJURIES ~ EVTYPE,
        data = injuries_bytype,
        type = "multiBarChart",
        dom = dom, width = 650
    )
    injuries$chart(margin = list(left = 100))
    injuries$yAxis(axisLabel = yAxisLabel, width = 80)
    injuries$xAxis(axisLabel = xAxisLabel, width = 70)
    return(injuries)
}
plotPropDmg <- function(dt, dom = "propDmgChart",
                        xAxisLabel = "Events",
                        yAxisLabel = "Properties Damage in US$ Millions") {
    propdmg_bytype <- aggregate(PROPDMG ~ EVTYPE,dt,sum,na.rm = TRUE)
    propdmg_bytype <- propdmg_bytype[order(-propdmg_bytype$PROPDMG),]
    propdmg_bytype <- propdmg_bytype[1:10,]
    propdmg <- nPlot(
        PROPDMG ~ EVTYPE,
        data = propdmg_bytype,
        type = "multiBarChart",
        dom = dom, width = 650
    )
    propdmg$chart(margin = list(left = 100))
    propdmg$yAxis(axisLabel = yAxisLabel, width = 80)
    propdmg$xAxis(axisLabel = xAxisLabel, width = 70)
    return(propdmg)
}
plotCropDmg <- function(dt, dom = "cropDmgChart",
                        xAxisLabel = "Events",
                        yAxisLabel = "Crop Damage in US$ Millions") {
    cropdmg_bytype <- aggregate(CROPDMG ~ EVTYPE,dt,sum,na.rm = TRUE)
    cropdmg_bytype <- cropdmg_bytype[order(-cropdmg_bytype$CROPDMG),]
    cropdmg_bytype <- cropdmg_bytype[1:10,]
    cropdmg <- nPlot(
        CROPDMG ~ EVTYPE,
        data = cropdmg_bytype,
        type = "multiBarChart",
        dom = dom, width = 650
    )
    cropdmg$chart(margin = list(left = 100))
    cropdmg$yAxis(axisLabel = yAxisLabel, width = 80)
    cropdmg$xAxis(axisLabel = xAxisLabel, width = 70)
    return(cropdmg)
}
