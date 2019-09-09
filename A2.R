# Importing
data1 <- read.csv("~/Downloads/digital_dacha_data.csv")

# Graphs
library(ggplot2)
ggplot(data1, aes(x = City.Pop, y = Units.Sold)) + geom_point()
ggsave("graph1.pdf")
ggplot(data1, aes(x = Experts, y = Units.Sold)) + geom_point()
ggsave("graph2.pdf")
ggplot(data1, aes(x = Staff, y = Units.Sold)) + geom_point()
ggsave("graph3.pdf")

# Analysis
LogPop <- log(data1$City.Pop)
LogExperts <- log(data1$Experts)
LogStaff <- log(data1$Staff)
LogUnits <- log(data1$Units.Sold)

reg1 <- lm(LogUnits ~ factor(City) + factor(Year) + factor(Month) + LogPop + LogExperts + LogStaff, data = data1)
summary(reg1)

GJ <- subset(data1, City == "Grand Junction")
  GJLogPop <- log(GJ$City.Pop)
  GJLogExperts <- log(GJ$Experts)
  GJLogStaff <- log(GJ$Staff)
  GJLogUnits <- log(GJ$Units.Sold)
reg2 <- lm(GJLogUnits ~ factor(Year) + factor(Month) + GJLogPop + GJLogExperts + GJLogStaff, data = GJ)
summary(reg2)

(4500/1160)*(0.05398/0.09655)
