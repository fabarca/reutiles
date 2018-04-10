#' Create Temporary Directory
#'
#' Create a temporary directory with a random name in a specific location.
#'
#' @param parent_dir Location where the temporary direcotiry will be created.
#' @param temp_dir_prefix Optional. String that will be used as prefix for the temporary directory.
#' @param length_random_suffix Optional. Number of random chars that will be used as suffix. By default 10.
#' @param trailing_slash Optional. Boolean indicating if a trailing slash should be added. By default TRUE.
#' @export
#' @examples
#'
#' some.function <- function(..., temp_folder = '/default/path'){
#'   temporary_folder = createTempDir(temp_folder,"prefix_str")
#'   print(temporary_folder)
#'   # this will remove the temporary folder at the end of function execution
#'   on.exit(unlink(temporary_folder,recursive = TRUE),add=TRUE)
#'
#'   # Some code
#'
#' }

createTempDir<-function(parent_dir, temp_dir_prefix = "", length_random_suffix = 10, trailing_slash = TRUE){
  if(!file.exists(parent_dir)){
    stop("ERROR parent_dir does not exist: '", parent_dir, "'")
  }
  if(!is.character(temp_dir_prefix)){
    stop("ERROR temp_dir_prefix must be a character string")
  }

  dir_created = FALSE

  while(!dir_created){
    random_chars = sample(c(letters, toupper(letters), 0:9), length_random_suffix, replace=TRUE)
    randomStr = paste(random_chars, collapse = "")
    temporary_dir = paste0(parent_dir, "/", temp_dir_prefix, "_", randomStr)

    if(!file.exists(temporary_dir)){
      dir.create(temporary_dir)
      if(!file.exists(temporary_dir)){
        stop("ERROR temporary directory could not be created: '", temporary_dir, "'")
      }
      dir_created = TRUE
      if(trailing_slash){
        temporary_dir = paste0(temporary_dir, "/")
      }

    }

  }
  return(temporary_dir)
}


#' Run Expression In a Temporary Directory
#'
#' @param expr Expression to be evaluated in a temporary directory.
#' @param temp_dir Optional. Path to temporary main directory. Default tempdir()
#' @param prefix Optional. String that will be used as prefix for the temporary subfolder.
#' @return Returns invisibly the last value evaluated in the expression.
#' @note Working directory will be change to temporary subfolder. Once the evaluation of
#'       the expression is finished, the working directory will be restored and the
#'       temporary subfolder (with its contents) will be deleted. The temporary main
#'       directory will remain untouched.
#'
#' @export
#' @examples
#' temp_wd = runInTempDir({getwd()})
#' temp_wd
runInTempDir<-function(expr, temp_dir = tempdir(), prefix = 'temp'){
  checkmate::assert_directory_exists(temp_dir)

  current_path = getwd()
  on.exit(setwd(current_path), add = TRUE)

  tmp_path = reutiles::createTempDir(temp_dir, prefix)
  on.exit(unlink(tmp_path, recursive = TRUE), add = TRUE)
  setwd(tmp_path)
  last_result = expr
  return(invisible(last_result))
}
