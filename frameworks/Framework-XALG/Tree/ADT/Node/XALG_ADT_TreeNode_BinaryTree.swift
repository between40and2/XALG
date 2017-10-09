//
//  XALG_ADT_TreeNode_BinaryTree.swift
//  XALG
//
//  Created by Juguang Xiao on 02/03/2017.
//

import Swift

 protocol XALG_ADT_TreeNode_BinaryTree  : class
 { // if not adding class, then === cannot be used.
    associatedtype PayloadType
    associatedtype NodeType  // : Self where NodeType.PayloadType == Self.PayloadType
    var lchild: NodeType? { get set }
    var rchild: NodeType? { get set }
    var parent: NodeType? { get set}
}


extension XALG_ADT_TreeNode_BinaryTree {
    var child_ : [NodeType?] {
        return [lchild, rchild]
    }
    
    var hasLeftChild : Bool {
        return lchild != nil
    }
    var hasRightChild : Bool {
        return rchild != nil
    }
    
    var hasAnyChild : Bool { return hasLeftChild || hasRightChild }
    var hasBothChild : Bool { return hasLeftChild && hasRightChild }
     
    var isLeaf : Bool {
        return !hasAnyChild
//        return lchild == nil && rchild == nil
    }
    
    var mostLeftDescendant : Self? {
        
        var n = self
        while let l = n.lchild as? Self {
            n = l
        }
        return n
    }
    
    var mostRightDescendant : Self? {
        var n = self
        while let r = n.rchild as? Self {
            n = r
        }
        return n
    }
    
    var isRoot : Bool {
        return parent == nil
    }

}
extension XALG_ADT_TreeNode_BinaryTree {
    var isLeftChild : Bool {
        guard let p = parent as? Self else { return false }
        guard let c = p.lchild as? Self else {  return false  }
        return c === self
    }
    var isRightChild : Bool {
        guard let p = parent as? Self else { return false }
        guard let c = p.rchild as? Self else {  return false  }
        return c === self
    }
}
extension XALG_ADT_TreeNode_BinaryTree where Self.NodeType == Self {

    var isLeftChild : Bool {
        guard let p = parent else { return false }
        guard let l = p.lchild else { return false  }
        return l === self
    }
    
    var isRightChild : Bool {
        guard let p = parent else { return false }
        guard let c = p.rchild else {  return false  }
        return c === self
    }
}
