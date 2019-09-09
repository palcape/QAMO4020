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
