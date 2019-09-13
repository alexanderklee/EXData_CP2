# Question Statement
# -------------------
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510"\color{red}{\verb|fips == "24510"|}fips=="24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering 
# this question.

## Reading the data
pmdata <- readRDS("summarySCC_PM25.rds")
scc    <- readRDS("Source_Classification_Code.rds")

## Subset data by Maryland
md <- pmdata[pmdata$fips == "24510", ]

## Extract data by calculating the sum of Emissions
sumMD <- aggregate(Emissions~year, md, sum)

## Plot
with(sumMD, plot(year, Emissions, xlab = "Year", ylab = "Total Emissions", type="l",main="Total Emissions for each year in Baltimore City, MD"))

## Copy my plot to a PNG file
dev.copy(png, file = "plot 2.png")

## Close the PNG device!
dev.off() ## Close the PNG device!