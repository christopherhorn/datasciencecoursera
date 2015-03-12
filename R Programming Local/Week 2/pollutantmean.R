pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files: /Users/wytworm/Desktop/R\ Programming\ Local/Week\ 2/specdata/
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        ##Use the directory arg and the id arg to load the file
        
        source <- file.path(con,"001.csv")
        df <- read.csv(source, header = TRUE)
        ##Use the pollutant arg to subset the numeric data for the pollutant categories
        
        ##Use the mean function to return 2 values    
        
}