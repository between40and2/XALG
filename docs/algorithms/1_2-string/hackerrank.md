
[Character](https://developer.apple.com/documentation/swift/character)

[Unicode.Scalar](https://developer.apple.com/documentation/swift/unicode/scalar)

### [CamelCase](https://www.hackerrank.com/challenges/camelcase) 

```swift
func camelcase(s: String) -> Int {
    let captials = s.filter { $0.isUppercase }
    return  captials.count + 1
}

```




### [Pangrams](https://www.hackerrank.com/challenges/pangrams/problem)


```swift
func isPangrams(s: String) -> Bool {
    let c_ = Array(s.lowercased())

    var count = [Character : Int]()
    c_.forEach { count[$0] = count[$0, default: 0] + 1 }
    return count.count == 27  
}
```