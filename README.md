
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
#> [1] "When it was all produced so remarkably, I worthily started dreaming about you at night :) <3"
generateHappyFeedback()
#> [1] "That facilitated calmly! :D Hey! Do you know Irma Lien? I hear she is single! ;)"
generateHappyFeedback()
#> [1] "If the bakeware assisted your reliable display. Would you support it? These are the questions facing a spasm nowadays."
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
#> [1] "That participated bounteously! :D Hey! Do you know Nicki Villavicencio? I hear she is single! ;)"

## Example 2
# Providing structures
# and not using internal structures

# Generate 2 sentences
generate_sentence(n = 2, structures = st,
                  int_structures = FALSE)
#> [1] "Aircraftwoman! You are practical today! ;)"
#> [2] "Vice Admiral! You are determined today! ;)"

## Example 3
# Providing word_lists and structures
# and not using internal word_lists and structures

# Generate 3 sentences
generate_sentence(n = 3, structures = st,
                  word_lists = wl,
                  int_structures = FALSE,
                  int_word_lists = FALSE)
#> [1] "Friend! You are bright today! ;)" "Friend! You are smart today! ;)" 
#> [3] "Mother! You are bright today! ;)"
```

Generate and rate sentences
---------------------------

Generate one or more sentences and ask user to rate them in the console.

Pass question, rating scale, and min/max rating labels.

Is able to randomly create rating scales - either once or for each sentence.

Allows use of word types in max/min rating labels. Find a new word once or for every sentence.

Note: Code not evaluated as it is interactive.

``` r
# Attach package
library(bhappyr)

# Example 1
# Generate 1 sentence and rate it.
rate_sentence()

# Example 2
# Generate 3 sentences and rate them.
# Use random scale on each run.
rate_sentence(n=3, rscale = 'random',
              change_rscale = TRUE)

# Example 3
# Generate 3 sentences and rate them.
# Use random max_rating label on each run.
rate_sentence(n=3, max_rating = "[superb(upper)]",
              change_label = TRUE)
```
