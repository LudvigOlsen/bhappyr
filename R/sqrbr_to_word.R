
#   __________________ #< 05402f32b12933563b9ce06e6057aea4 ># __________________
#   helper: sqrbr_to_word                                                   ####


sqrbr_to_word <- function(sqrbr_word, word_lists){

##  ............................................................................
##  Description                                                             ####

  #
  # Converts word type, given as string with square brackets
  # around it, to a word of that word type
  #
  # Input should be:
  # .. "[word_type]"
  # .. "[word_type(word_info)]"
  # .. "[word_type1/word_type2]"
  #
  # Word info let us constrain the
  # words to select from or manipulate
  # the words once sampled.
  #
  # Allowed word info:
  # w + number - Max number of words in element
  # .. e.g.: (w1)
  # upper - make first letter uppercase
  # .. e.g. (upper)
  # .. Notice, first word and words after a dot is automatically
  # .. uppercased on first letter.
  #
  # Choose between multiple word types with [a/b]
  #

##  .................. #< 5e2b9569cd6f8a1bb2901f6e44cbe9e6 ># ..................
##  Remove square brackets                                                  ####

  word_type <- substr(sqrbr_word, 2, nchar(sqrbr_word)-1)

##  .................. #< 81d2c1623d07b6fd6b76b91f678cf1a3 ># ..................
##  Check for whitespaces                                                   ####

  stopifnot(!has_white_space(word_type))

##  .................. #< 4303594a1b4000a76cd8756ae7bee81b ># ..................
##  Check for multiple word types “/"                                       ####

  if (grepl("/", word_type, fixed = T)){

    # Split word_type to get the various word_types
    word_types <- unlist(strsplit(word_type, "/", fixed = T))

    # Choose one
    word_type <- word_types[sample(length(word_types),1)]

  }

##  .................. #< 89e6acd0c43ac2f0fbb338689fca9257 ># ..................
##  Check for word info (constraints)                                       ####

  # If word_type contains information about
  # how many words to use, use it
  if (grepl("(", word_type, fixed = T)){

    # Split word_type to get word_type and word_info
    word_type_info <- unlist(strsplit(word_type, "(", fixed = T))

    # Get word type
    word_type <- word_type_info[1]

    # Get the information for constraining
    # which words to use
    # Remove ")" from end
    word_info <- substr(word_type_info[2],1,
                        nchar(word_type_info[2])-1)

### . . . . . . . . .. #< 1d8a6c2c42aed750ea097f634f012111 ># . . . . . . . . ..
### Get and check word list                                                 ####

    # Get word list
    d <- tryCatch({

      word_lists[[word_type]]

    }, error = function(e){

      stop(paste("Word list [",
                 word_type,
                 "] not found in word_lists",
                 sep=""))
    })

    # If no word list was found
    # raise error
    if (is.null(d)){

      stop(paste("Word list [",
                 word_type,
                 "] not found in word_lists",
                 sep=""))

    }

### . . . . . . . . .. #< b6270c60e20587eb09ea3a9c7364af5f ># . . . . . . . . ..
### If max number of words (w) is set                                       ####

    if(grepl("w", word_info, fixed=T)){

      # How many words?
      n_words <- as.integer(substr(word_info, 2, nchar(word_info)))

      # Subset d to only get elements with n_words number of words
      d <- d[count_char_occurrences(" ",d) < n_words]

    }

### . . . . . . . . .. #< 57b480ae6bb438128e9590e7e822484a ># . . . . . . . . ..
### If uppercase first letter is set                                        ####

    if(grepl("upper", word_info, fixed=T)){

      set_upper <- TRUE

    } else {

      set_upper <- FALSE
    }

##  .................. #< ff7ece4dda46ca701de8cc65ee39bce0 ># ..................
##  If no word info                                                         ####

  } else {

    set_upper <- FALSE

### . . . . . . . . .. #< 89b4d7de28170bebf1b89b063768546f ># . . . . . . . . ..
### Get and check word list                                                 ####

    # Get word list
    d <- tryCatch({

      word_lists[[word_type]]

    }, error = function(e){

      stop(paste("Word list [",
                 word_type,
                 "] not found in word_lists",
                 sep=""))
    })

  }

  # If no word list was found
  # raise error
  if (is.null(d)){

    stop(paste("Word list [",
               word_type,
               "] not found in word_lists",
               sep=""))

  }

##  .................. #< f052eb63118deb09902eb6cd8ed73c5f ># ..................
##  Sample word                                                             ####

  # Sample 1 word from the data object
  # with the word_type name
  word <- sample(d,1)

##  .................. #< 98f5bb9553d3ffa71470b635cee04208 ># ..................
##  Set uppercase first letter                                              ####

  if (isTRUE(set_upper)){

    word <- simpleCap(word)

  }

##  .................. #< a982aac612c8d6bb5464118c2444f98c ># ..................
##  Return word                                                             ####

  return(word)

}




