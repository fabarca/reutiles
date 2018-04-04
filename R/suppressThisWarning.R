#' Suppress This Warning
#'
#' Suppress a specific warning
#' @param expr Expression to be evaluated.
#' @param pattern Character string (regexp) to be matched with the possible warnings.
#' @export
suppressThisWarning <- function(expr, pattern){
  withCallingHandlers(expr, warning=function(w) {
    if (grepl(pattern, conditionMessage(w)))
      invokeRestart("muffleWarning")
  })
}

