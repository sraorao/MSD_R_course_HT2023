###R for biologists
##Irina & Rao, 25/01/2023

# https://www.nature.com/articles/sdata20179
# Article title: Systematic high-content genome-wide RNAi screens of endothelial 
# cell migration and morphology 
### ABSTRACT: Here, we present a dataset containing siRNA screens that identify known and 
### novel components of signalling pathways regulating migration of lymphatic 
### endothelial cells... using high-content microscopy, we captured a dataset 
### of images of migrating cells following transfection with a genome-wide siRNA
### library.
# Data downloaded from: https://pubchem.ncbi.nlm.nih.gov/bioassay/1159618
# and https://pubchem.ncbi.nlm.nih.gov/bioassay/1159617 into the Session2/data/ folder


#### LOAD and PREPARE data ####
# We will subset the data downloaded from the above source 
# to simplify our analysis

# Load migration data
# We are only interested in columns 8, 10, 13
# We are also NOT interested in rows 1, 2
migration_data <- read.csv("session_1/data/AID_1159618_datatable_all.csv")
migration_data <- migration_data[c(-1, -2), c(8, 10, 13)]
colnames(migration_data) <- c("reagent_id", "gene_symbol", "migration")
dim(migration_data)
head(migration_data)

# Load morphology data
# We are only interested in columns 8, 10, 19
# We are also NOT interested in rows 1, 2
morphology_data <- read.csv("session_1/data/AID_1159617_datatable_all.csv")
morphology_data <- morphology_data[c(-1, -2), c(8, 10, 19)]
colnames(morphology_data) <- c("reagent_id", "gene_symbol", "elongatedness")
dim(morphology_data)
head(morphology_data)

#### MERGE migration and morphology data ####
migmorph <- merge(migration_data, morphology_data, 
                          by = c("reagent_id", "gene_symbol"), all = TRUE)
colnames(migmorph)
head(migmorph)
str(migmorph)

migmorph$migration <- as.numeric(migmorph$migration)
migmorph$elongatedness <- as.numeric(migmorph$elongatedness)

summary(migmorph)


# subsetting data frames with [row, column]
migmorph[1, 2]
migmorph[1, ]
migmorph_subset <- migmorph[2:3, 1:3]
migmorph[c(1, 3), ]
migmorph[2:3, ]
migmorph[, 2]
migmorph$gene_symbol
migmorph$reagent_id

# Q: Subset migmorph for only the 2nd and 3rd rows
# hint: fill in the blanks as needed: migmorph[ , ]
migmorph[ , ]
migmorph[ , ]


# Q: Examine the ToothGrowth dataset that is preloaded in your R session
# hint: Use ? to look up a description of the dataset in the help pages
# hint: try print(), length(), class(), str() on ToothGrowth
# hint: Now try head() and tail()

# Q: Subset ToothGrowth to show only the rows where the dose is higher than or equal to 1.0
# hint: Try ToothGrowth$dose >= 1.0
# hint: Remember that you can pass a vector of TRUE/FALSE within the [] to subset: ToothGrowth[true_false_vector, ]

# Reading from Excel files (edit and check)
install.packages("readxl") # or
install.packages("openxlsx")
library(readxl)

read_excel("session_1/data/MSD_data.xlsx", sheet = 1)
#or
ifny <- read_excel("session_1/data/MSD_data.xlsx", sheet = 'IFNy')

# Writing data
write.csv(migmorph, "session_1/data/migmorph.csv")
