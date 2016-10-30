# Ravi Ancil Persad
# Assignment-Week1: Exploratory Data Analysis

#======== Code to generate Plot 3 =========#


#----- this block of code clears/resets console ----#
rm(list=ls())
cls <- function() cat(rep("\n",100))
cls()
graphics.off()
#--------------------------------------------------#

#------- this function creates plot3.png ----------#
# to run this file, please enter YOUR path to the data file "household_power_consumption.txt",
# then call the 'Do_Plot3' function. This will save the plot image in the folder where this function exists.

# For example: 

           # Path_to_Data <- "C:/Users/ravi/Desktop/household_power_consumption.txt"
           # Do_Plot3(Path_to_Data)   

Do_Plot3 <- function(Path_to_Data) {
        
        
        #--- NOTE: if you do not have the 'sqldf' package to run the 'read.csv.sql' function,
        #----please uncomment the line below and run to install it.   ---#
        
        # install.packages("sqldf")
        library(sqldf)
        
        Data_specified_dates <- read.csv.sql(Path_to_Data,
                                             sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007' ",
                                             sep=";", header=TRUE, eol="\n")
        
        

        Data_specified_dates$formatting_date = as.Date(Data_specified_dates$Date, format="%d/%m/%Y")
        Data_specified_dates$DateTime <- paste(Data_specified_dates$formatting_date, Data_specified_dates$Time)
        
        
        
        DateTime_object= strptime(Data_specified_dates$DateTime, format = "%Y-%m-%d %H:%M:%S")
        
        png(file="plot3.png", width = 480, height = 480)
        
        plot(DateTime_object,Data_specified_dates$Sub_metering_1,type="l", xlab='',ylab="Energy sub metering")
        lines(DateTime_object,Data_specified_dates$Sub_metering_2,col='red')
        lines(DateTime_object,Data_specified_dates$Sub_metering_3,col="blue",lwd=1)
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'),lwd=2)
        
        
        dev.off()
        
}
#------------------------------------------------------#


    
