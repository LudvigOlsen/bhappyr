
generate_acronym <- function(n=1,
                             n_initials = 3,
                             structures = NULL,
                             word_lists = NULL,
                             int_structures = TRUE,
                             int_word_lists = TRUE){

  internal_structures <- c("[positive_vb_past(upper)] [noun(upper)] [noun(upper)]",
                           "[positive_vb(upper)] [positive_adj(upper)] [noun(upper)]",
                           "[noun(upper)] [verb_ing(upper)] [noun(upper)]",
                           "[nationality_adj] [noun(upper)] [verb_ing(upper)] Union",
                           "[nationality_adj] [noun(upper)] [verb_ing(upper)] Organization")

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


  structs <- structs[count_char_occurrences(" ", structs) == n_initials-1]

  sentences <- generate_sentence(n=n,
                                 structures = structs,
                                 word_lists = word_lists,
                                 int_structures = F,
                                 int_word_lists = int_word_lists)

  split_sentences <- strsplit(sentences, " ", fixed = T)

  acronyms <- plyr::ldply(split_sentences, function(split_sentence){

    ini <- paste(sapply(split_sentence, substr, start =1, stop = 1), collapse = "")

    acronym <- data.frame(acronym = ini, sentence = paste(split_sentence, collapse=" "))

    return(acronym)

  })

  return(acronyms)

}
