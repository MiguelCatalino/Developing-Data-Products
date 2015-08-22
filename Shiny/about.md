#Analysis Report of Impact by Weather Events based on NOAA Storm Databases

This Application is for explore and visualize Weather Events based on NOAA Storm Databases in the United State using information from 1950 to 2011,

The dataset is from http://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2 and was modified to only contain 8 columns: FATALITIES,INJURIES,PROPDMG (Properties Damage),CROPDMG (Crop Damage), STATE, EVTYPE,Year and Month and reduce the total number of records in the current dataset to 88853 after summiraze.

###Explore data

You have a slider with the timeline from 1950 to 2011, this way you can indicate the interval of years that you want to see.

Then you have all the State in a checkbox group. Using the button Clear Selection you can unselected all or use Select All. Also, you can select or unselect individuality.

After every events, the data is going to filter with the new parameters.