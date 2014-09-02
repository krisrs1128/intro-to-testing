users <- read.csv("users.csv", row.names = 1)

head(users)
library("ggplot2")
ggplot(users) + geom_boxplot(aes(x = working, y = sqrt(listen.hours)))
pairs(users[1:1000, 12:18])
ggplot(users, aes(x = Q11, y = Q12)) +
    geom_jitter(alpha = 0.3)

ggplot(users, aes(x = Q11, y = Q12)) +
    geom_jitter(alpha = 0.3)
ggplot(users, aes(x = Q9, y = Q18)) +
    geom_jitter(alpha = 0.3) +
    geom_abline()
model18.9 <- lm(Q18 ~ Q9, data = users)
model11.12 <- lm(Q12 ~ Q11, data = users)

plot(users$Q11, users$Q12)
abline(model11.12, col = "red")
summary(model11.12)

min(cor(users[, 8:27], use = "na.or.complete"))

users$listen.hours <- pmax(users$listen.hours + rnorm(nrow(users), 0, .5), 0)

dim(words)
dim(train)

words <- read.csv("words.csv")
words <- words[, c("Artist", "User", "LIKE_ARTIST", "Beautiful", "Fun", "Cool", "Thoughtful", "Current")]
words$Artist <- as.factor(words$Artist)
words$User <- as.factor(words$User)
train <- read.csv("train.csv")
head(users)
head(words)

library("ggplot2")

ggplot(users) +
    geom_boxplot(aes(x = music, y = age))

ggplot(users) +
    geom_violin(aes(x = music, y = listen.hours))

ggplot(users) +
    geom_histogram(aes(x = sqrt(listen.hours)),
                   binwidth = 0.1)

library("plyr")
library("reshape2")
m.words <- melt(words, id.vars = c("Artist", "LIKE_ARTIST", "User"))
mean.words <- ddply(m.words, .(Artist, variable), summarise,
                    mean = mean(value, na.rm = T))

mean.words$Artist <- as.factor(mean.words$Artist)
ggplot(mean.words) +
    geom_point(aes(x = Artist, y = mean, col = variable))

# Combining data sets
colnames(users)[1] <- "User"
head(words)
music <- merge(words, users, by = "User")

head(music)
plot(log(1 + users$Q10), log(1 + users$Q8))
model.test <- lm(log(1 + Q8) ~ log(1 + Q10), data = users)
abline(model.test, col = "red")
summary(model.test)
