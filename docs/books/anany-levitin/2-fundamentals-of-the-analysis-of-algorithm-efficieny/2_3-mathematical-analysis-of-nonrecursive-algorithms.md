



2_3-mathematical-analysis-of-nonrecursive-algorithms.md


### Example 1: MaxElement

### Example 2: element uniqueness problem

### Example 3: matrix product



## 2.4 Mathematical Analysis of Recursive Algorithms

### Example 1: Factorial function


### Example 2: Tower of Hanoi


### Example 3: BinRec - as problem as 2.3 Ex4


## 2.5 Example: Computing the nth Fibonacci Number

[Fibonacci numbers](https://en.wikipedia.org/wiki/Fibonacci_number)

* F(0) = 0
* F(1) = 1
* F(n) = F(n−1) + F(n−2) for n>1

homogeneous second-order linear recurrence with constant coefficients

ax(n)+bx(n−1)+cx(n−2)=0

F (n) = √ (φ − φ )


inhomogeneous



/Input: A nonnegative integer n
//Output: The nth Fibonacci number F[0]← 0; F[1]← 1
for i ← 2 to n do
F [i] ← F [i − 1] + F [i − 2] return F [n]
