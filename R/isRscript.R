#' Check Rscript
#'
#' Return a boolean depending on whether the script was called from Rscript or not.
#'
#' @param returnPath If FALSE (default), it returns TRUE if the script was called from Rscript, or FALSE if it was not.
#'
#' When returnPath is TRUE, instead of returning a boolean, it returns the path of the script or NULL.
#' @export


isRscript<-function(returnPath=FALSE){
  cmdArgs = commandArgs(trailingOnly = FALSE)
  needle = "--file="
  match = grep(needle, cmdArgs)
  if (length(match) == 0) {
    if(returnPath){
      return(NULL)
    }
    return(FALSE)
  }
  if(returnPath){
    return(
      normalizePath(
        sub(needle, "", cmdArgs[match]),
        winslash=.Platform$file.sep,
        mustWork=TRUE
      )
    )
  }
  return(TRUE)
}
