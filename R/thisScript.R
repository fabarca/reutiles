#' Get Path of the Current Script
#'
#' Returns the path of the current script. When the path couldn't be found, it returns NULL (e.g. R console).
#'
#' @return String path or NULL
#' @export


thisScript<-function() {
  sys_frames = sys.frames()
  sourced_file = NULL
  for(i in 1:length(sys_frames)){
    ls_vars = ls(sys_frames[[i]])
    if("ofile" %in% ls_vars) {
      ## Sourced via R console
      #print(paste(i,'rConsole',normalizePath(sys.frames()[[i]]$ofile)))
      sourced_file = sys_frames[[i]]$ofile
    }
    else if ("fileName" %in% ls_vars) {
      ## Sourced via RStudio
      #print(paste(i,'rStudio', normalizePath(sys.frames()[[i]]$fileName)))
      sourced_file = sys_frames[[i]]$fileName
    }
  }

  if (is.null(sourced_file)) {
    return(isRscript(returnPath=TRUE))
  }
  return(normalizePath(sourced_file))
}
