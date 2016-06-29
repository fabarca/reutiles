#' Create Temporary Directory
#'
#' Create a temporary directory with a random name in a specific location.
#'
#' @param parent_dir Location where the temporary direcotiry will be created.
#' @param temp_dir_prefix Optional. String that will be used as prefix for the temporary directory.
#' @param length_random_suffix Optional. Number of random chars that will be used as suffix. By default 10.
#' @export
#' @examples
#' temporary_folder = createTempDir(temp_folder,"raster2psql")
#' on.exit(unlink(temporary_folder,recursive = TRUE),add=TRUE)

createTempDir<-function(parent_dir, temp_dir_prefix = "", length_random_suffix = 10){
  if(!file.exists(parent_dir)){
    stop(paste0("ERROR parent_dir does not exist: ", parent_dir))
  }

  dir_created = FALSE

  while(!dir_created){
    random_chars = sample(c(letters, toupper(letters), 0:9), length_random_suffix, replace=TRUE)
    randomStr = paste(random_chars, collapse = "")
    temporary_dir = paste(parent_dir, "/", temp_dir_prefix, "_", randomStr, "/", sep = "")

    if(!file.exists(temporary_dir)){
      dir.create(temporary_dir)
      if(!file.exists(temporary_dir)){
        stop("ERROR temporary directory could not be created:", temporary_dir)
      }
      dir_created = TRUE
    }

  }
  return(temporary_dir)
}
