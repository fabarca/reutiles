#' Prints Debug Log
#'
#' Prints on the screen a string (or a vector) for debugging, indicating date and time of the system.
#'
#' @param ... Strings, or vectors. Same behavior as paste(...).
#' @param s Optional. A string to separate the terms. Same behavior as 'sep' on paste().
#' @param c Optional. A string to separate the collapsed vectors. Same behavior as 'collapse' on paste().
#' @export
#' @details debug_log is enable by default. It could be disable using: options('reutiles-DEBUG_LOG'=FALSE)
#'


debug_log<-function(...,s=" ",c=" "){
  # TODO: add option to write the log to a file
  enable_debug = getOption('reutiles-DEBUG_LOG')
  if(is.null(enable_debug)){
    enable_debug = TRUE
    options('reutiles-DEBUG_LOG' = enable_debug)
  }
  if(enable_debug){
    debug_txt = paste(...,sep=s, collapse = c)
    cat('[', as.character(Sys.time()), "] (DEBUG): ", debug_txt,"\n",sep="")
  }
}

