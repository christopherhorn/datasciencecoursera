
## Set the Wd to make it easier to navigate
con <- "/Users/wytworm/Desktop/R\ Programming\ Local/Week\ 2/specdata/"

setwd(con)

##Store a list of all files in the dir, though we don't need this in the function
file_list <- list.files()

## Wipe out the data frame 
dataset = NULL

##Loop through more than one file and append one to the other in a 'dataset'
for (file in file_list){
        
        # if the merged dataset doesn't exist, create it
        if (!exists("dataset")){
                dataset <- read.table(file, header=TRUE, sep = ',')
        }
        
        # if the merged dataset does exist, append to it
        if (exists("dataset")){
                temp_dataset <-read.table(file, header=TRUE, sep = ',')
                dataset<-rbind(dataset, temp_dataset)
                rm(temp_dataset)
        }       
}

## Pulling data for a specific file
x.sub <- dataset[dataset$ID==23,]
## Pullign data for a range of files
xrange.sub <- dataset[dataset$ID %in% 1:10,]
## Pulling one column and removing NA
e <- xrange.sub[complete.cases(xrange.sub[2]),]
## returining the mean for the column that has been stripped of NA's
xrm <- round(mean(e$sulfate),3)

pm <- function(dir,pollutant,id = 1:332){
        setwd(dir)
        dataset = NULL
        ##Build dataset
        ##Loop through more than one file and append one to the other in a 'dataset'
        for (file in file_list){
                
                # if the merged dataset doesn't exist, create it
                if (!exists("dataset")){
                        dataset <- read.table(file, header=TRUE, sep = ',')
                }
                
                # if the merged dataset does exist, append to it
                if (exists("dataset")){
                        temp_dataset <-read.table(file, header=TRUE, sep = ',')
                        dataset<-rbind(dataset, temp_dataset)
                        rm(temp_dataset)
                }       
        }
        ## Pullign data for a range of files as indicated by id
        xrange.sub <- dataset[dataset$ID %in% id,]
        
        ## Store the column number for the passed in pllutant
        if(pollutant == "sulfate"){
                col <- 2}
                else
                        col <-3
        
        ## return a one element vector for the pollutant
        xpol <- xrange.sub[col]
        
        ##Scrub NAs
        xpol.sub <- xpol[complete.cases(xpol),]
        
        ##scrub NAs for polutant
        ## Not working: xpollutant.sub <- xrange.sub[complete.cases(col),]
        
        ##calc the mean
        xrm <- round(mean(xpol.sub),3)
        xrm
}

## NEXT STEPS: Build the dataset only on the files represented by the file name 
## linked to the index? This would be fragile because it assumes too much about the 
## file names,. That being said, the initital dataset build hurts...