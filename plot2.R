source("loader.R")
df <- load_df("data")

png("plot2.png", width=480, height=480)
with(df,
     plot(DateTime,
          Global_active_power,
          xlab="",
          ylab="Global Active Power (killowatts)",
          lwd=0.5,
          type="l")
)
dev.off()