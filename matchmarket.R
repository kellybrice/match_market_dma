## read in csv for last 3 months of sales performance 
dat <- read.csv('/Users/kelly.rice/Documents/refreshed_retail_mmdata.csv')

##preview CSV file 
head(dat)

## cleaning up data - first and second rows are labels, its removing first two rows because it doesnt have any revenue data
dat <- dat[-2,]
dat <- dat[-1,]

head(dat)

#renaming 
all_dma <- dat

## preview the merge
head(all_dma)

#missing data, make zero
all_dma[is.na(all_dma)] <- 0

head(all_dma)

## create a new table that is the euclidean distance of all rows (all cities)
## exclude the row containing city name
tdist <- dist(all_dma[,2:ncol(all_dma)])
# turn that table into a matrix
tdist <- as.matrix(tdist)
head(tdist)

## find the row equal to the test city you want to find a control market for.
all_dma$Orders.Order.Completed.Week

## this will sort by cities closest to the test city.
nash_sim <- sort(tdist[,3], index.return = T)$ix

for (x in 1:20){
  print(all_dma$Orders.Order.Completed.Week[nash_sim[x]])

}

#change 20 to whatever output you want
