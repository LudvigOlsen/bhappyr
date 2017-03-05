library(bhappyr)
context("generate_sentence")

test_that("generate_sentence handles new structures correctly", {
  count_char_occurrences <- bhappyr:::count_char_occurrences

  spaces_in_sentences <- function(n, structures) {
    counts <- unlist(sapply(
      generate_sentence(
        n = n,
        structures = structures,
        int_structures = F
      ),
      count_char_occurrences,
      char = " "
    ))

    names(counts) <- NULL

    return(counts)

  }

  expect_equal(generate_sentence(
    structures = c("hello man!"),
    int_structures = F
  ),
  "Hello man!")

  expect_equal(spaces_in_sentences(
    n = 2,
    structures = c("hello [positive_adj] [noun]!")
  ), c(2, 2))

  expect_equal(spaces_in_sentences(
    n = 3,
    structures = c(" hello [positive_adv] my [noun] ! ")
  ), c(6, 6, 6))

  expect_equal(spaces_in_sentences(n = 2, structures = c("   ")), c(3, 3))


})

test_that("generate_sentence handles new word lists correctly", {

  expect_equal(generate_sentence(n=1,
                                 structures = c("[positive_adj] [pos_cat]"),
                                 word_lists = list(
                                   "positive_adj" = c("nice"),
                                   "pos_cat" = c("miav")
                                 ),
                                 int_structures = F,
                                 int_word_lists = F),
               "Nice miav")

  # If word list doesn't exist!
  expect_error(generate_sentence(n=1,
                                 structures = c("[positive_adj] [pos_cat]"),
                                 word_lists = list(
                                   "positive_adj" = c("nice")
                                 ),
                                 int_structures = F,
                                 int_word_lists = F),
               "Word list [pos_cat] not found in word_lists", fixed = T)

  # If a word list is empty!
  expect_error(generate_sentence(n=1,
                                 structures = c("[positive_adj] [pos_cat]"),
                                 word_lists = list(
                                   "positive_adj" = c("nice"),
                                   "pos_cat" = c()
                                 ),
                                 int_structures = F,
                                 int_word_lists = F),
               "Empty word list(s): pos_cat", fixed = T)

  # If 2 word lists are empty!
  expect_error(generate_sentence(n=1,
                                 structures = c("[positive_adj] [pos_cat]"),
                                 word_lists = list(
                                   "positive_adj" = c("nice"),
                                   "pos_cat" = c(),
                                   "pos_dog" = c()
                                 ),
                                 int_structures = F,
                                 int_word_lists = F),
               "Empty word list(s): pos_cat, pos_dog", fixed = T)

})


# function(n = 1, structures = NULL,
#          word_lists = NULL,
#          int_structures = TRUE,
#          int_word_lists = TRUE)
