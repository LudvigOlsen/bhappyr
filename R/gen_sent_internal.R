
#   ____________________________________________________________________________
#   Generate Sentence Internal Function                                     ####

gen_sent <- function(structures, word_lists){

##  ............................................................................
##  Description                                                             ####

  # Various premade forms
  # for putting together the words

  # Create weighting of forms
  # 1: 0.2
  # 2: 0.05
  # etc

##  .................. #< 84c44139aaf2d258400c73e71be03b7b ># ..................
##  Pick form / structure of sentence                                       ####

  structure <- sample(structures,1)

##  .................. #< 546a2cbe5424c33798a23e3addb07563 ># ..................
##  Convert form to sentence                                                ####

  sentence <- fill_in_form(structure, word_lists)


##  .................. #< 14650f370b395e989aab4948149f3558 ># ..................
##  Beautify sentence                                                       ####
### . . . . . . . . .. #< e104f20582f4b02838fa33d019834ff5 ># . . . . . . . . ..
### Add uppercase first letters                                             ####

  # Uppercase first letter after punctuation (dot, ?, !) and white space
  sentence <- first_upper(sentence)


### . . . . . . . . .. #< 8f8e8f6ec02a770ef9661b26a0e014ee ># . . . . . . . . ..
### Decide a/an                                                             ####

  sentence <- a_an(sentence)

##  .................. #< d76af6f9487439dab5e02ac1ed647fac ># ..................
##  Return sentence                                                         ####

  return(sentence)
}



