# Ravi Ancil Persad
# Assignment-Week1: Exploratory Data Analysis



#======== Code to generate Plot 1 =========#


#----- this block of code clears/resets console ----#
rm(list=ls())
cls <- function() cat(rep("\n",100))
cls()
graphics.off()
#--------------------------------------------------#



#------- this function creates plot1.png ----------#
# to run this file, please enter YOUR path to the data file "household_power_consumption.txt",
# then call the 'Do_Plot1' function. This will save the plot image in the folder where this function exists.

# For example: 
 
           # Path_to_Data <- "C:/Users/ravi/Desktop/household_power_consumption.txt"
           # Do_Plot1(Path_to_Data)        


Do_Plot1 <- function(Path_to_Data) {
        
        
        #--- NOTE: if you do not have the 'sqldf' package to run the 'read.csv.sql' function,
        #----please uncomment the line below and run to install it.   ---#

        # install.packages("sqldf")
        library(sqldf)

        Data_specified_dates <- read.csv.sql(Path_to_Data,
                                             sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007' ",
                                             sep=";", header=TRUE, eol="\n")
        
        png(file="plot1.png", width = 480, height = 480)
        
        hist(Data_specified_dates$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
        
        dev.off()
        
}
#-------------------------------------------------#









