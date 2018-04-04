#' Date-time Conversion
#'
#' Wrapper to function as.POSIXct
#'
#' @param x An object to be converted.
#' @param tz A time zone specification to be used for the conversion. Default 'UTC'.
#' @param origin a date-time object, or something which can be coerced to. Default '1970-01-01'.
#' @param ... Further arguments to be passed to or from other methods.
#'
#' @seealso \code{\link{as.POSIXct}}
#'
#' @export
as.DateTime<-function(x, tz='UTC', origin='1970-01-01', ...){
  datetime_obj = as.POSIXct(x, tz=tz, origin = origin, ...)
  return(datetime_obj)
}

#' Test of DateTime
#'
#' Test if an object is of POSIXct class
#'
#' @param x Object to be tested.
#'
#' @seealso \code{\link{POSIXct}}
#'
#' @export
is.DateTime<-function(x){
  return("POSIXct" %in% class(x))
}
