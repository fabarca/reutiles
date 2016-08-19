#' Get Directory of the Current Script
#'
#' Returns directory of the current script. When the path couldn't be found, it returns NULL (e.g. R console).
#'
#' @return String path or NULL
#' @export


thisScriptDir<-function() {
  script_path = thisScript()
  if(is.null(script_path)){
    return(NULL)
  }
  script_dir = paste0(dirname(script_path), '/')
  return(script_dir)
}
