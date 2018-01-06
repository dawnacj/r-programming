complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1 117
  ## 2 1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the number of complete cases
  
  # set working directory
  
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # set required variables
  id_amt <- length(id)
  complete_data <- rep(0, id_amt)
  
  # get files
  file_paths <- as.character(list.files(path = directory, full.names = TRUE))
  
  # process data
  idx <- 1
  for(itx in id) {
    this_file <- read.csv(file_paths[itx], header = TRUE, sep = "," )
    complete_data[idx] <- sum(complete.cases(this_file))
    idx <- idx + 1
  }
  
  result = data.frame(id = id, nobs = complete_data)
  return(result)
}