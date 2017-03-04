
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
  gsub("([.]\\s*[a-zA-Z]|^[a-zA-Z])","\\U\\1", x, perl=TRUE)

}


#   __________________ #< 0f56a682a551722ba64ba558fae36399 ># __________________
#   helper: a_an                                                         ####

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

