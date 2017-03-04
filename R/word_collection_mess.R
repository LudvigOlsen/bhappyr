# # # #
# # # # #   ____________________________________________________________________________
# # # # #   Word collection                                                         ####
# # # #
# # # #
# #
# #
# # # female_first_name <- female_first_names
# # # devtools::use_data(female_first_name, overwrite = T)
# # #




# library(pluralize)
# str(noun)
#
# noun_plural <- pluralize(noun)
#
# devtools::use_data(noun_plural, overwrite = T)



#statistics_tradition <- c("Bayesian", "frequentist")
#
#
# female_names_ws <- stringr::str_replace_all(verb_ing, "[\r\n]" , ",")
# female_names_list <- strsplit(female_names_ws, ",")
# female_names_list <- female_names_list[order(female_names_list)]
# verb_base <- female_names_list
#
# verb_ing <- unlist(verb_base)
#
# devtools::use_data(verb_ing, overwrite = T)
#

# #
# # trim.ws <- function (x)  gsub("\\s+", "", x)
# # # trim.first_ws <- function (x)  sub("^\\s+", "", x)
# # #
# female_names_clean <- trim.ws(unlist(female_names_list))
# female_first_names <- female_names_clean %>%
#    unique()
# female_first_names <- female_first_names[order(female_first_names)]
#
# female_first_names <- tolower(female_first_names)
#
# positive_vb <- female_first_names
#
#devtools::use_data(statistics_tradition, overwrite = T)

#
# noun <- female_first_names
#
# devtools::use_data(noun, overwrite = T)
#
#
# #female_first_names <- female_first_names[fmale_first_names %ni% c("Savhannah", "Lindsey", "Connie")]
#
# male_full_name <- female_first_names
#
# #
# # salutations[salutations == "Ruler of all Parrallel Universes"] <- "Ruler of all Parallel Universes"
# # salutations <- salutations[[1]]
# devtools::use_data(male_full_name, overwrite = T)
# #
# # positive_vb <- positive_vb2
# #
# # library(dplyr)
# #
# #
# # adverbs_2 <- strsplit(adverbs_ws, ",")
# #
# # trim.leading <- function (x)  gsub("\\s+", "", x)
# #
# #
# # positive_adv <- data.frame(pos_adv = adverbs_2)
# # str(positive_adv)
# #
# # positive_adv$pos_adv <- trim.leading(positive_adv$pos_adv)
# # salutations <- data.frame(salutation = strsplit(salutations,'\n'))
# # salutations_2 <- stringr::str_replace_all(salutations, "[\r\n]" , "")
# # colnames(salutations) <- c("salutation")
# # salutations$salutation <- as.character(salutations$salutation)
# #
# # salutations <- salutations %>%
# #   distinct(salutation) %>%
# #   arrange(salutation)
# #
# # str(salutations)
# #
# #
# # adverbs_no_ws <- stringr::str_replace_all(adverbs_2, " " , "")
# #
# # #positive_verbs_list <- strsplit(positive_verbs_ws, " ")
# #
# # `%ni%` <- Negate(`%in%`)
# #
# # positive_vb2 <- data.frame(pos_vb = positive_verbs_list)
# # colnames(positive_adv) <- c("pos_adv")
# # positive_adv <- positive_adv %>%
# #   #filter(pos_vb != "") %>%
# #   filter(substr(pos_adv,1,1) %ni% letters)
# #
# # positive_adv <- positive_adv %>%
# #   mutate(pos_adv = tolower(pos_adv))
# #
# # positive_vb <- rbind(positive_vb, positive_vb2)
# #
# # positive_adv <- positive_adv %>%
# #   distinct(pos_adv) %>%
# #   arrange(pos_adv)
# #
# # positive_adj <- positive_adj[order(positive_adj$pos_adj),]
# #
# # positive_adv <- data.frame(pos_adv = as.character(positive_adv))
# #
# # positive_adv$pos_adv <- as.character(positive_adv$pos_adv)
# #
# # str(positive_adj)
# #
# #
# # create_synonyms <- "incorporate call forth bring conjure style cut film-make short-circuit father wreak realize re-create do invoke get beat bear turn in press lay down blast bring about cause yield realise work direct arouse stir extract twine create mentally bring up create by mental act beget derive put forward offset assemble generate compose cleave call down institute substantiate chop initiate enkindle produce spume conjure up organize sire recreate set up procreate distil establish raise prepare regenerate actualize construct start strike manufacture shell engender fire turn out create from raw stuff choreograph copy tack together originate distill reproduce actualise kindle piece froth give elicit make for suds provoke film bring forth form make scrape write build put together educe evoke play create from raw material track create verbally tack puncture multiply short give rise put on clear grind organise mother"
