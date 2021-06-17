# Data loading script.
# This will cache the data.frame to avoid reloading multiple times.

# Initialize to load data
if (!("df" %in% ls())) {
  df <- NULL
}

#' Load data from file with the date in 2007-02-01 and 2007-02-02
#'
#' @param data_dir character Directory path which contains household_power_consumption.txt
#' @param reload logical     Set to TRUE and forcibly load data from the file
#' @return data.frame loaded from household_power_consumption.txt
#'         The date and time in the text file will be converted to datetime object.
load_df <- function(data_dir, reload = F) {
  if (is.null(df) | reload) {
    # read header and lines whose date is either 2007-02-01 or 2007-02-01
    lines <- grep("^(Date|[12]/2/2007)",
                  readLines(file.path(data_dir, "household_power_consumption.txt")),
                  value=T)
    
    df_ <- read.table(text=lines, header=T, sep=";")
    
    # create datetime from Date and Time columns
    df_$DateTime <- as.POSIXlt(paste(df_$Date, df_$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
    df <<- subset(df_, select=-c(Date, Time))
  }
  
  df
}