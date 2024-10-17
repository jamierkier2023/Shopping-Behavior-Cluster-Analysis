##############################
# Segmentation Analysis in R #
##############################

## Install Packages (if needed)

## Load Packages and Set Seed
set.seed(1)

# Import Data
seg <- read.csv(file.choose()) ## Choose shopping_behavior_updated.csv file

# Run hierarchical clustering with bases variables
seg_hclust <- hclust(dist(scale(cbind(seg$Age, seg$Gender, seg$Item.Purchased, seg$Category,
seg$Purchase.Amount..USD., seg$Location, seg$Size, seg$Color))), method="complete")

# Elbow plot for first 10 segments
x <- c(1:10)
sort_height <- sort(seg_hclust$height,decreasing=TRUE)
y <- sort_height[1:10]
plot(x,y); lines(x,y,col="blue")

# Run k-means with 6 segments
seg_kmeans <- kmeans(x = data.frame(seg$Age, seg$Gender, seg$Item.Purchased, seg$Category,
seg$Purchase.Amount..USD., seg$Location, seg$Size, seg$Color), 7)

# Add segment number back to original data

# Export data to a CSV file
write.csv(segmentation_result, file = file.choose(new=TRUE), row.names = FALSE) ## Name file segmentation_result.csv
