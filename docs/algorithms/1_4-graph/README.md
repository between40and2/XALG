# XALG Graph



## directed and undirected

This factor should be put first when creating a graph, since it is basic nature of graph, and it impacts the choice of underneath representation.

## Graph/host awareness

Can a vertex belong to more than one graph in memory?

If no, the design is much simpler, that is a vertex (element) should have a weak or unowned property to its graph (host?). Hence a vertex should be created through a factory, which is either graph itself or a dedicated factory class which knows the graph.

## Vertex and its contents

Ways

* content itself is the vertex, after adapting certain protocols
* a generic vertex class, with a contents property in it.
* subclass-able vertex class, which base class does graph-related stuffs, and subclasses are of business-specific. In this case, the general algorithm can work with it, but business specific algorithm can only serve the business-specific case, e.g. not reusable to others.

## Edge, its weight and more

At simplest form, a edge can be expressed implicitly with start and end vertices.
You can hold a edge object reference after a edge is created.

Not having a weight is a special case of having a weight. You can think of it as weight as 1 or 0, or nil. So implementing the general situation will serve the special case too.

### IO concern.

Should the IO or format or Database design reserve the keep non-graph info, e.g. vertex and edge contents?

If yes, .... 

## Creation and Building

A empty graph object should be created first, by that time, the following must be decided.

* directed-ness
* representation choice, based on the performance optimization preference by project.
* ?filesystem-format

### Loading from a file


### Insertion and Deletion


## Non-mutating operation (mainly traversal)


### by-product of a algorithm, and how to make use of it.

* edge classification
