#' Get Path of the Current Script
#'
#' Returns the path of the current script. When the path couldn't be found, it returns NULL (e.g. R console).
#'
#' @return String path or NULL
#' @export


thisScript<-function() {

  is_installed_rstudio = ("rstudioapi" %in% installed.packages()[,"Package"])

  if(is_installed_rstudio){
    is_rstudio_session = rstudioapi::isAvailable()

    if(is_rstudio_session){
      is_source_panel_active = (rstudioapi::getActiveDocumentContext()$id != '#console')

      if(is_source_panel_active){
        this_script_path = normalizePath(rstudioapi::getActiveDocumentContext()$path)
        return(this_script_path)
      }
    }
  }

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
