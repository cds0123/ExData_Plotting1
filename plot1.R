source("loader.R")

df <- load_df("data")

png("plot1.png", width=480, height=480)
hist(df$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (killowatts)",
     col="red"
)
dev.off()