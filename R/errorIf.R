#' Throw Error If Expression
#'
#' Throw an error if logical expression is TRUE
#'
#' @param x Logical expression.
#'
#' @export

errorIf<-function(x){
  if(x){
    mc = match.call()
    x_name = deparse(mc[[2]])
    error_str = paste0('Condition [ ', x_name, ' ] is TRUE ')
    parent_call = sys.call(-1)

    if(!is.null(parent_call)){
      parent_function = paste0(deparse(parent_call), collapse='')
      error_str = paste0('in function [ ', parent_function, ' ] -- ',error_str)
    }
    stop(error_str, call. = FALSE)
  }
}
