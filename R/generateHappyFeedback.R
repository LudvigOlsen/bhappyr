

#   ____________________________________________________________________________
#   Addin: Generate Happy Feedback                                          ####

#' @title Generate happy feedback.
#' @description Addin for RStudio for generating amusing feedback to lighten the mood
#' of statisticians.
#'
#'
#' See \code{details} for setting up key command.
#' @author Ludvig Renbo Olsen, \email{r-pkgs@ludvigolsen.dk}
#' @export
#' @return Print statement
#' @details How to set up key command in RStudio:
#'
#' After installing package.
#' Go to:
#'
#' \code{Tools} >> \code{Addins} >> \code{Browse Addins} >> \code{Keyboard Shortcuts}.
#'
#' Find \code{"Become Happy"} and press its field under \code{Shortcut}.
#'
#' Press desired key command.
#'
#' Press \code{Apply}.
#'
#' Press \code{Execute}.
generateHappyFeedback <- function(){

  sentence <- generate_sentence()

  print(sentence)

}
