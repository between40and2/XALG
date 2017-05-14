
# Principles

* Node must be created via Container. We do not support container-less node, that means you are not supposed to create node object directly.



## ADT for Trees

* \_XALG_ADT_Node_BinaryTree
  * XALG_ADT_Node_BinaryTree

## ADT and DS for Tree Nodes - `XALG_DS_TreeNode_BinaryTree`

* XALG_DS_TreeNode_BinaryTree <Payload> - XALG_ADT_TreeNode_BinaryTree
  *





### iOS tips: Using generic for type safety.

`var content : NodeContentType?`, which `NodeContentType` is type aliased somewhere, is safer than `var content : Any?`


### Create a node

```swift
let huff = XALG_HuffmanTreeNode<XXX>()
huff.content = 222 /// "aaaa"
```

Tips: You can also create node with potential multi-type, as below.

```swift
protocol StringAndIntAssorted  { }
extension Int : StringAndIntAssorted { }
extension String : StringAndIntAssorted { }
```

At use site:

```swift
// creation site
let huff = XALG_HuffmanTreeNode<StringAndIntAssorted>()
huff.content = 222 /// "aaaa"
huff.content = "aaa"

// use site
switch huff.content {
case let s as String: break
case let i as Int : break
default : break
}
```
