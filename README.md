
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
#> When it was all critiqued so inspiredly, I parentally started dreaming about you at night :) <3
generateHappyFeedback()
#> Is this the calm exhaust? Is this just fantasy? Caught in a certification, no escape from reality. Open your eyes, look up to the profit and unconfound. I'm just a sympathetic Admiral, I need no trigonometry. Because I'm gregarious come, broad-minded go, infant high, poor low. Any way the leaf blows doesn't really matter to me, to me
generateHappyFeedback()
#> Nothing in this small world produces more happiness than you, Reverend
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

|                                                                                         |
|:----------------------------------------------------------------------------------------|
| A headache is nothing but a stupendously compassionate reminder of how dynamic life is! |

``` r

## Example 2
# Providing structures
# and not using internal structures

# Generate 2 sentences
generate_sentence(n = 2, structures = st,
                  int_structures = FALSE) %>% 
  kable()
```

|                                                   |
|:--------------------------------------------------|
| Warrant Officer (Navy)! You are awesome today! ;) |
| You engaged that code! Amazing!                   |

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

|                                        |
|:---------------------------------------|
| You accomplished that code! Smart!     |
| You accomplished that code! Bright!    |
| You accomplished that code! Beautiful! |

Generate and rate sentences
---------------------------

Generate one or more sentences and ask user to rate them in the console.

Pass question, rating scale, and min/max rating labels.

Is able to randomly create rating scales - either once or for each sentence.

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

|  response|  min\_scale|  max\_scale| min\_rating | max\_rating | sentence                                                                         |
|---------:|-----------:|-----------:|:------------|:------------|:---------------------------------------------------------------------------------|
|         9|           1|          10| Not at all! | Extremely   | Nothing in this tremendous world conceives more happiness than you, Air Marshall |

``` r

# Example 2
# Generate 3 sentences and rate them.
# Use random scale on each run.
rate_sentence(n=3, rscale = 'random',
              change_rscale = TRUE,
              simulate = TRUE) %>% 
  kable()
```

|  response|  min\_scale|  max\_scale| min\_rating | max\_rating | sentence                                                                                                                                                                                                                                          |
|---------:|-----------:|-----------:|:------------|:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|       423|         150|         738| Not at all! | Extremely   | Katelyn said: Doc, my fingers fell off yesterday when I was writing the abstract for my PhD thesis. Doc said: rock–paper–scissors on who gets to travel back in time and fix it! 'Hahahah', the Lord who was also in the room laughed studiously. |
|       506|           1|         895| Not at all! | Extremely   | If the laura merged your fortuitous cloth. Would you calm it? These are the questions facing a frigate nowadays.                                                                                                                                  |
|       221|          44|         239| Not at all! | Extremely   | I understudied the favorable card for you. I hope that's what you wanted? :)                                                                                                                                                                      |

``` r

# Example 3
# Generate 3 sentences and rate them.
# Use random max_rating label on each run.
rate_sentence(n=3, max_rating = "[superb(upper)]",
              change_label = TRUE,
              simulate = TRUE) %>% 
  kable()
```

|  response|  min\_scale|  max\_scale| min\_rating | max\_rating  | sentence                                                                                     |
|---------:|-----------:|-----------:|:------------|:-------------|:---------------------------------------------------------------------------------------------|
|        10|           1|          10| Not at all! | Top-notch    | You, my passionate Vice Admiral, slap together remarkably intuitive code                     |
|         7|           1|          10| Not at all! | Luminous     | You, my exuberant Wing Commander, give life to dapperly wondrous code                        |
|         2|           1|          10| Not at all! | Breathtaking | My Bayesian model of the Papua New Guinean broom's carrying strategies would make you droll! |
