# library(reutiles)
context("Test suppressThisWarning")

somefunction<-function(throw_warn){
  if(throw_warn) warning('warning 00001')
  return(TRUE)
}

test_that("suppressThisWarning is working", {
  expect_warning(suppressThisWarning(somefunction(TRUE), 'bad pattern'), "warning 00001")
  expect_true(suppressThisWarning(somefunction(TRUE), 'warning 00001'))
  expect_true(suppressThisWarning(somefunction(TRUE), 'warning \\d{5}'))
})

