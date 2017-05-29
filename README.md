# cryptocurrency-rates

###Using the HistoDay API
```source histoday```
#Output from the script will be put into a data directory that will be created where the script is run
#The files are named after the currency being converted

###Using the PriceHistorical API
#You will need to install jq, which helps parse the data received from the API:
```brew install jq```

#To run the script with no arguments, meaning from Jan 1, 2014 to present day:
```source command```

#To run the script from a different point in history:
```source command <from timestamp>```

#To run the script for a targeted range in time:
```source command <from timestamp> <to timestamp>```

A timestamp can be easily from https://www.epochconverter.com/

Converting the timestamps back to dates is probably best done in excel, referencing: https://www.extendoffice.com/documents/excel/2473-excel-timestamp-to-date.html

##Output from previous runs gets cleared upon starting a new run.  This shouldn't be a problem since the data is historical, just something to be aware of.
