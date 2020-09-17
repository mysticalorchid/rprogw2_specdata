pollutantmean <- function (directory = "specdata", type, range = 1:332){
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
    ## check and load the first set directly to data file
    if (i == range[1]){
      dat <- read.csv(filepath, header = TRUE)
    } else {
      ## if not the first set, load to local variable then adding to data file
      datlocal <- read.csv(filepath, header = TRUE)
      dat <- rbind(dat,datlocal)
    }
  }  
  ## subset data with type input, remove NA then calculate mean
  mean(dat[[type]],na.rm = T)
  ## Just in case, cleaning all NA using complete.cases() logic vector
  ## save to cleandat and find mean of input type
  # rmnalogic <- complete.cases(dat)
  # cleandat <- dat[rmnalogic,]
  # mean(cleandat[[type]])
}
