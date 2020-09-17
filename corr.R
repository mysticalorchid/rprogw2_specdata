corr <- function (directory = "specdata", threshold = 0){
  ## create empty numeric vector for correlations
  corrresult <- numeric()
  ## load the data from files in the directory to process
  for (i in 1:332){
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
    ## check if number of completely observed cases > the set threshold
    if (nrow(cleandat) > threshold) {
      ## calc the cor of sulfate and nitrate, combine it to corrresult
      corrresult <- c(corrresult,cor(cleandatlocal$sulfate,cleandatlocal$nitrate))
    }
  } 
  corrresult
}
