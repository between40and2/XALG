# 2. Fundamentals of the Analysis of Algorithm Efficiency


## 2.1 The Analysis Framework

Time efficiency and

Space efficiency

### Measuring an Input's Size


### Units for Measuring Running Time


### Orders of Growth

> Table 2.1


### Worst-Case, Best-Case, and Average-Case Efficiencies


amortized efficiency See [Wikipedia: Amortized analysis](https://en.wikipedia.org/wiki/Amortized_analysis) [平摊分析](https://zh.wikipedia.org/wiki/平摊分析)


## 2.2 Asymptotic Notations and Basic Efficiency Clauses

[Asymptotic analysis](https://en.wikipedia.org/wiki/Asymptotic_analysis) [渐近分析](https://zh.wikipedia.org/wiki/渐近分析)

### Informal Introduction


### O-notation

t(n) <= c g(n) for all n >= n0

### Ω-notation

GREEK CAPITAL LETTER OMEGA

### Θ-notation

GREEK CAPITAL LETTER THETA

### Useful Property Involving the Asymptotic Notations

### Using Limits for Comparing Orders of Growth

### Basic Efficiency Classes

> TABLE 2.2 Basic asymptotic efficiency classes

Class | Name | Comments
--|--|--
1 | constant | Short of best-case efficiencies, very few reasonable examples can be given since an algorithm’s running time typically goes to infinity when its input size grows infinitely large.
log n | logarithmic | Typically, a result of cutting a problem’s size by a constant factor on each iteration of the algorithm (see Section 4.4). Note that a logarithmic algorithm cannot take into account all its input or even a fixed fraction of it: any algorithm that does so will have at least linear running time.
n| linear | Algorithms that scan a list of size n (e.g., sequential search) belong to this class.
n log n|linearithmic|Many divide-and-conquer algorithms (see Chapter 5), including mergesort and quicksort in the average case, fall into this category.
n^2|quadratic|Typically, characterizes efficiency of algorithms with two embedded loops (see the next section). Elemen- tary sorting algorithms and certain operations on n × n matrices are standard examples.
n3|cubic|Typically, characterizes efficiency of algorithms with three embedded loops (see the next section). Several nontrivial algorithms from linear algebra fall into this class.
2^n|exponential|Typical for algorithms that generate all subsets of an n-element set. Often, the term “exponential” is used in a broader sense to include this and larger orders of growth as well.
n!|factorial|Typical for algorithms that generate all permutations of an n-element set.


Also See : [MIT OCW: Introduction to Algorithms | Recitation 1: Asymptotic Complexity, Peak Finding](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/recitation-videos/recitation-1-asymptotic-complexity-peak-finding/)


## [2.3 Mathematical Analysis of Nonrecursive Algorithms](2_3-mathematical-analysis-of-nonrecursive-algorithms.md)


## 2.4 Mathematical Analysis of recursive Algorithms
