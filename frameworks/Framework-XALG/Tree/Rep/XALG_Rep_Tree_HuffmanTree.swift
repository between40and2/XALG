//
//  XALG_Rep_Tree_HuffmanTree.swift
//  XALG
//
//  Created by Juguang Xiao on 03/03/2017.
//

import Swift

class XALG_Rep_Tree_HuffmanTree<Payload> {

    
    typealias  NodeType  = XALG_Rep_TreeNode_HuffmanTree<Payload>
    
    private var _rootNode : NodeType?
    var rootNode : NodeType? {
        return _rootNode
    }
    // p
    func buildTree(elements : [Payload], weights: [Int]) {
        
        var pq = XALG_Rep_PriorityQueue__Heap<NodeType>() {  $0.0.weight < $0.1.weight
        }
        
        
        for (e, w) in zip(elements, weights) {
            let node = NodeType(payload: e)
            //            node.payload = e
            node.weight = w
            
            pq.enqueue(node)
        }
        
        while pq.count > 1 {
            let left = pq.dequeue()! // left > right
            let right = pq.dequeue()!
            
            let parent = NodeType()
            parent.lchild = left
            parent.rchild = right
            parent.weight = left.weight + right.weight
            
            pq.enqueue(parent)
        }
        
        _rootNode = pq.dequeue()!
    }
    
}


class XALG_Rep_TreeNode_HuffmanTree<Payload> : XALG_Rep_TreeNode_BinaryTree<Payload> {
    
    var weight : Int = -1 // or called count
}
