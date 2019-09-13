# Question Statement
# ------------------
# Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot 
# showing the total PM2.5 emission from all sources for each of 
# the years 1999, 2002, 2005, and 2008.

## Reading the data
pmdata <- readRDS("summarySCC_PM25.rds")
scc    <- readRDS("Source_Classification_Code.rds")

## Extract data by calculating the sum of Emissions
sumdata <- aggregate(Emissions~year, pmdata, sum)

## Plot
with(sumdata,plot(year,Emissions,xlab = "Year",ylab = "Total Emissions", type="l",main="Total Emissions for each year"))

## Copy my plot to a PNG file
dev.copy(png, file = "plot 1.png")

## Close the PNG device!
dev.off() 