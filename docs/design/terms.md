

## Payload


## Key

Should be of Swift

## Container, the data structure

## Node, holder of per-item data in the structure

## Principle: a Node instance can be belonged to one Container instance.

In another words, a node cannot be shared among multiple container.

So the implications of this are :
* You can view container as a factory to its belonging/owning nodes.
* a node should be identified as quick as possible, if best at constant time, O(1). That in turn means a Node type should be of Swift `Hashable`.

## Node's Index.

When you look at the Collection compliant structs in Swift. There is Index subsystem in it. 
