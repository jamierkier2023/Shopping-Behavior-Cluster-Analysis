# Shopping Behavior Cluster and Predictive Analysis.
 
## Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Recommendations](#recommendations)

### Project Overview

This data analysis project aims to provide insights into the sales performance of a Coffee Chain over the course of six months. By analyzing the sales trends according to product type, over the course of six months, I sought to identify trends, make data-driven reccomendations, and gain a deeper understanding of Cafe-Delights-Coffee performance metrics with the end goal of maximizing sales by raising the total revenue by twenty percent.

---

Average Purchase Amount by State with No Subscription Status Classified by Gender Interactive Tableau Dashboard can be found [here](https://public.tableau.com/views/Chapter3Clustersegmentationmap/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)


![Average Values of Bses by Segment](https://github.com/user-attachments/assets/43d6d9ed-a600-4872-8cef-013c34b1b164)

![Average Values of Descriptors by Segment](https://github.com/user-attachments/assets/8046d0d3-36b8-4142-afb1-af7895edd738)

![Number of Prospects in Each Segment by Gender](https://github.com/user-attachments/assets/688949e3-204d-4045-9920-b174dc7fa9fe)

### Data Sources

Sales Data: The primary Dataset used for this analysis is the shopping_behavior_updated.csv file which contains the following variables: Customer ID,Age,Gender,Item Purchased,Category,Purchase Amount (USD),Location,Size,Color,Season,Review Rating,Subscription Status,Shipping Type,Discount Applied,Promo Code Used,Previous Purchases,Payment Method,Frequency of Purchases. 

### Tools

- Rstudio
- Tableau
   - [Download here](https://public.tableau.com/app/discover)

### Data Analysis

RStudio code/features worked with:

```Rstudio
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
```
