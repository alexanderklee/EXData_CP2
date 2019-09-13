# Question Summary
# ----------------
# How have emissions from motor vehicle sources changed from 
# 1999–2008 in Baltimore City?

## Reading the data
pmdata <- readRDS("summarySCC_PM25.rds")
scc    <- readRDS("Source_Classification_Code.rds")

## Subset data by Maryland
md <- pmdata[pmdata$fips == "24510", ]

## Get motor vehicle sources in SCC
mvsrc  <- subset(scc,Data.Category == "Onroad")
mvcode <- mvsrc$SCC

## Subset Data with the code
mdData <- subset(md, SCC %in% mvcode)

## Extract data by calculating the sum of Emissions
mdMotor <- aggregate(Emissions~year, mdData, sum)

## Plot
with(mdMotor, plot(year, Emissions, xlab = "Year", ylab = "Total Emissions", type="l", main="Total Emissions for motor vehicle sources changed in Baltimore City"))

## Copy my plot to a PNG file
dev.copy(png, file = "plot5.png") 
## Close the PNG device!
dev.off() 