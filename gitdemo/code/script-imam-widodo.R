# ===================================================================
# Title: Descriptive Analysis
# Description:
#   This script computes descriptive statistics, as well as 
#   various exploratory data visualizations.
# Input(s): data file 'nba2018-players.csv'
# Output(s): summary data files, and plots
# Author: Imam Widodo
# Date: 10-3-2019
# ===================================================================

library(tidyverse)

dat <- read.csv("../data/nba2018-players.csv")

warriors <- filter(dat, team == "GSW")
warriors <- warriors[with(warriors, order(salary)), ]

write.csv(warriors, file = "../data/warriors.csv", row.names=FALSE)

# Exporting some R output
#demo ---------
sink(file = '../output/summary-height-weight.txt')
summary(dat[ ,c('height', 'weight')])
sink()
# --------------

sink(file = '../output/data-structure.txt')
str(dat)
sink() 

sink(file = '../output/summary-warriors.txt')
summary(warriors)
sink() 

lakers <- filter(dat, team == "LAL")
lakers <- lakers[with(warriors, order(salary)), ]

sink(file = '../output/summary-lakers.txt')
summary(lakers)
sink() 

# Images
jpeg(file = "../images/histogram-age.jpeg", width=600, height=400)
hist(dat$age)
dev.off()


jpeg(file = "../images/scatterplot2-height-weight.png", pointsize = 20)
plot(dat$height, dat$weight)
dev.off()

ggplot(dat, aes(x=height, y=weight)) + geom_point() + facet_grid(rows = vars(position))
ggsave("../images/height_weight_by_position.pdf")
