
#   ____________________________________________________________________________
#   Helper functions                                                        ####
#   __________________ #< afaac1de2d8b084b5f88ee6a0595f000 ># __________________
#   helper: has_white_space                                                 ####

has_white_space <- function(c){

  #
  # Checks if string contains white space
  #

  return(grepl(" ", c))

}

#   __________________ #< 0f56a682a551722ba64ba558fae36399 ># __________________
#   helper: first_upper                                                     ####

first_upper <- function(x){

  #
  # Capitalize first letter of string
  # and first letters after dots
  #
  gsub("([.!?]\\s*[a-zA-Z]|^[a-zA-Z])","\\U\\1", x, perl=TRUE)

}


#   __________________ #< 0f56a682a551722ba64ba558fae36399 ># __________________
#   helper: a_an                                                            ####

a_an <- function(x){

  #
  # For each occurrence of the words a and an
  # check if upcoming word starts with vowel or consonant
  # Change a or an to fit this
  # Doesn't take silent consonants where there is a
  # vowel sound instead into account
  #

  cons <- "bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTWXZ"
  vows <- "aeiouyAEIOUY"

  patterns <- c(paste("\\sa(?=\\s+[", vows, "])", sep=""),
                paste("^a(?=\\s+[", vows, "])", sep=""),
                paste("\\sA(?=\\s+[", vows, "])", sep=""),
                paste("^A(?=\\s+[", vows, "])", sep=""),
                paste("\\san(?=\\s+[", cons, "])", sep=""),
                paste("^an(?=\\s+[", cons, "])",sep=""),
                paste("\\sAn(?=\\s+[", cons, "])", sep=""),
                paste("^An(?=\\s+[", cons, "])", sep=""),
                paste("\\sAN(?=\\s+[", cons, "])", sep=""),
                paste("^AN(?=\\s+[", cons, "])", sep=""))

  replacements <- c(" an",
                    "an",
                    " An",
                    "An",
                    " a",
                    "a",
                    " A",
                    "A",
                    " A",
                    "A")

  x <- mgsub(patterns, replacements, x, perl=T)

  return(x)


}


#   __________________ #< b06852f5ded17b7a2809eec199383861 ># __________________
#   helper: mgsub - Multiple Gsubs at once                                  ####

mgsub <- function(pattern, replacement, x, ...) {


##  ............................................................................
##  Description                                                             ####

  #
  # Takes a list of patterns an list of replacements
  # Gsubs pattern[1] with replacement[1], etc.
  #
  # by Theodore Lytras
  # http://stackoverflow.com/questions/15253954/replace-multiple-arguments-with-gsub
  #

##  .................. #< da7e5c89117ea24d4ac14c9d61c256d9 ># ..................
##  Check arguments                                                         ####

  if (length(pattern)!=length(replacement)) {

    stop("pattern and replacement do not have the same length.")

  }

##  .................. #< 498c6f200999a6a0703210c23c1f5def ># ..................
##  Iterate substitutions                                                   ####

  for (i in 1:length(pattern)) {

    x <- gsub(pattern[i], replacement[i], x, ...)

  }

##  .................. #< d966b2ce85b6a5fb67ee2cf3d5bd599f ># ..................
##  Return result                                                           ####

  return(x)
}


#   __________________ #< 09da0a0210d532d5f04d13352f06551d ># __________________
#   helper: simpleCap from toupper() docs                                   ####

simpleCap <- function(x) {
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}


#   __________________ #< a71cc822eeebaccb5828de4c16a03916 ># __________________
#   helper: count_char_occurences                                           ####

count_char_occurrences <- function(char, s) {

  ##  ............................................................................
  ##  Description                                                             ####

  #
  # Count how many times a char is in a string
  # Uli Köhler at
  # https://techoverflow.net/2012/11/10/r-count-occurrences-of-character-in-string/
  #

  ##  .................. #< 918f59c557502d39a263579fa839a984 ># ..................
  ##  Count char occurences                                                   ####

  s2 <- gsub(char,"",s)
  return (nchar(s) - nchar(s2))
}


#   __________________ #< 9ad4ec5ac3356727fe16635b916d895e ># __________________
#   helper: Any empty sublists?                                             ####

empty_sub_lists <- function(list) {

  # Get empty sub lists
  empty_lists <-  plyr::llply(list, function(l){

    !(length(l) > 0)

  })

  # If any empty sub lists
  if (length(empty_lists) > 0){

    # Unlist
    empty_lists <- unlist(empty_lists)

    # Get a string with the list names
    empty_lists <- paste(names(empty_lists[empty_lists]), collapse=", ")

  }

  # Return empty lists
  return(empty_lists)

}




#   __________________ #< 97010e2adbc649e9e3270b0da7776735 ># __________________
#   helper: readline_while                                                  ####

readline_while <- function(message, responses = c("y","n")){

  ##  ............................................................................
  ##  Description                                                             ####

  #
  # Runs readline until an allowed answer is given
  #

  ##  .................. #< afa40bc764f547d75453ddab2af4aac9 ># ..................
  ##  Argument checks                                                         ####

  # message must be character
  stopifnot(is.character(message))

  ##  .................. #< 3852eee207dff65eb97bd39333303c3d ># ..................
  ##  readline() until acceptable answer                                      ####

  # As long as resp is not in the list of allowed responses
  # or it doesn't exist (first round)
  while(!exists("resp") || !(resp %in% responses)){

    # Ask user for input with the given message
    resp <- readline(message)

  }

  ##  .................. #< b8961aac26b8c9a70ef5589e5189e455 ># ..................
  ##  Return response                                                         ####

  # Return accepted user input
  return(resp)

}


#   __________________ #< 4a7db5ad7162984c6a118944606ccbf8 ># __________________
#   Fill in rscale (‘random’)                                               ####

fill_in_rscale <- function(rscale, rscale_limits){


##  .................. #< 1b80714081ed45173ed49bb76c57c0f5 ># ..................
##  Both min and max are ‘random’                                           ####

  if (length(rscale) == 1){

    if (rscale == 'random'){

      rscale <- sort(sample(c(rscale_limits[1]: rscale_limits[2]), 2))

    } else {

      stop("rscale incorrectly specified.")

    }

  } else if (FALSE %ni% (rscale == c('random','random'))){

    rscale <- sort(sample(c(rscale_limits[1]: rscale_limits[2]), 2))

##  .................. #< ef25d886024dda7befd4a0583e74686e ># ..................
##  Only min is ‘random’                                                    ####

  } else if (rscale[1] == 'random'){

    # Find the maximum rscale[1] value
    max_min <- as.integer(rscale[2])-1

    rscale <- c(sample(c(rscale_limits[1]: max_min), 1),
                as.integer(rscale[2]))

##  .................. #< a4364ccd858560b7867baa87ba811c13 ># ..................
##  Only max is ‘random’                                                    ####

  } else if (rscale[2] == 'random'){

    # Find the minimum rscale[2] value
    min_max <- as.integer(rscale[1])+1

    rscale <- c(as.integer(rscale[1]),
                sample(c(min_max: rscale_limits[2]), 1))
  }

##  .................. #< 6f0bafb21765985a9f961e1f7a66d9d1 ># ..................
##  Return rscale                                                           ####

  return(rscale)

}


#   __________________ #< 2e3a046f2fedaea9ab8b6f648db0ec64 ># __________________
#   Not in %ni%                                                             ####

`%ni%` <- Negate(`%in%`)
