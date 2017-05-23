
# XALG-IO, File-based and CoreData solution for Trees and Graphs

Format | Tree | Graph
--|--|--
text-based |
structural |
CoreData | XALG-CD


## Text-based format

One graph, one file.

Stores only vertex identifier, edge identifier and edge weight


Learnt from VFL(Visual Formatting Language) of UIKit AutoLayout

### For Graph

There are features to support.
* text-based, line-based format. Easy to edit, no extra tool needed. One graph in one file.
* creating edges along with its vertices. You do not have to create vertex standalone.
* weighted edge, annotated edge.

```
a1 - b
a2 - b
b - (x) - c
```

#### Usage

```swift
// Unweighted


```

```swift
let decoder = XALG_Decoder_Graph__linebased<String, Int>()
// Defines the callback to convert symbol to defined types for vertext identifier and edge weight.
decoder.callback_identifierFromSymbol = { return $0 }
decoder.callback_weightFromSymbol = { return Int($0) ?? 0 }

// feeding data. Line array is straightforward ones. Also supported for file URL or Data (encoding as UTF8)
decoder.inputLine_ = line_

// Execution
try! decoder.decode()

// Getting Result
guard let g = decoder.graph_weighted else { return }

```

### More Options

```swift
decoder.weightness = XALG_Enum_Graph_Weightness<Int>.weighted(1) // or .unweighed
decoder.isDirected = true
decoder.sep = .character("-")
```


## Structured format (property list and JSON)



## CoreData
