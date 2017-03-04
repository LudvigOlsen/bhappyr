
#   __________________ #< bfc0b4712f5e2d925995a4047ecde013 ># __________________
#   helper: split by square brackets                                        ####


split_by_sqrbrackets <- function(x){


##  ............................................................................
##  Description                                                             ####

  #
  # Splits string by square brackets
  #
  # E.g.:
  # .. "text1 [ text2 ] text3"
  # becomes:
  # .. ["text1 ", "[ text2 ]" " text3"]
  #

##  ............................................................................
##  Check x                                                                 ####
### . . . . . . . . .. #< f0acb6675249a768db04d1cfe100d871 ># . . . . . . . . ..
### Contains no [                                                           ####

  if (!grepl("[", x, fixed = T)){

    return(x)

  }

### . . . . . . . . .. #< 606934faa6c9516fc544c129a841d6e9 ># . . . . . . . . ..
### Doesn’t start with [                                                    ####

  if (!startsWith(x, "[")){

    # Insert [] at beginning to make sure
    # the part before the first split is
    # included
    x <- paste("[]",x, sep="")
    sqr_inserted <- TRUE

  } else {

    sqr_inserted <- FALSE
  }

##  .................. #< 5ca7b3d451afd5c771f0541c4df706b7 ># ..................
##  Find split positions                                                    ####

  split.pos <- gregexpr('\\[.*?]',x)[[1]]

  split.length <- attr(split.pos, "match.length")

  split.start <- sort(c(split.pos, split.pos+split.length))

  split.end <- c(split.start[-1]-1, nchar(x))

##  .................. #< 7efb8481ad2ac1199dc4b048cad6f27f ># ..................
##  Split x                                                                 ####

  x_split <- substring(x,split.start,split.end)

##  .................. #< 552d7df4110898cc1457f918f34d09e9 ># ..................
##  Check output                                                            ####

  if(x_split[length(x_split)] == ""){

    x_split <- x_split[1:length(x_split)-1]

  }

##  .................. #< fb25c0e3258818ff586b32bf558720b5 ># ..................
##  Return output                                                           ####

  if (isTRUE(sqr_inserted)){

    return(x_split[2:length(x_split)])

  } else {

    return(x_split)

  }

}
