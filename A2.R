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

SG <- subset(data1, City == "St. George")
  SGLogPop <- log(SG$City.Pop)
  SGLogExperts <- log(SG$Experts)
  SGLogStaff <- log(SG$Staff)
  SGLogUnits <- log(SG$Units.Sold)
reg3 <- lm(SGLogUnits ~ factor(Year) + factor(Month) + SGLogPop + SGLogExperts + SGLogStaff, data = GJ)
summary(reg3)
(4500/2000)*(0.22072/0.34512)

Logan <- subset(data1, City == "Logan")
  LogLogPop <- log(Logan$City.Pop)
  LogLogExperts <- log(Logan$Experts)
  LogLogStaff <- log(Logan$Staff)
  LogLogUnits <- log(Logan$Units.Sold)
reg4 <- lm(LogLogUnits ~ factor(Year) + factor(Month) + LogLogPop + LogLogExperts + LogLogStaff, data = GJ)
summary(reg4)
(4500/1160)*(-0.144482/0.224057)


