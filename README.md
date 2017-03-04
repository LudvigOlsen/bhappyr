
<!-- README.md is generated from README.Rmd. Please edit that file -->
bhappyr
=======

R package: Amusing Sentences Generator. Includes addin.

Generates amusing feedback to lighten the mood of statisticians. Contains addin as well as sentence generator functions.

By Ludvig R. Olsen,
Cognitive Science, Aarhus University.
Started in March, 2017

Contact at: <r-pkgs@ludvigolsen.dk>

Main functions:

-   generateHappyFeedback (Also addin)

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

``` r
library(bhappyr)
generateHappyFeedback()
#> [1] "Your fingers must be tired from all that typing! Here's a sensible finance for you, my gregarious Baroness :)"
generateHappyFeedback()
#> [1] "I see a petite silhouetto of a capital. Scaramouche, Scaramouche, will you do the zone. In-jokes and lightning, very, very fright'ning me. (Galileo) Galileo, (Galileo) Galileo, Galileo figaro magnificoOhOhOhOHOOOH."
generateHappyFeedback()
#> [1] "Your fingers feel broad-minded on my keyboard :)"
```
