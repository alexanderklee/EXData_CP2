# Question Summary
# ----------------
# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == 06037)). Which city has seen greater changes 
# over time in motor vehicle emissions?

## Reading the data
pmdata <- readRDS("summarySCC_PM25.rds")
scc    <- readRDS("Source_Classification_Code.rds")

## Subset data by Maryland and Los Angeles
mdladata   <- pmdata[with(pmdata, fips == "06037"|fips == "24510"), ]

## Get motor vehicle sources in SCC
mvsrc  <- subset(scc,Data.Category == "Onroad")
mvcode <- mvsrc$SCC

## Subset Data with the code
mData  <- subset(mdladata, SCC %in% mvcode)

## Extract data by calculating the sum of Emissions
mTotal <- aggregate(Emissions~year + fips, mData, sum)

## Load the library
library(ggplot2)

## Plot
g <- ggplot(mTotal, aes(year, Emissions))
g + facet_grid(. ~ fips) + geom_line()

## Use ggsave 
ggsave("plot5.png",plot=g)

