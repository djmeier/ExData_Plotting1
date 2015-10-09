plot3 <- function() {
        setwd(paste(Sys.getenv("R_USER"), "/R/Exploratory Data Analysis/Week 1/ExData_Plotting1", sep = ""));
        f <- read.table("../Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?");
                        
        f$Date <- as.Date(f$Date, format = "%d/%m/%Y");
        f$timetmp <- paste(f$Date, f$Time);
        f$Time <- strptime(f$timetmp, format = "%Y-%m-%d %H:%M:%S");
        fsub <- subset(f, Date >= "2007-02-01" & Date <= "2007-02-02");
        
        # PNG file:
        png("plot3.png", width = 480, height = 480, type="window");
        
        # Graph:
        with(fsub, plot(Time, Sub_metering_1, 
                col = "black", 
                ylab = "Energy sub metering", 
                xlab = "",
                main = "",
                typ = "l"));  # produce line plot

        with(fsub, lines(Time, Sub_metering_2, 
                         col = "red"));  # produce line plot
        
        with(fsub, lines(Time, Sub_metering_3, 
                         col = "blue"));  # produce line plot
        
        legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));
        
        dev.off();
}