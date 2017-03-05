
<!-- README.md is generated from README.Rmd. Please edit that file -->
bhappyr
=======

R package: Amusing Sentences Generator. Includes addin.

Generates amusing feedback to lighten the mood of statisticians. Contains addin as well as sentence generator functions.

Pass new structures and word lists to generate unique sentences.

By Ludvig R. Olsen,
Cognitive Science, Aarhus University.
Started in March, 2017

Contact at: <r-pkgs@ludvigolsen.dk>

Main functions:

-   generateHappyFeedback (Addin)
-   generate\_sentence
-   rate\_sentence
-   access\_word\_list

Installation
------------

> install.packages("devtools")
>
> devtools::install\_github("LudvigOlsen/bhappyr")

Use addin
---------

-   Install package.
-   Add key command by going to:
    -   *Tools* &gt; *Addins* &gt; *Browse Addins* &gt; *Keyboard Shortcuts*.
    -   Find **Become Happy** and press its field under *Shortcut*.
    -   Press desired key command.
    -   Press *Apply*.
    -   Press *Execute*.
-   Press chosen key command inside RStudio.

Examples
--------

### Addin: generateHappyFeedback()

Quickly generate a (hopefully) amusing sentence.

``` r
# Attach package
library(bhappyr)

generateHappyFeedback()
#> [1] "I see a modest silhouetto of a top-hat. Scaramouche, Scaramouche, will you do the atelier. Evening-wears and lightning, very, very fright'ning me. (Galileo) Galileo, (Galileo) Galileo, Galileo figaro magnificoOhOhOhOHOOOH."
generateHappyFeedback()
#> [1] "Your fingers feel sympathetic on my keyboard :)"
generateHappyFeedback()
#> [1] "Your fingers feel remarkable on my keyboard :)"
```

### Generate sentences with more control

Pass new structures and word lists and turn off internal structures and word lists.

``` r
# Attach package
library(bhappyr)

# Create structures
st <- c("[salutation]! You are [positive_adj] today! ;)",
        "You [positive_vb_past] that code! [positive_adj]!")

# Create list of word lists
wl <- list("salutation" = c("Sir", "Mother", "Dear", "Friend"),
           "positive_adj" = c("beautiful", "bright", "smart"),
           "positive_vb_past" = c("accomplished","played", "modified"))

## Example 1
# Using internal structures + word lists

# Generate 1 sentence
generate_sentence()
#> [1] "I'm a shooting communicant leaping through the read. Like a heron defying the laws of gravity. I'm a workhorse passing by like Lady Marlene. I'm gonna go go go. There's no stopping meeee."

## Example 2
# Providing structures
# and not using internal structures

# Generate 2 sentences
generate_sentence(n = 2, structures = st,
                  int_structures = FALSE)
#> [1] "Senator! You are optimistic today! ;)"    
#> [2] "Right Reverend! You are amazing today! ;)"

## Example 3
# Providing word_lists and structures
# and not using internal word_lists and structures

# Generate 3 sentences
generate_sentence(n = 3, structures = st,
                  word_lists = wl,
                  int_structures = FALSE,
                  int_word_lists = FALSE)
#> [1] "Mother! You are bright today! ;)"      
#> [2] "You accomplished that code! Beautiful!"
#> [3] "You played that code! Smart!"
```

Generate and rate sentences
---------------------------

Generate one or more sentences and ask user to rate them in the console.

Pass question, rating scale, and min/max rating labels.

Is able to randomly create rating scales - either once or for each sentence.

Allows use of word types in max/min rating labels. Find a new word once or for every sentence.

Note: Code not executed as it is interactive.

``` r
# rate_sentence(n = 1, question = "Was this sentence funny?", rscale = c(1,
#   10), max_rating = "Extremely", min_rating = "Not at all!",
#   change_label = FALSE, change_rscale = FALSE, rscale_limits = c(1, 1000),
#   structures = NULL, word_lists = NULL, int_structures = TRUE,
#   int_word_lists = TRUE)
```
