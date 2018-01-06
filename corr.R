corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the number of completely observed 
  ## observations (on all variables) required to compute the correlation between nitrate and sulfate; the default is zero
  
  ## Return a numeric vector of correlations
  ## Note: Do not round the result!
  
  # set working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # set required vars
  complete_table <- complete("specdata", 1:332)
  nobs <- complete_table$nobs
  ids <- complete_table$id[nobs > threshold]
  id_amt <- length(ids)
  corr_vec <- rep(0, id_amt)
  
  # get files
  file_paths <- as.character(list.files(path = directory, full.names = TRUE))
  
  # process data
  idx <- 1
  for(itx in ids){
    this_file <- read.csv(file_paths[itx], header = TRUE, sep = "," )
    corr_vec[idx] <- cor(this_file$sulfate, this_file$nitrate, use = "complete.obs")
    idx <- idx + 1
  }
  
  # get result
  result <- corr_vec
  return(result)
}