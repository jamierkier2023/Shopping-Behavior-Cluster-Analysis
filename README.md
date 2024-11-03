# Shopping Behavior Cluster and Predictive Analysis.
 
## Table of Contents

- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Recommendations](#recommendations)

### Project Overview

This data analysis project aims to predict future shopping behaviors and understand how consumer data can drive retail sales, particularly in the clothing and jewelry sectors. Leveraging IBM Cognos as a cognitive analytics tool, this project focuses on variables like subscription status, gender, past purchase amounts, promotions, and applied discounts. By analyzing consumer data from all fifty states, this exploratory study seeks to generalize findings to inform real-world retail strategies, enabling a deeper understanding of shopping patterns that influence purchasing decisions. The project employs both discriminant and cluster analysis to segment consumers based on attitudes and behaviors. Discriminant analysis, relying on descriptor variables, classifies customers into predefined clusters to reveal key traits that differentiate customer groups. Cluster analysis further defines these segments, grouping similar customers based on preferences and purchasing behaviors. By identifying clear intra-segment similarities and inter-segment differences, this analysis will assist marketers in tailoring strategies for each consumer group, ultimately supporting enhanced, data-driven decision-making in retail.

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
### Results/Findings

The analysis of consumer segments reveals key differences in demographics, purchasing behavior, and profitability. Segment 4 stands out as having the highest average age at 59.81, while Segment 1 has the youngest average age at 30.10. Segment 4 also has the highest count of individuals (703), resulting in significant sales per year at approximately $35 million, with an annual profit of around $18.2 million. This indicates that older customers in Segment 4 are highly profitable, possibly due to higher average purchase amounts and more frequent previous purchases. Segments 1, 2, and 3 represent younger consumers, with average ages ranging from 30.10 to 35.58, and relatively lower average purchase amounts compared to the older segments. However, Segment 3 stands out in terms of profitability among the younger demographics, generating approximately $20.6 million in annual profit. This segment has a notably high sales figure of around $39.7 million, which may be attributed to higher average purchase amounts (around $88.79 USD).

Gender distribution across segments shows a fairly balanced representation, although Segment 4 again has the largest number of male and female prospects (15,708 male and 7,182 female), indicating a broad appeal across gender lines. This high number of prospects in Segment 4 aligns with its large segment count and high profitability. In contrast, Segments 1 and 7 have lower counts and a younger demographic, which may impact the overall profitability of these segments despite their sizeable sales figures.
The analysis suggests that targeting older consumers in Segment 4 with high-value promotions could further enhance profitability, while for younger segments like 3 and 1, focusing on value-driven offers or loyalty programs might maximize retention and spending. The segmentation results provide valuable insights for strategic marketing, highlighting distinct consumer profiles that can inform tailored promotional efforts across demographic groups.

### Reccomendations 

Based on the analysis of consumer segments, several recommendations emerge for targeted marketing strategies that could enhance profitability and customer engagement across demographics. First, given Segment 4's high profitability and large customer base, focusing marketing efforts on this group could yield significant returns. Segment 4 comprises predominantly older customers with a high average purchase amount and a strong annual profit margin. To maximize engagement with this segment, the company should consider offering premium loyalty programs, exclusive discounts, or personalized product recommendations based on purchase history. Emphasizing quality and value-added services, such as free shipping or extended warranties, may further increase loyalty among these high-value customers. For younger segments like Segment 1 and Segment 3, the strategy should focus on affordability and value. Gender-based targeting is another area of opportunity. Since Segment 4 has a broad appeal across both genders, targeted campaigns that cater to shared interests—such as seasonal promotions or product bundles—could be particularly effective. For other segments, analyzing the product preferences of male and female customers more closely could allow for customized messaging that resonates with each group. Tailoring communication, for instance, by highlighting functional benefits for male customers and aesthetic or lifestyle benefits for female customers, may boost appeal and conversion rates within each gender segment.

### Limitations

This analysis has certain limitations that may affect the generalizability and precision of the findings. First, the data relies on aggregated average values across segments, which could obscure individual differences within each group. While segments are helpful for targeting groups with similar behaviors and demographics, they may overlook nuanced variations in customer preferences and purchasing behaviors within each segment. Additionally, some key variables, such as “Avg. Category” and “Avg. Color,” may be too broad to provide actionable insights for product-specific marketing, limiting the granularity of recommendations. The use of descriptors like average purchase amount and review rating also introduces a degree of variability, as these averages may not accurately reflect high- or low-end consumer spending patterns.
Another limitation is the potential for outdated or incomplete data, which may not account for evolving consumer preferences or recent economic changes affecting retail behavior. Since this dataset represents a snapshot in time, it may not fully capture trends like seasonal shifts in buying behavior, the impact of online shopping on consumer habits, or economic factors such as inflation.
