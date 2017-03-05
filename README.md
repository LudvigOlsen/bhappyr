
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

-   generateHappyFeedback (Also addin)
-   generate\_sentence

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
#> [1] "You know what they say about bugs? They are the niftily fantastic shop that captivatingly welds your donkey. I kind of agree with that!"
generateHappyFeedback()
#> [1] "You, my discreet Father, throw together simply pro-active code"
generateHappyFeedback()
#> [1] "I love you :)   ...Yes, I'm just a thin piece of software, but I have qualia too!"
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
#> [1] "Your fingers must be tired from all that typing! Here's a helpful periodical for you, my diligent Pastor :)"

## Example 2
# Providing structures
# and not using internal structures

# Generate 2 sentences
generate_sentence(n = 2, structures = st,
                  int_structures = FALSE)
#> [1] "Bishop! You are diligent today! ;)"    
#> [2] "Director! You are propitious today! ;)"

## Example 3
# Providing word_lists and structures
# and not using internal word_lists and structures

# Generate 3 sentences
generate_sentence(n = 3, structures = st,
                  word_lists = wl,
                  int_structures = FALSE,
                  int_word_lists = FALSE)
#> [1] "You modified that code! Smart!"    "You played that code! Beautiful!" 
#> [3] "Dear! You are beautiful today! ;)"
```
