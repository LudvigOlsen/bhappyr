
<!-- README.md is generated from README.Rmd. Please edit that file -->
bhappyr
=======

R package: Amusing Sentences Generator. Includes addin.

Generates amusing feedback to lighten the mood of statisticians. Contains addin as well as sentence generator functions.

Pass new structures and word lists to generate unique sentences.

Rate sentences on a given question and rating scale. Simulate user ratings.

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
# Attach packages
library(bhappyr)

generateHappyFeedback()
#> My Dean just refacilitated my polite code. I'm brilliantly sure yours is exceptionally better!
generateHappyFeedback()
#> You, my amicable Brigadier, make blazingly easygoing code
generateHappyFeedback()
#> Honourable! How you've grown with the task! I envy your enthusiastic focusing skills!
```

### Generate sentences with more control

Pass new structures and word lists and turn off internal structures and word lists.

``` r
# Attach packages
library(bhappyr)
library(dplyr) # %>% 
library(knitr) # kable()

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
generate_sentence() %>% 
  kable()
```

|                                                                                                                          |
|:-------------------------------------------------------------------------------------------------------------------------|
| Your fingers must be tired from all that typing! Here's a communicative stepmother for you, my easygoing Commissioner :) |

``` r

## Example 2
# Providing structures
# and not using internal structures

# Generate 2 sentences
generate_sentence(n = 2, structures = st,
                  int_structures = FALSE) %>% 
  kable()
```

|                                  |
|:---------------------------------|
| Student! You are smart today! ;) |
| Madam! You are patient today! ;) |

``` r

## Example 3
# Providing word_lists and structures
# and not using internal word_lists and structures

# Generate 3 sentences
generate_sentence(n = 3, structures = st,
                  word_lists = wl,
                  int_structures = FALSE,
                  int_word_lists = FALSE) %>% 
  kable()
```

|                                   |
|:----------------------------------|
| Sir! You are beautiful today! ;)  |
| Dear! You are beautiful today! ;) |
| Sir! You are smart today! ;)      |

Generate and rate sentences
---------------------------

Generate one or more sentences and ask user to rate them in the console.

Pass question, rating scale, and min/max rating labels.

Is able to randomize rating scales - either once or for every sentence. Randomize both min. and max. scale values, or only one of them.

Allows use of word types in max/min rating labels. Find a new word once or for every sentence.

``` r
# Attach packages
library(bhappyr)
library(dplyr) # %>% 
library(knitr) # kable()

# Notice: The argument 'simulate' is set to TRUE
# as the function is elsewise interactive, i.e.
# it is waiting for user input.
# Remove or set to FALSE when running as experiment!

# Example 1
# Generate 1 sentence and rate it.
rate_sentence(n=1, simulate = TRUE) %>% 
  kable()
```

|  response|  min\_scale|  max\_scale| min\_rating | max\_rating | sentence                                                                                      |
|---------:|-----------:|-----------:|:------------|:------------|:----------------------------------------------------------------------------------------------|
|         7|           1|          10| Not at all! | Extremely   | My Mother just readvocated my incredible code. I'm forthrightly sure yours is acutely better! |

``` r

# Example 2
# Generate 2 sentences and rate them.
# Randomize scale max value on each run.
# Set limits of scale, so max value can be
# maximum 100
rate_sentence(n=2, rscale = c(1,'random'),
              rscale_limits = c(1,100),
              change_rscale = TRUE,
              simulate = TRUE) %>% 
  kable()
```

|  response|  min\_scale|  max\_scale| min\_rating | max\_rating | sentence                                                                                                                                                                                                                                                                                                                                                 |
|---------:|-----------:|-----------:|:------------|:------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|         8|           1|          12| Not at all! | Extremely   | You can do it! You and Larry are my favorite people! Don't tell Mie though.. ;)                                                                                                                                                                                                                                                                          |
|         3|           1|           7| Not at all! | Extremely   | Is this the blithesome swordfish? Is this just fantasy? Caught in a text, no escape from reality. Open your eyes, look up to the resolution and forbear. I'm just a neat Leading Aircraftwoman, I need no atelier. Because I'm fabulous come, excellent go, petite high, insufficient low. Any way the engineer blows doesn't really matter to me, to me |

``` r

# Example 3
# Generate 3 sentences and rate them.
# Use random max_rating label on each run.
rate_sentence(n=3, max_rating = "[superb(upper)]",
              change_label = TRUE,
              simulate = TRUE) %>% 
  kable()
```

|  response|  min\_scale|  max\_scale| min\_rating | max\_rating | sentence                                                                                                          |
|---------:|-----------:|-----------:|:------------|:------------|:------------------------------------------------------------------------------------------------------------------|
|         6|           1|          10| Not at all! | Sublime     | My frequentist model of the Nauruan creature's considering strategies would make you dabble!                      |
|         4|           1|          10| Not at all! | Splendid    | My Bayesian model of the Nepalese topic's modifying strategies would make you deck!                               |
|         4|           1|          10| Not at all! | Fabulous    | Deacon! You seem so generous today! Is this the understanding turning point, you've been so deftly searching for? |
