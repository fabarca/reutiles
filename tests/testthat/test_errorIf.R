# library(reutiles)
context("Test Functions errorIf")

test_that("errorIf is working", {
  expect_error(errorIf(1 != 2), "Condition \\[ 1 != 2 \\] is TRUE")
})

test_that("errorIfNotType is working", {
  expect_that(errorIfNotType('a','numeric'), throws_error("Object '\"a\"' is not numeric. Type: character"))
  expect_that(errorIfNotType('a','logical'), throws_error("Object '\"a\"' is not logical. Type: character"))
  expect_that(errorIfNotType(1,'character'), throws_error("Object '1' is not character. Type: double"))
})
