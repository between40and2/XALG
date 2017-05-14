

## Design decisions

### Better Service, element object as business object carrier.

Vertex has 2 properties as below
```swift
var userInfo = [String: Any]()
var object : Any?
```
They are for convenience of app (or XALG's client), to carrier related objects with them. Algorithms are NOT supposed to read or write such data. If an algorithm needs extra informations, it should be the requirement explicit by defining a new protocols for element object.

### Vertex and Edge Identity

How can a vertex or edge be identified with identifier (such as String or Int)?

Should internal vertex object be a scalar or a struct or a class?



### Trade-off on simplicity and flexibility/rich-feature

Can simplicity be done with a bench of shortcuts/convenience methods?
