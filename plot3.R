# Question Statement
# ------------------
# Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen decreases 
# in emissions from 1999–2008 for Baltimore City? Which have seen increases 
# in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
# answer this question.

## load the library
library(ggplot2)

## Reading the data
pmdata <- readRDS("summarySCC_PM25.rds")
scc    <- readRDS("Source_Classification_Code.rds")

## Subset data by Maryland
md <- pmdata[pmdata$fips == "24510", ]

## Extract data by calculating the sum of Emissions
typeMD <- aggregate(Emissions~year + type, md, sum)

## GG Plot
g <- ggplot(typeMD, aes(year, Emissions))
g + facet_grid(. ~ type) + geom_line()

## Use ggsave() to save plot to file
ggsave("plot3.png",plot=g)
