
#   __________________ #< c7161c35cabb5cde1d92ee9d98a47b68 ># __________________
#   rate_sentence                                                           ####

#' @title Generate and rate sentence.
#' @description Generates a sentence and asks user to rate it
#' in the console.
#'
#' Pass question, rating scale, and min/max rating labels.
#'
#' Min/max rating labels can be passed as word types.
#' See \code{Word types} below.
#' @inheritParams generate_sentence
#' @param question (Character)
#' @param rscale Rating scale min and max.
#'
#' E.g. \code{c(1,10)}
#'
#' Pass \code{'random'} to automatically create
#' scale
#' @param max_rating Label for max rating value
#' @param min_rating Label for min rating value
#' @param change_label Whether to sample new word for labels,
#' which have been passed as word types, on each run
#' or only once (Logical).
#' @param change_rscale Whether to create new random scale
#' on each run or only once (Logical).
#' @param rscale_limits Limits if generating random scale
#'
#' E.g. c(1,1000)
#' @author Ludvig Renbo Olsen, \email{r-pkgs@ludvigolsen.dk}
#' @export
#' @return Collected responses, sentences, rating labels and
#' and the rating scale (Dataframe).
#' @inheritSection generate_sentence Word types
#' @examples
#' # Attach package
#' library(bhappyr)
#'
#' # Example 1
#' # Generate 1 sentence and rate it.
#' rate_sentence()
#'
#' # Example 2
#' # Generate 3 sentences and rate them.
#' # Use random scale on each run.
#' rate_sentence(n=3, rscale = 'random',
#'               change_rscale = TRUE)
#'
#' # Example 3
#' # Generate 3 sentences and rate them.
#' # Use random max_rating label on each run.
#' rate_sentence(n=3, max_rating = "[superb(upper)]",
#'               change_label = TRUE)
rate_sentence <- function(n = 1,
                          question = "Was this sentence funny?",
                          rscale = c(1,10),
                          max_rating = "Extremely",
                          min_rating = "Not at all!",
                          change_label = FALSE,
                          change_rscale = FALSE,
                          rscale_limits = c(1,1000),
                          structures = NULL,
                          word_lists = NULL,
                          int_structures = TRUE,
                          int_word_lists = TRUE){

  # change_label: Whether or not to make new rating labels
  # .. each time. Only works if max or min rating is given
  # .. as word type, e.g. [positive_adj]


  # Generate sentences
  sentences <- generate_sentence(n = 1,
                                 structures = structures,
                                 word_lists = word_lists,
                                 int_structures = int_structures,
                                 int_word_lists = int_word_lists)

##  .................. #< 91e22fa1c7d353c62bbdca9f7b0bd9eb ># ..................
##  Set up word lists for generating question                               ####

  # If user gave new word_lists we need to know them
  # in order for the min and max rating labels
  # to be passed as word types

  word_lists <- check_word_lists(word_lists,
                                 int_word_lists)

  # Set rating labels once
  if (!isTRUE(change_label)){

    max_rating <- fill_in_form(max_rating, word_lists)
    fill_in_form(min_rating, word_lists)

  }

  # Set scale once
  if (rscale == 'random' && !isTRUE(change_rscale)){

    rscale <- sort(sample(c(rscale_limits[1]: rscale_limits[2]), 2))

  }

  output <-  plyr::ldply(sentences, function(sent){

    # Set rating labels every time
    if (isTRUE(change_label)){

      max_rating <- fill_in_form(max_rating, word_lists)
      fill_in_form(min_rating, word_lists)

    }

    # Set scale once
    if (rscale == 'random' && isTRUE(change_rscale)){

      rscale <- sort(sample(c(rscale_limits[1]: rscale_limits[2]), 2))

    }

    # Show sentence
    cat(paste("\n", sent, "\n\n", sep=""))

    # cat(rep(".",length_quest))

    # Ask for feedback
    response <- readline_while(paste("On a scale from ",
                                 rscale[1],
                                 " to ",
                                 rscale[2],
                                 " where ",
                                 rscale[1],
                                 " is '",
                                 min_rating,
                                 "' and ",
                                 rscale[2],
                                 " is '",
                                 max_rating,
                                 "': ",
                                 question,
                                 " ", sep=""),
                          c(rscale[1]:rscale[2]))

    # Gather information in dataframe
    data.frame("response" = as.integer(response),
                         "scale" = paste(rscale, collapse=":"),
                         "min_rating" = min_rating,
                         "max_rating" = max_rating,
                         "sentence" = sent)

  })


##  .................. #< 95d36e09a966015018e0429bbd114c96 ># ..................
##  Gather sentences and ratings in data.frame                              ####



  return(output)

}
