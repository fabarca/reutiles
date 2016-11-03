#' Append to CSV
#'
#' Wrapper to function write.table.
#'
#' @param data_frame The object to be written, preferably a data frame or a matrix.
#' @param file Either a character string naming a file or a connection open for writing. "" indicates output to the console.
#' @param ... Additional arguments. Same as for write.table.
#'
#' @details If the file doesn't exist, the csv will be created using col.names as header. If the file already exists, the data.frame will be appended without header.
#'
#' @seealso \code{\link{write.table}}
#'
#' @export
append2csv<-function(data_frame, file='', append=TRUE, sep=',', col.names=NULL, row.names=FALSE, ...){

  if(is.null(col.names) & !file.exists(file)){
    col.names=TRUE
    append=FALSE
  }
  else if(is.null(col.names)){
    col.names=FALSE
  }

  write.table(data_frame, file=file, append = append, sep=sep, col.names=col.names, row.names=row.names, ...)
}

