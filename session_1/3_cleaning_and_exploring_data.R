###R for biologists
##Irina & Rao, 25/01/2023


#### Cleaning data ####
?airquality
head(airquality)
airquality$Ozone

which_rows_complete <- complete.cases(airquality)
airquality[which_rows_complete, ]

ozone_without_missing <- na.omit(airquality)


#### FILTERING data ####
# Subsetting by logical vectors comes in handy here
# Knockdown of which genes results in migration > 1?

which_rows_mig1 <- migmorph$migration > 1
migmorph[which_rows_mig1, ]

# Knockdown of which genes results in elongatedness < 1.5?

which_rows_elongatedness1.5 <- migmorph$elongatedness < 1.5
migmorph[which_rows_elongatedness1.5, ]

#### DETOUR: logical operations - AND OR ####

TRUE & TRUE     # AND
TRUE & FALSE
TRUE | TRUE     # OR
TRUE | FALSE
!TRUE # Negation
!FALSE # Negation

x = 5
x > 4 & x < 6
x > 4 | x > 6

# Filtering with more than one criterion
migmorph[which_rows_mig1 | which_rows_elongatedness1.5, ]

#### Problem set ####
# Use the migmorph data.frame for these questions

# Q1: Knockdown of which gene results in the highest migration?
# # hint: this can be accomplished with the max() function

# Q2: Make a new data.frame that has only rows with 0.9 > migration > 0.4 AND elongatedness > 1.4
# Q2.1: What is the correlation between migration and elongatedness in this new dataset?
# Q2.2: Draw an XY plot showing the relationship between these two variables in this new dataset

# Q3: Write the data.frame from Q2 to a new file named filtered_data.csv
