

## Purpose of Works

There are 2 kinds of purpose of works.
* Better result. For the problem itself is optimization. Such as Shortest Path. Longest Common Subsequence, etc. You can get it from the names of algorithm.
* Better performance. That is why we talk about time and space complexity, optimization for add/remove or query operations.

It is right to think in the way that there are some measurement/metrics we can use to verify its optimization. Are you thinking what I am thinking? It is mathematics, or to be precise, algebra.


## Problems and tools (algorithms).

Some problems, at its surface, does not imply you should use data structures (such as tree or graph) or algorithm design (such greedy. [backtracking](https://en.wikipedia.org/wiki/Backtracking), [dynamic programming](https://en.wikipedia.org/wiki/Dynamic_programming), etc. ) to solve it efficiently. However, you should know the hardest part of using right algorithm to solve your problem is to find which algorithm should be used, and how you should transform your original problem into a limited set of algorithm proposed-to-solve problems, and after getting the solution in algorithm form, transform it back to  the solution in original form of the problem.

If you just read one textbook of algorithms, you are more likely to fix your map of problem-algorithm landscape. Here is one example of mine, maybe you have known it well.

### Priority Queue and Heap, and more..

* [_Heap_](https://en.wikipedia.org/wiki/Heap_(data_structure)) is not the only way to implement [_Priority Queue_](https://en.wikipedia.org/wiki/Priority_queue). You can use _AVL Tree_.
* In turn, _AVL Tree_ can be used for _Sorting_ too.
* You can use _Heap_ for _Sorting_ too.
* Also, _Priority Queue_ can be used in _Dijkstra_ and _Huffman Tree_, and _Prim's MST_.

I wish I have confused you and then make the point that one DS or algorithms can use others and be used by others. It is safe to think it is always many-to-many mapping, rather than single-minded one-to-one or one-to-many.

![web](https://cdn.rawgit.com/between40and2/x-docs/master/x/XALG/docs/algorithms/algo-web.svg)



## References

* [Introduction to Algorithms, Third Edition(https://mitpress.mit.edu/books/introduction-algorithms)
