#' Check Datetime String Format
#'
#' Return a boolean depending on whether the datetime string is in the right format or not.
#'
#' @param format By default equals to "\%Y-\%m-\%d \%H:\%M:\%S"
#'
#' @export
isValidDateTime<-function(datetime, format = "%Y-%m-%d %H:%M:%S"){
  datetime_obj = strptime(datetime, format = format)
  return(!is.na(datetime_obj))
}


#' Check Date String Format
#'
#' Return a boolean depending on whether the date string is in the right format or not.
#'
#' @param format By default equals to "\%Y-\%m-\%d"
#'
#' @export
isValidDate<-function(date, format = "%Y-%m-%d"){
  return(isValidDateTime(date, format = format ))
}


#' Check Time String Format
#'
#' Return a boolean depending on whether the time string is in the right format or not.
#'
#' @param format By default equals to "\%H:\%M:\%S"
#'
#' @export
isValidTime<-function(date, format = "%H:%M:%S"){
  return(isValidDateTime(date, format = format ))
}
