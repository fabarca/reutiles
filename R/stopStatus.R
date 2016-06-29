#' Stop With Custom Status
#'
#' stopStatus stops execution of the current expression and executes an error action returning a custom error status.
#'
#' @param ... zero or more objects. Same behavior as stop(...).
#' @param status Optional. The (numerical) error status to be returned to the operating system.
#' @export
#'
#' @details The default error handler for non-interactive use returns error status 1. Error status 2 is used for R ‘suicide’, that is a catastrophic failure, and other small numbers are used by specific ports for initialization failures. It is recommended that users choose statuses of 10 or more.


stopStatus<-function(...,status=1){
  status = as.integer(status)
  warning_msg = "stopStatus: status must be an integer greater than 0. status = 1 will be used."
  if(is.na(status) | length(status) == 0){
    status = 1
    warning(warning_msg)
  }
  else if(status < 1){
    status = 1
    warning(warning_msg)
  }

  if(interactive()){
    stop(...,call. = FALSE)
  }
  else{
    try(stop(...,call. = FALSE))
    q("no", status = status, runLast = FALSE)
  }
}

