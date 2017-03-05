library(bhappyr)
context("a_an")

test_that("a_an converts a and an correctly depending on upcoming word", {
  a_an <- function(x){bhappyr:::a_an(x)}

  expect_equal(a_an(" and ")," and ")
  expect_equal(a_an(" and hej")," and hej")
  expect_equal(a_an(" and ej")," and ej")
  expect_equal(a_an("hello an heart"),"hello a heart")
  expect_equal(a_an("hello a heart"),"hello a heart")
  expect_equal(a_an("hello an eart"),"hello an eart")
  expect_equal(a_an("hello a eart"),"hello an eart")
  expect_equal(a_an(" helloan heart")," helloan heart")
  expect_equal(a_an(" hello  an heart")," hello  a heart")
  expect_equal(a_an("hello   an   heart"),"hello   a   heart")
  expect_equal(a_an("hello   a   eart"),"hello   an   eart")
  expect_equal(a_an("An eart"),"An eart")
  expect_equal(a_an("An heart"),"A heart")
  expect_equal(a_an("An    heart"),"A    heart")
  expect_equal(a_an("an    heart"),"a    heart")
  expect_equal(a_an(" An    heart")," A    heart")
  expect_equal(a_an(" an    heart")," a    heart")
  expect_equal(a_an("A    eart"),"An    eart")
  expect_equal(a_an("a    eart"),"an    eart")
  expect_equal(a_an(" A    eart")," An    eart")
  expect_equal(a_an(" a    eart")," an    eart")




})

