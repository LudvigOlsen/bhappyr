
#   ____________________________________________________________________________
#   Generate Sentence(s) External Function                                  ####

#' @title Generate sentences.
#' @description
#' Generates sentences by inserting randomly selected words of specified
#' word types at specified locations in sentence structures.
#'
#' Use internal sentence structures and / or provide your own.
#'
#' Use internal word lists and / or provide your own.
#'
#' Specify constraints on the selection of words.
#'
#' @param n Number of sentences to generate (Integer).
#' @param structures Character Vector. E.g.:
#'
#' \code{c("My [noun] is [positive_adj] today!",
#' "[salutation]! How you've grown with the task!")}
#'
#' Constrain the selection of words by specifying \strong{word info codes}.
#' E.g. only sample elements from the word list with
#' max. 1 word in them, i.e. no white spaces:
#'
#' \code{"[salutation(w1)]"}
#'
#' Pass multiple word types - from which one is randomly selected:
#'
#' \code{"[male_first_name/female_first_name]"}
#'
#' See available \code{Word Types} below.
#'
#' See available \code{Word Info Codes} below.
#' @param word_lists List of word lists. A word list
#' is named by the word type, e.g. verb.
#' @param int_structures Use internal structures (Logical).
#' @param int_word_lists Use internal word lists (Logical).
#' @author Ludvig Renbo Olsen, \email{r-pkgs@ludvigolsen.dk}
#' @export
#' @return Character Vector
#' @details
#' A structure is randomly chosen. To make sure you get a specific
#' structure, pass only one structure and set int_structures to FALSE.
#'
#' @section Word types:
#'
#' \subsection{Positive words}
#' [positive_adj]
#' [positive_vb]
#' [positive_vb_past]
#' [positive_adv]
#'
#' \subsection{Verb forms}
#' [verb_base]
#' [verb_past]
#' [verb_past_participle]
#' [verb_es]
#' [verb_ing]
#'
#' \subsection{Noun forms}
#' [noun]
#' [noun_plural]
#'
#' \subsection{Persons}
#' [salutation]
#' [male_first_name]
#' [female_first_name]
#' [male_full_name]
#' [female_full_name]
#'
#' \subsection{Specific synonyms}
#' Notice: These are added as needed by author.
#'
#' [create_syn]
#' [small_syn]
#' [big_syn]
#'
#' \subsection{Nationality}
#' [nationality_adj]
#' [nationality_people]
#'
#' \subsection{Statistics}
#' [statistics_tradition]
#'
#' @section Word info codes:
#'
#' \subsection{w + number}
#' Sample from elements with maximum number of words,
#' i.e. number of white spaces -1.
#'
#' E.g.: \code{(w1)}
#'
#' @examples
#' # Attach package
#' library(bhappyr)
#'
#' # Create structures
#' st <- c("[salutation]! You are [positive_adj] today! ;)",
#'         "You [positive_vb_past] that code! [positive_adj]!")
#'
#' wl <- list("salutation" = c("Sir", "Mother", "Dear", "Friend"),
#'            "positive_adj" = c("beautiful", "bright", "smart"),
#'            "positive_vb_past" = c("accomplished","played", "modified"))
#'
#' ## Example 1
#' # Using internal structures + word lists
#'
#' # Generate 1 sentence
#' generate_sentence()
#'
#' ## Example 2
#' # Providing structures
#' # and not using internal structures
#'
#' # Generate 2 sentences
#' generate_sentence(n = 3, structures = st,
#'                   int_structures = FALSE)
#'
#' ## Example 3
#' # Providing word_lists and structures
#' # and not using internal word_lists and structures
#'
#' # Generate 3 sentences
#' generate_sentence(n = 3, structures = st,
#'                   word_lists = wl,
#'                   int_structures = FALSE,
#'                   int_word_lists = FALSE)
#'
generate_sentence <- function(n = 1, structures = NULL,
                              word_lists = NULL,
                              int_structures = TRUE,
                              int_word_lists = TRUE){

##  .................. #< 3d3a4497a3d9590dc2b45fc8bf09cc7e ># ..................
##  Check arguments                                                         ####

  stopifnot(is.null(structures) || is.character(structures))
  stopifnot(is.null(word_lists) || is.list(word_lists))
  stopifnot(is.logical(int_structures))
  stopifnot(is.logical(int_word_lists))

  if (is.null(structures) && !isTRUE(int_structures)){

    stop("Needs either internal or external structures.")

  }

  if (is.null(word_lists) && !isTRUE(int_word_lists)){

    stop("Needs either internal or external word_lists.")

  }

  # Check if any lists are empty
  if (!is.null(word_lists)){

    # String with names of empty sub lists
    empty_lists <- empty_sub_lists(word_lists)

    # If any empty lists
    if (nchar(empty_lists) > 0){

      # Raise error
      stop(paste("Empty word list(s): ", empty_lists, sep=""))

      }

  }

##  .................. #< 1bee2b58bfa9352288ff51f44adc33e0 ># ..................
##  Ready the structures                                                    ####
### . . . . . . . . .. #< 2628523ce82797a5442b928169b541d8 ># . . . . . . . . ..
### Internal structures                                                     ####

  internal_structures <- c(int_structs, song_structs, finger_structs)

### . . . . . . . . .. #< 9f4a84130240e671a914398a41086d34 ># . . . . . . . . ..
### External and/or internal structures                                     ####

  # If structures are passed and
  # we also want internal structures
  if (!is.null(structures) && isTRUE(int_structures)){

    structs <- c(structures, internal_structures)

  # If structures are passed but
  # we don't want internal structures
  } else if (!is.null(structures)){

    structs <- structures

  # If we just want internal structures
  } else {

    structs <- internal_structures

  }


##  .................. #< bb3f79363a190fa34c4b3879e49e2fab ># ..................
##  Ready word lists                                                        ####
### . . . . . . . . .. #< 2628523ce82797a5442b928169b541d8 ># . . . . . . . . ..
### Internal word lists                                                     ####

  # From sysdata.rda
  internal_word_lists <- word_sets

### . . . . . . . . .. #< 9f4a84130240e671a914398a41086d34 ># . . . . . . . . ..
### External and/or internal structures                                     ####

  # Notice, word_lists already contain the external
  # word lists, so no need to assign it it we only
  # want to use external word lists

  # If structures are passed and
  # we also want internal structures
  if (!is.null(word_lists) && isTRUE(int_word_lists)){

    word_lists <- append(word_lists, internal_word_lists)

  # If we just want internal structures
  } else if (is.null(word_lists) && isTRUE(int_word_lists)){

    word_lists <- internal_word_lists

  }

##  .................. #< 98c98f555a8737edb7002a316b73c4ee ># ..................
##  Generate sentences                                                      ####

  sentences <- plyr::llply(1:n, function(s){

    gen_sent(structs, word_lists)

  })

##  .................. #< 33cb8beffc440d7074e6d218a6e8b7f6 ># ..................
##  Return sentences                                                        ####

  return(unlist(sentences))


}


