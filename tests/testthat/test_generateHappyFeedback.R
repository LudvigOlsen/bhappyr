library(bhappyr)
context("generateHappyFeedback")

test_that("generateHappyFeedback doesn't crash on 1000 runs", {

  capture.output(
  for (i in 1:1000){

    expect_warning(generateHappyFeedback(), regexp = NA)

  })



})
