complete <- function (directory = "specdata", range = 1:332){
  ## load the data from files in the directory to process
  for (i in range){
    ## check and convert range input to to text string filename with leading 0
    if (i < 10){
      filename = paste("00",i,sep="")
    } else if (i<100){
      filename = paste("0",i,sep="")
    } else {
      filename <- i
    }
    ## construct filepath from converted filename and dictionary input
    filepath <- paste(directory,"/",filename,".csv",sep="")
    ## load data in dat, set rmnalogic as logic vector checking complete rows
    ## subset dat using rmnalogic and save cleaned data
    dat <- read.csv(filepath, header = TRUE)
    rmnalogic <- complete.cases(dat)
    cleandat <- dat[rmnalogic,]
    ## check and create the observation table if it is the first data set
    ## id = file and count number of observation by number of rows of clean data
    if (i == range[1]){
      obstable <- data.frame(id = i, nobs = nrow(cleandat))
    } else {
      ## if not the first data set, load to local variable then adding to obstable
      obstablelocal <- data.frame(id = i, nobs = nrow(cleandat))
      obstable <- rbind(obstable,obstablelocal)
    }
  } 
  obstable
}
