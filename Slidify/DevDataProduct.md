Coursera Developing Data Products Slidify Project
========================================================
author: Miguel Luis Catalino
date: Friday, August 21, 2015
transition: rotate
width: 1440
height: 1200

Project
========================================================
type: sub-section

This is the presentation for the project "Weather Events Vizualizer based on NOAA Storm Databases".

Thi project allow you to explor and visualize the consecuences of the weather events happens in the United State between 1950 and 2011.

You can find de application in this link https://miguelcatalino.shinyapps.io/DevDataProd

Dataset
========================================================
type: sub-section

The name of the columns are:

```r
names(data)
```

```
[1] "X"          "STATE"      "EVTYPE"     "Year"       "Month"     
[6] "FATALITIES" "INJURIES"   "PROPDMG"    "CROPDMG"   
```
- STATE: Contain the name of the state. 
- EVTYPE: Type of event. 
- Year: Year when the event happen. 
- Month: Month when the even happen. 
- FATALITIES: How many people died in the event. 
- INJURIES: How many injured. 
- PROPDMG: Properties damage in million dollar. 
- CROPDMG: Crop damage in million dollar


How it works
========================================================
type: sub-section

The application have a slider with the years, with this, the user can select the range of years to explore.

Also, You can use the checkbox group with all the state avalable, allowing to select only the ones you want to see.


Information
========================================================
type: sub-section

The purpose of this app, is that, the user can evaluate what if the most dangerous weather event in a specific state and the consequences of it. You can see in the next table the top 10 events most common in the USA.


```
            EVTYPE FATALITIES
834        TORNADO       5633
130 EXCESSIVE HEAT       1903
153    FLASH FLOOD        978
275           HEAT        937
464      LIGHTNING        816
856      TSTM WIND        504
170          FLOOD        470
585    RIP CURRENT        368
359      HIGH WIND        248
19       AVALANCHE        224
```
