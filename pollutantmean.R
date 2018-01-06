pollutantmean <- function(directory, pollutant, id=1:332){
  ## 'directory' is a character vector of length 1 indcating 
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating 
  ## the name of the pollutant for which we will calculate the mean; either "sulfate" 
  ## or "nitrate"
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## Note: Do not round the result!
  
  # set working directory
  if(grep("specdata", directory) == 1){
    directory <- ("./specdata")
  }
  
  #vector for pollutant data
  mean_vec <- c()
  
  # get all files in the directory
  file_paths <- as.character(list.files(path = directory, full.names = TRUE))

  # parse files and compute mean
  for(itx in id){
    this_file <- read.csv(file_paths[itx], header = TRUE, sep = "," )
    na_removed <- this_file[!is.na(this_file[,pollutant]), pollutant]
    mean_vec <- c(mean_vec, na_removed)
  }
  
  # return the results
  result <- mean(mean_vec)
  return(result)
}