#' Throw Error if Object is Wrong Type
#'
#' Throw an error if object doesn't match the specified type
#'
#' @param x Logical expression.
#' @param test_type String containing the type to test. Valid types: 'character', 'numeric' or 'logical'
#'
#' @export

errorIfNotType<-function(x, test_type){

  send_stop = FALSE

  if(test_type == 'character'){
    send_stop = !is.character(x)
  }
  else if(test_type == 'numeric'){
    send_stop = !is.numeric(x)
  }
  else if(test_type == 'logical'){
    send_stop = !is.logical(x)
  }
  else{
    stop('invalid test_type: ', test_type)
  }

  if(send_stop){
    mc = match.call()
    x_name = deparse(mc[[2]])
    error_str = paste0('Object \'', x_name, '\' is not ', test_type,'. Type: ', typeof(x))
    parent_call = sys.call(-1)

    if(!is.null(parent_call)){
      parent_function = deparse(parent_call)
      error_str = paste0('in function "', parent_function, '". ',error_str)
    }
    stop(error_str, call. = FALSE)
  }

}
