##################################################
## Discriminant Analysis and Classification in R #
##################################################

## Install Packages (if needed)
install.packages("MASS")

## Load Packages and Set Seed
library(MASS)
set.seed(1)

## Read in Segment Data and Classification Data
seg <- read.csv(file.choose()) ## Choose segmentation_result.csv file
class <- read.csv(file.choose()) ## Choose shopping_behavior_workfile.csv file

## Run Discriminant Analysis
fit <- lda(segment ~ Location + Size + Color + Season + Review.Rating + Subscription.Status + Shipping.Type, data = seg)
fit ## print the summary statistics of your discriminant analysis

## Check which Discriminant Functions are Significant
ldaPred <- predict(fit, seg)
ld <- ldaPred$x
anova(lm(ld[,1] ~ seg$segment))
anova(lm(ld[,2] ~ seg$segment))
anova(lm(ld[,3] ~ seg$segment))
anova(lm(ld[,4] ~ seg$segment))
anova(lm(ld[,5] ~ seg$segment))

## Check Discriminant Model Fit
pred.seg <- predict(fit)$class
tseg <- table(seg$segment, pred.seg)
tseg # print table
sum(diag(tseg))/nrow(seg) # print percent correct

## Run Classification Using Discriminant Function
pred.seg <- predict(fit, seg)$class
tclass <- table(pred.seg)
tclass # print table

## Add Predicted Segment to Classification Data
pred.seg <- cbind(class, pred.seg)
write.csv(class.seg, file = file.choose(new=TRUE), row.names = FALSE) ## Name file classification_pred.csv
