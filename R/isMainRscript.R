#' Check main Rscript
#'
#' Return a boolean depending on whether the current script is the main script called from Rscript or not.
#'
#' @export


isMainRscript<-function(){
  if(isRscript()){
    if( isRscript(returnPath = TRUE) == thisScript() ){
      return(TRUE)
    }
  }
  return(FALSE)
}
