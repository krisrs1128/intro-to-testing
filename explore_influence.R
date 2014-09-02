network <- read.csv("network.csv")

plot(log(network$A_follower_count), log(network$A_listed_count))
plot(network$A_follower_count, network$A_retweets_sent)
