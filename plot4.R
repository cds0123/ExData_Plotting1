source("loader.R")
df <- load_df("data")

png("plot4.png", width=480, height=480)

par(mfrow=c(2, 2), mar=c(4, 4, 4, 2))

# plot (1, 1)
plot(df$DateTime, df$Global_active_power,
     type="l",
     xlab="", ylab="Global Active Power")

# plot (1, 2)
with(df, plot(DateTime, Voltage, type="l", xlab="datetime"))

# plot (2, 1)
plot(df$DateTime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(df$DateTime, df$Sub_metering_2, col="red", type="l")
points(df$DateTime, df$Sub_metering_3, col="blue", type="l")

legend("topright",
       col=c("black", "red", "blue"),
       lty=1,
       bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot (2, 2)
# label on y-axes is default name
with(df, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))

dev.off()
