# Importing
data <- read_excel("~/Downloads/qamoData.xlsx")

# Exploring
colnames(data)
length(data)
nrow(data)
count(data, vars = Gender)
mean(data$Experience_Yrs)
unique(data$Stream_HSC)
median(data$Salary)

# Cleaning
data$SlNo <- NULL
data$Experience_Yrs <- NULL
data$`Gender-B` <- NULL
earners <- subset(data, Salary >= 200000)
earners$scoreMean <- (earners$Percent_SSC + earners$Percent_HSC + earners$Percent_Degree + earners$Percent_MBA)/2

male <- subset(earners, Gender == "M")
female <- subset(earners, Gender == "F")

byStreamM <- male %>% group_by(Stream_HSC)
byStreamF <- female %>% group_by(Stream_HSC)