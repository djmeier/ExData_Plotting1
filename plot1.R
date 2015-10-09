plot1 <- function() {
        setwd(paste(Sys.getenv("R_USER"), "/R/Exploratory Data Analysis/Week 1/ExData_Plotting1", sep = ""));
        f <- read.table("../Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?");
                        
        f$Date <- as.Date(f$Date, format = "%d/%m/%Y");
        f$timetmp <- paste(f$Date, f$Time);
        f$Time <- strptime(f$timetmp, format = "%Y-%m-%d %H:%M:%S");
        fsub <- subset(f, Date >= "2007-02-01" & Date <= "2007-02-02");

        # PNG file:
        png("plot1.png", width = 480, height = 480, type="window");
        
        # Graph:
        hist(fsub$Global_active_power, 
             col = "red", 
             ylab = "Frequency", 
             xlab = "Global Active Power (kilowatts)",
             main = "Global Active Power");  # produce base histogram
        
        dev.off();
}