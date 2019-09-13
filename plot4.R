# Question Summary
# ----------------
# Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999–2008?

## Reading the data
pmdata <- readRDS("summarySCC_PM25.rds")
scc    <- readRDS("Source_Classification_Code.rds")

## Get the coal combustion-related sources from SCC
ccode <- scc$SCC[grep("coal", scc$EI.Sector, ignore.case=TRUE)]

## Subset Data with the code
sdata <- subset(pmdata, SCC %in% ccode)

## Extract data by calculating the sum of Emissions
scoal <- aggregate(Emissions~year, sdata, sum)

## Plot
with(scoal, plot(year, Emissions,xlab = "Year", ylab = "Total Emissions", type="l",main="Total Emissions for coal combustion-related sources"))

## Copy my plot to a PNG file
dev.copy(png, file = "plot 4.png") 
## Close the PNG device!
dev.off() 