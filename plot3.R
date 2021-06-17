source("loader.R")
df <- load_df("data")

png("plot3.png", width=480, height=480)
plot(df$DateTime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(df$DateTime, df$Sub_metering_2, col="red", type="l")
points(df$DateTime, df$Sub_metering_3, col="blue", type="l")

legend("topright",
       col=c("black", "red", "blue"),
       lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()