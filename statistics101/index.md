---
title       : Introduction to Statistics for Game Designers
subtitle    : 
author      : Christoph Safferling
job         : Head of Game Analytics
url         : {lib: "."}    # this is important for reveal.js
framework   : revealjs      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
revealjs:
    theme: default
--- ds:intro





<!-- adjust background for "intro" slides -->
<style>
html.intro body {
background:url("./assets/img/ubi-background.jpg");
background-position:center;
background-size: 100%;
} 

html.thanks body {
background:url("./assets/img/thanks-reel.png");
background-position:center;
background-repeat: no-repeat;
background-size: contain;
} 
</style>


<p style="color: #13DAEC; font-family: 'Lato', sans-serif; font-size: 150%; margin: 0 0 10% 0;">
  Statistics 101<br />
  <span style="font-size: 80%;">a brief overview with Game Design examples</span>
</p>

<p style="font-size: 100%; color: #000000;">
  Christoph Safferling and Nadim Affani
</p>
<p style="font-size: 80%; margin: 3% 0 0 0; color: #222222;">
  Head of Game Analytics and User Research<br/ >Senior Lead Game Designer<br/ ><br/ >
  Ubisoft Blue Byte
</p>

<!-- fuck CSS... why can't I include this in a custom CSS? -->

<style>
.reveal {color: #231F20;}
.reveal h2, .reveal h3 {color: #222222;}
</style>

<style>
.gif150
{
  width: 150%;
  height: auto;
}
</style>





--- &vertical

## Statistics

> The practice or science of collecting and analysing numerical data in large quantities, especially for the purpose of inferring proportions in a whole from those in a representative sample.   
> [OED definition](http://www.oxforddictionaries.com/definition/english/statistics)

***

> Statistics is the study of the collection, analysis, interpretation, presentation, and organization of data.   
> [The Oxford Dictionary of Statistical Terms](https://global.oup.com/academic/product/the-oxford-dictionary-of-statistical-terms-9780199206131?cc=de&lang=en&)

<!--
* *Descriptive statistics*
involves methods of organizing, picturing and summarizing information from data.  
* *Inferential statistics*
involves methods of using information from a sample to draw conclusions about the population.
-->

***

## Randomness

> The quality or state of lacking a pattern or principle of organization; unpredictability  
> [OED definition](http://www.oxforddictionaries.com/definition/english/randomness)

---

## History

- world's first statistics department at University College London ([UCL](https://www.ucl.ac.uk/statistics)) in 1911
- born in WW2: [S-Branch](http://www.economist.com/news/christmas-specials/21636589-how-statisticians-changed-war-and-war-changed-statistics-they-also-served)
- RNG: lottery balls, and women picking at "random" 

<!-- The central office, the war cabinet was told, would produce "a regular series of figures on a coherent and well-ordered basis... that will be accepted and used without question". The new statisticians worked on government accounts; rationing (which ensured no Britons starved and greatly improved the diet of the poorest third); manpower surveys; the "pay as you earn" system of taxation (which raised the cash needed to wage the war); and the Beveridge Report on social insurance that later led to the founding of the welfare state.
-->


--- &vertical

## From Histograms to  Distributions

### Graphs and Functions


![plot of chunk scatterplot](assets/fig/scatterplot-1.png)


***

### Histograms

![plot of chunk commute-hist](assets/fig/commute-hist-1.png)

***

### Density estimates

![plot of chunk commute-hist-dens](assets/fig/commute-hist-dens-1.png)

***

### Probability Density Function

> A function of a discrete variable whose integral over any interval is the probability that the variate specified by it will lie within that interval.  
> [OED dictionary](https://en.oxforddictionaries.com/definition/probability_distribution)

<!--
- The area bounded by the curve of the density function and the x-axis is equal to 1, when computed over the domain of the variable.
- The probability that a random variable assumes a value between a and b is equal to the area under the density function bounded by a and b. 
-->


--- &vertical

## Density Functions and Distributions

### Uniform distribution

![plot of chunk uniform](assets/fig/uniform-1.png)


*** 

### Poisson (Count) distribution

![plot of chunk poisson](assets/fig/poisson-1.png)

*** 

### Normal (Gaussian) distribution

![plot of chunk gaussian](assets/fig/gaussian-1.png)


--- &vertical

## explain distributions

- most (nice) distributions can be explained by *moments*
    - mean (average): $\mu = E[X]$
    - standard deviation/variance: 
      $$\sigma^2 = E[(X-\mu)^2]$$ 
- for the Normal distribution: $$X \sim \mathcal{N}(\mu,\sigma^2)$$

<!--
median, quartiles, Fehlererwartungen, Abweichung der Betrachtung, Steamspy settlers data
$\sigma = \sqrt{E[X^2] - (E[X])^2}$
-->

***

### (Statistical) Mean 

- the expected value
- arithmetic mean: $1/n \sum x_i$ 

***

### Standard Deviation

<img src="assets/img/Standard_deviation_diagram.svg" class="gif150" />

***

### Median

- the *50% observation*
- more resistant to outliers than the mean
- example: D10 roll $X = {1, 1, 1, 1, 10}$
    - mean: 2.8
    - median: 1

***



### Steamspy data: by average

<table class="table" style="font-size: 20px; margin-left: auto; margin-right: auto;">
<thead><tr>
<th style="text-align:left;font-weight: bold;"> Game </th>
   <th style="text-align:right;font-weight: bold;"> Owners.est </th>
   <th style="text-align:right;font-weight: bold;"> playtime_avg_h </th>
   <th style="text-align:right;font-weight: bold;"> playtime_med_h </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> Livelock </td>
   <td style="text-align:right;"> 7142 </td>
   <td style="text-align:right;"> 4.558333 </td>
   <td style="text-align:right;"> 0.0358333 </td>
  </tr>
<tr>
<td style="text-align:left;"> Out of the Park Baseball 17 </td>
   <td style="text-align:right;"> 15384 </td>
   <td style="text-align:right;"> 2.574167 </td>
   <td style="text-align:right;"> 0.6594444 </td>
  </tr>
<tr>
<td style="text-align:left;"> NOBUNAGA'S AMBITION: Souzou SengokuRisshiden </td>
   <td style="text-align:right;"> 42855 </td>
   <td style="text-align:right;"> 2.213889 </td>
   <td style="text-align:right;"> 1.1980556 </td>
  </tr>
<tr>
<td style="text-align:left;"> INFRA </td>
   <td style="text-align:right;"> 9340 </td>
   <td style="text-align:right;"> 2.129444 </td>
   <td style="text-align:right;"> 0.0566667 </td>
  </tr>
<tr>
<td style="text-align:left;"> Naval Action </td>
   <td style="text-align:right;"> 84977 </td>
   <td style="text-align:right;"> 1.594444 </td>
   <td style="text-align:right;"> 0.2552778 </td>
  </tr>
</tbody>
</table>

***

### Steamspy data: by median

<table class="table" style="font-size: 20px; margin-left: auto; margin-right: auto;">
<thead><tr>
<th style="text-align:left;font-weight: bold;"> Game </th>
   <th style="text-align:right;font-weight: bold;"> Owners.est </th>
   <th style="text-align:right;font-weight: bold;"> playtime_avg_h </th>
   <th style="text-align:right;font-weight: bold;"> playtime_med_h </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> NOBUNAGA'S AMBITION: Souzou SengokuRisshiden </td>
   <td style="text-align:right;"> 42855 </td>
   <td style="text-align:right;"> 2.213889 </td>
   <td style="text-align:right;"> 1.1980556 </td>
  </tr>
<tr>
<td style="text-align:left;"> DARK SOULS III </td>
   <td style="text-align:right;"> 1067158 </td>
   <td style="text-align:right;"> 1.128333 </td>
   <td style="text-align:right;"> 0.8391667 </td>
  </tr>
<tr>
<td style="text-align:left;"> Tom Clancy's The Division </td>
   <td style="text-align:right;"> 784206 </td>
   <td style="text-align:right;"> 1.528056 </td>
   <td style="text-align:right;"> 0.8344444 </td>
  </tr>
<tr>
<td style="text-align:left;"> Hearts of Iron IV </td>
   <td style="text-align:right;"> 338077 </td>
   <td style="text-align:right;"> 1.159722 </td>
   <td style="text-align:right;"> 0.6947222 </td>
  </tr>
<tr>
<td style="text-align:left;"> Ascent - The Space Game </td>
   <td style="text-align:right;"> 17032 </td>
   <td style="text-align:right;"> 1.081944 </td>
   <td style="text-align:right;"> 0.6894444 </td>
  </tr>
</tbody>
</table>

***

### summary

- mean, variance, median, (log-)normal
- game data often has a large tail distribution
- the density curve is always preferable to a moment 


--- &vertical

## Bonus: Anscombe's Quartet

- Anscombe, Francis J. (1973) *Graphs in statistical analysis*. [American Statistician, 27, pp. 17–21.](http://www.sjsu.edu/faculty/gerstman/StatPrimer/anscombe1973.pdf)
- four $x, y$ datasets which have equal properties:
    - mean $(9, 7.5)$, variance $(11, 4.12)$, correlation $(0.816)$ 
    - linear regression: $y = 4 + 0.346x$
- showcase for data exploration!

***

![plot of chunk anscombe](assets/fig/anscombe-1.png)


--- &vertical

## Correlation vs Causation

> (Statistics) A quantity measuring the extent of the interdependence of variable quantities.  
> [OED definition](https://en.oxforddictionaries.com/definition/correlation)

<!-- -->

> The action of causing something.  
> [OED definition](https://en.oxforddictionaries.com/definition/causation)

***

![plot of chunk correlation](assets/fig/correlation-1.png)

***

![plot of chunk correlation-exposed](assets/fig/correlation-exposed-1.png)


---&vertical

## Bayes' Rule

- conditional probability
- _prior_ and _posterior_ knowledge
- assume: 
    - $p(A) = \text{prob of a payer} = 0.05$
    - $p(B) = \text{prob of pvp} = 0.2$
    - $p(B|A) = 0.8$
    
***

- how high is the chance of a player being a payer, given that he plays PvP? 

$$p(A|B) = \frac{p(B|A)*p(A)}{p(B)}$$ 

<!--
answer: 0.8*0.05/0.2 = 0.2 > 0.05

tests: number of false positives outweights true positives

https://www.eecs.qmul.ac.uk/~norman/BBNs/Bayes_rule.htm
-->

<!--
---

## Linear Regression

$$y_i = \beta_0 + \beta_i + \varepsilon_i$$

- fitted values: $$\hat y = b_0 + b_ix_i$$
- residuals: $$e_i = y_i - \hat y_i$$

-->

--- &vertical

## Statistical tests

- statistical difference/significance
    - show how two data dots come from the same distribution and can be different
- representative sample
    - high levels, few players, biases
    - self-selection! 
- validity of a test
    - Type I error: reject true Null ("false positive")
    - Type II error: do not reject false Null ("false negative")

***

![plot of chunk ttests](assets/fig/ttests-1.png)


---

## common mistakes

- check validity of data (cheats/QA)
- filter bias
- samples may have too few players
- outliers _will_ happen (also: cheats)
- avg vs mean (steamspy)
    - distributions are important!
- summing of data over variables (levels)
    - lower levels have more players, so sums are much(!) larger
- correlation is not causation
- self-selection


--- ds:thanks

## Happy stat-ing!

<!--
Lesson 1: Visualizing relationships in data

Seeing relationships in data and predicting based on them; Simpson's paradox
Lesson 2: Probability

Probability; Bayes Rule; Correlation vs. Causation
Lesson 3: Estimation

Maximum Likelihood Estimation; Mean, Median, Mode; Standard Deviation, Variance
Lesson 4: Outliers and Normal Distribution

Outliers, Quartiles; Binomial Distribution; Central Limit Theorem; Manipulating Normal Distribution
Lesson 5: Inference

Confidence intervals; Hypothesis Testing
Lesson 6: Regression

Linear regression; correlation
Lesson 7: Final Exam
-->




