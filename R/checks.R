
check_structures <- function(structures,
                             int_structures){

##  .................. #< d6529bc999c358244e21dabe12fe6bc1 ># ..................
##  Check structures                                                        ####

  stopifnot(is.null(structures) || is.character(structures))
  stopifnot(is.logical(int_structures))

  if (is.null(structures) && !isTRUE(int_structures)){

    stop("Needs either internal or external structures.")

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

    return(c(structures, internal_structures))

    # If structures are passed but
    # we don't want internal structures
  } else if (!is.null(structures)){

    return(structures)

    # If we just want internal structures
  } else {

    return(internal_structures)

  }

  return(structs)

}



check_word_lists <- function(word_lists,
                             int_word_lists){


##  .................. #< 2e9f941541ac49e7b39eaa83d582c1c5 ># ..................
##  Check word lists                                                        ####

  stopifnot(is.null(word_lists) || is.list(word_lists))
  stopifnot(is.logical(int_word_lists))

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

##  .................. #< bb3f79363a190fa34c4b3879e49e2fab ># ..................
##  Ready word lists                                                        ####
### . . . . . . . . .. #< 2628523ce82797a5442b928169b541d8 ># . . . . . . . . ..
### Internal word lists                                                     ####

  # From sysdata.rda
  internal_word_lists <- word_sets

### . . . . . . . . .. #< 9f4a84130240e671a914398a41086d34 ># . . . . . . . . ..
### External and/or internal word lists                                     ####

  # Notice, word_lists already contain the external
  # word lists, so no need to assign it it we only
  # want to use external word lists

  # If structures are passed and
  # we also want internal structures
  if (!is.null(word_lists) && isTRUE(int_word_lists)){

    return(append(word_lists, internal_word_lists))

    # If we just want internal structures
  } else if (is.null(word_lists) && isTRUE(int_word_lists)){

    return(internal_word_lists)

  } else {

    return(word_lists)

  }


}
