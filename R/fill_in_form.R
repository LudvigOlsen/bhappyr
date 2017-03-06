#   __________________ #< 52ce5853dfcc16be47d4b41db94f5f68 ># __________________
#   Convert form to sentence                                                ####

fill_in_form <- function(form, word_lists){

  ##  ............................................................................
  ##  Description                                                             ####

  #
  # Takes sentence form / structure
  # where words that needs to be sampled
  # is specified as [word_type]
  # Converts these to randomly sampled words
  # from the specified word types
  #

##  .................. #< fa1e8eb3e6eba105d11066503434e202 ># ..................
##  Split by brackets                                                       ####

  form_split <- split_by_sqrbrackets(form)

##  .................. #< a33ca4fa1a3f4a96b080d0f8a773c750 ># ..................
##  Convert bracket texts to words                                          ####

  form_split_conv <- plyr::llply(form_split, function(c) {

### . . . . . . . . .. #< d3aa0c1c37d2b7d95cc52d096430213d ># . . . . . . . . ..
### If string contains [                                                    ####

    if (grepl("[", c, fixed = T)) {

      # Convert string to word
      # from the word_type inside
      # the brackets
      return(sqrbr_to_word(c, word_lists))

### . . . . . . . . .. #< 587e671e6dd1602ffd48f375cffcee47 ># . . . . . . . . ..
### If string does not contain [                                            ####

    } else {

      # Just return the string
      return(c)
    }

  })


##  .................. #< 208752170c8472d7ff40fe3c1f1a2aba ># ..................
##  Flatten sentence                                                        ####

  sentence <- unlist(form_split_conv)
  sentence <- paste(sentence, collapse="")


##  .................. #< 6823b2c5d4fce3ab27fdc31959484c87 ># ..................
##  Return sentence                                                         ####

  return(sentence)
}

