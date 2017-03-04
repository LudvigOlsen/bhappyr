
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
#> [1] "That reorganized inkeeping! :D Hey! Do you know Adrienne Dipasquale? I hear she is single! ;)"
generateHappyFeedback()
#> [1] "Is this the warmhearted spite? Is this just fantasy? Caught in a foot-rest, no escape from reality. Open your eyes, look up to the dragster and augment. I'm just a tough Object, I need no kitty. Because I'm nice come, propitious go, miniature high, little low. Any way the wine blows doesn't really matter to me, to me"
generateHappyFeedback()
#> [1] "I'll buy you a diamond gender my Warrant Officer (Navy) if it makes you feel alright. I'll get you anything my Vice Commander if it makes you feel alright. Cos I don't care too much for ideals, and waves can't buy me love"
```
