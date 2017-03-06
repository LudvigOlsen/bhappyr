library(bhappyr)
context("rate_sentence")



test_that("rate_sentence outputs dataframe", {

  expect_is(rate_sentence(simulate = TRUE), "data.frame")


})

test_that("rate_sentence creates no warnings", {

  expect_warning(rate_sentence(3, rscale = c(1,'random'),
                               rscale_limits = c(1,100),
                               change_rscale = T,
                               simulate = T),
                 regexp = NA)

  expect_warning(rate_sentence(3, rscale = c('random',1),
                               rscale_limits = c(1,100),
                               change_rscale = T,
                               simulate = T),
                 regexp = NA)

  expect_warning(rate_sentence(3, rscale = c('random','random'),
                               rscale_limits = c(1,100),
                               change_rscale = T,
                               simulate = T),
                 regexp = NA)

  expect_warning(rate_sentence(3, rscale = 'random',
                               rscale_limits = c(1,100),
                               change_rscale = T,
                               simulate = T),
                 regexp = NA)


})




#### Notice, we have the wrong output, because rate_sentence outputs dataframe.
#
# test_that("rate_sentence handles new structures correctly", {
#   count_char_occurrences <- bhappyr:::count_char_occurrences
#
#   spaces_in_sentences <- function(n, structures) {
#     counts <- unlist(sapply(
#       rate_sentence(
#         n = n,
#         structures = structures,
#         int_structures = F,
#         simulate = T
#       )$sentence,
#       count_char_occurrences,
#       char = " "
#     ))
#
#     names(counts) <- NULL
#
#     return(counts)
#
#   }
#
#   expect_equal(rate_sentence(
#     structures = c("hello man!"),
#     int_structures = F,
#     simulate = T
#   )$sentence,
#   "Hello man!")
#
#   expect_equal(spaces_in_sentences(
#     n = 2,
#     structures = c("hello [positive_adj] [noun]!")
#   ), c(2, 2))
#
#   expect_equal(spaces_in_sentences(
#     n = 3,
#     structures = c(" hello [positive_adv] my [noun] ! ")
#   ), c(6, 6, 6))
#
#   expect_equal(spaces_in_sentences(n = 2, structures = c("   ")), c(3, 3))
#
#
# })
#
# test_that("generate_sentence handles new word lists correctly", {
#
#   expect_equal(rate_sentence(n=1,
#                                  structures = c("[positive_adj] [pos_cat]"),
#                                  word_lists = list(
#                                    "positive_adj" = c("nice"),
#                                    "pos_cat" = c("miav")
#                                  ),
#                                  int_structures = F,
#                                  int_word_lists = F,
#                                  simulate = T),
#                "Nice miav")
#
#   # If word list doesn't exist!
#   expect_error(rate_sentence(n=1,
#                                  structures = c("[positive_adj] [pos_cat]"),
#                                  word_lists = list(
#                                    "positive_adj" = c("nice")
#                                  ),
#                                  int_structures = F,
#                                  int_word_lists = F,
#                                  simulate = T),
#                "Word list [pos_cat] not found in word_lists", fixed = T)
#
#   # If a word list is empty!
#   expect_error(rate_sentence(n=1,
#                                  structures = c("[positive_adj] [pos_cat]"),
#                                  word_lists = list(
#                                    "positive_adj" = c("nice"),
#                                    "pos_cat" = c()
#                                  ),
#                                  int_structures = F,
#                                  int_word_lists = F,
#                                  simulate = T),
#                "Empty word list(s): pos_cat", fixed = T)
#
#   # If 2 word lists are empty!
#   expect_error(rate_sentence(n=1,
#                                  structures = c("[positive_adj] [pos_cat]"),
#                                  word_lists = list(
#                                    "positive_adj" = c("nice"),
#                                    "pos_cat" = c(),
#                                    "pos_dog" = c()
#                                  ),
#                                  int_structures = F,
#                                  int_word_lists = F,
#                                  simulate = T),
#                "Empty word list(s): pos_cat, pos_dog", fixed = T)
#
# })
