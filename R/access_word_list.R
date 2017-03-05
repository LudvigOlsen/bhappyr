
#   __________________ #< f75c015b2f18360f65794f2bfcc17ae6 ># __________________
#   Access word type                                                        ####

#' @title Retrieve internal word list.
#' @description Access an internal word list. See \code{Word types} below.
#' @param word_type Name of word list to retrieve (Character)
#' @author Ludvig Renbo Olsen, \email{r-pkgs@ludvigolsen.dk}
#' @export
#' @return word list (Character Vector).
#' @inheritSection generate_sentence Word types
access_word_list <- function(word_type){

  #
  # Returns specified internal word list
  #

  return(word_sets[[word_type]])

}
