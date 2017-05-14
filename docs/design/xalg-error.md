# XALG role: Error

The main responsibility of Error role in XALG is to communicate the exceptions happening in either DS's operations or algorithms. In another words, data structure in static does not involve exceptions, unless the data structure is invalid (such as not holding AVL properties of AVL Trees), which must be called when it was being modified/mutated.


### Discussion: Are all errors due to inputs?

For mutation operations, it seems so.

For query operations, it depends. For SSSP, Dijkstra cannot handle a graph with negative cycle, but Bellman-Ford can. So there are 2 questions.

* What if a graph with negative cycle is given to Dijkstra, will it throws an error?
* What if a graph with negative cycle is given to Bellman-Ford, will it throws an error?

### Design Issue: Is Search's NotFound regarded as error or result (nil or empty array)?

Case | Description | Pros | Cons
--|--|--|--
Throwing Error | declare throws in method interface | Can carry detailed reason of error |
Returning nil | | no need error handling <br/> easy to use `if let` to check| assumption on result of single object or array, must be made before hand.
Returning empty array | | | In cases returning empty array may mean something else.  Only applicable for searching/finding a set of results, not applicable for finding the first or last one, etc.

### Design Issue: Int-backed enum vs. enum with associated values.

> Is that an issue? I never thought there were another options.

* If you thought of Data Persistence for enum, then Int-backed, or generally speaking, RawValue backed, is your choice.
* If you want to express more info around the case of enum, then the associated-value enum, is for you. You need to do a little bit extra work to encode and decode it with textual or binary format.
