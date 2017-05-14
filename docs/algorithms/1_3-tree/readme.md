




* Tree
  * Ordered Tree | [Ray](http://cs.lmu.edu/~ray/notes/orderedtrees/)
    * K-ary Tree | [Wikipedia](https://en.wikipedia.org/wiki/K-ary_tree)
      * Binomial Tree | (See [Binomial](https://en.wikipedia.org/wiki/Binomial))
      * Binary Tree
        * Binary Search Tree
          * Self-balancing BST


* \_XALG_ADT_Node_BinaryTree
  * XALG_ADT_Node_BinaryTree


* XALG_BinaryTreeNode <NodeContentType0> - XALG_ADT_Node_BinaryTree
  *

## XALG_BinaryTreeNode



https://en.wikipedia.org/wiki/B-tree

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


https://en.wikipedia.org/wiki/Huffman_coding
