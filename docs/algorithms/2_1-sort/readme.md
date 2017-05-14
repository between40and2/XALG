# Sort in XALG


## Sort in Swift

In [`Array`](https://developer.apple.com/reference/swift/array), there are 4 methods, at least named with sort, as listed below.

x | Comparable-compliance Element | arbitrary Element
--|--|--
in-place | [mutating func sort()](https://developer.apple.com/reference/swift/array/1688499-sort) | [mutating func sort(by areInIncreasingOrder: (Element, Element) -> Bool)](https://developer.apple.com/reference/swift/array/2296801-sort)
new-array | [func sorted() -> \[Element\]](https://developer.apple.com/reference/swift/array/1688066-sorted) | [func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> \[Element\]](https://developer.apple.com/reference/swift/array/2296815-sorted)




There are few assumptions
