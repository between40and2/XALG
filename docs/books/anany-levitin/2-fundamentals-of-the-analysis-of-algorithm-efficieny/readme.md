# 2. Fundamentals of the Analysis of Algorithm Efficiency

## [2.1 The Analysis Framework](2_1-the-algorithm-framework.md)

## 2.2 Asymptotic Notations and Basic Efficiency Classes

[Asymptotic analysis](https://en.wikipedia.org/wiki/Asymptotic_analysis) [渐近分析](https://zh.wikipedia.org/wiki/渐近分析)

### Informal Introduction

notation | condition
--|--
O (Big-Oh)|t(n) ≤ c g(n)
Ω (Big-[OMEGA](https://en.wikipedia.org/wiki/Omega))| t(n) ≥ c g(n)
Θ (Big-[THETA](https://en.wikipedia.org/wiki/Theta))| c2 g(n) ≤ t(n) ≤ c1 g(n)

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

Class | Name | Comments | Examples p472
--|--|--|--
1 | constant | Short of best-case efficiencies, very few reasonable examples can be given since an algorithm’s running time typically goes to infinity when its input size grows infinitely large.|hashing (on average)
log n | logarithmic | Typically, a result of cutting a problem’s size by a constant factor on each iteration of the algorithm (see Section 4.4). Note that a logarithmic algorithm cannot take into account all its input or even a fixed fraction of it: any algorithm that does so will have at least linear running time. | binary search (worst and average cases)
n| linear | Algorithms that scan a list of size n (e.g., sequential search) belong to this class.|sequential search (worst and average cases)
n log n|linearithmic|Many divide-and-conquer algorithms (see Chapter 5), including mergesort and quicksort in the average case, fall into this category.|advanced sorting algorithms
n^2|quadratic|Typically, characterizes efficiency of algorithms with two embedded loops (see the next section). Elementary sorting algorithms and certain operations on n × n matrices are standard examples.|elementary sorting algorithms
n3|cubic|Typically, characterizes efficiency of algorithms with three embedded loops (see the next section). Several nontrivial algorithms from linear algebra fall into this class.|Gaussian elimination
2^n|exponential|Typical for algorithms that generate all subsets of an n-element set. Often, the term “exponential” is used in a broader sense to include this and larger orders of growth as well.|combinatorial problems
n!|factorial|Typical for algorithms that generate all permutations of an n-element set.


Also See : [MIT OCW: Introduction to Algorithms | Recitation 1: Asymptotic Complexity, Peak Finding](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/recitation-videos/recitation-1-asymptotic-complexity-peak-finding/)


## [2.3 Mathematical Analysis of Nonrecursive Algorithms](2_3-mathematical-analysis-of-nonrecursive-algorithms.md)


## 2.4 Mathematical Analysis of Recursive Algorithms
