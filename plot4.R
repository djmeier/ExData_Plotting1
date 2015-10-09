plot4 <- function() {
        setwd(paste(Sys.getenv("R_USER"), "/R/Exploratory Data Analysis/Week 1/ExData_Plotting1", sep = ""));
        f <- read.table("../Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?");
                        
        f$Date <- as.Date(f$Date, format = "%d/%m/%Y");
        f$timetmp <- paste(f$Date, f$Time);
        f$Time <- strptime(f$timetmp, format = "%Y-%m-%d %H:%M:%S");
        fsub <- subset(f, Date >= "2007-02-01" & Date <= "2007-02-02");
        
        # PNG file:
        png("plot4.png", width = 480, height = 480, type="window");
        
        # Graph:
        par(mfrow = c(2, 2));
        
        with(fsub, {
        plot(Time, Global_active_power, 
                col = "black", 
                ylab = "Global Active Power", 
                xlab = "",
                main = "",
                typ = "l")
                
        plot(Time, Voltage, 
             col = "black", 
             ylab = "Voltage", 
             xlab = "datetime",
             main = "",
             typ = "l")
        
        plot(Time, Sub_metering_1, 
                col = "black", 
                ylab = "Energy sub metering", 
                xlab = "",
                main = "",
                typ = "l")
             lines(Time, Sub_metering_2, col = "red")
             lines(Time, Sub_metering_3, col = "blue")
             legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n");        

        plot(Time, Global_reactive_power, 
             col = "black", 
             ylab = "Global_reactive_power", 
             xlab = "datetime",
             main = "",
             typ = "l")
        });  # produce multi plots


        dev.off();
}