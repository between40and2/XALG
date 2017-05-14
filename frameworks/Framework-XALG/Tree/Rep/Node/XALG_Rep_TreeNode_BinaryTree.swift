//
//  XALG_Rep_TreeNode_BinaryTree.swift
//  XALG
//
//  Created by Juguang Xiao on 05/03/2017.
//

import Swift


class XALG_Rep_TreeNode_BinaryTree<Payload> : XALG_ADT_TreeNode_BinaryTree
//where  Self.NodeType == Self 
{
    typealias PayloadType = Payload
    typealias NodeType = XALG_Rep_TreeNode_BinaryTree<Payload>

    var payload : PayloadType?  = nil
    
    // there are cases that payload is not applicable, such as as HuffmanTree's branch node.
    init() {
        
    }
    
    init(payload p : PayloadType) {
        self.payload = p
    }
    
    var lchild: NodeType?
    var rchild: NodeType?
    weak var parent : NodeType?
    
    func countNode() -> Int {
        let l = lchild?.countNode() ?? 0
        let r = rchild?.countNode() ?? 0
        return 1 + l + r
    }
}

class XALG_Rep_TreeNode_BinaryTree_Key<Payload, Key> : XALG_Rep_TreeNode_BinaryTree<Payload>,
    XALG_ADT_TreeNode_BinarySearchTree
    
where Key : Comparable
{
    typealias PayloadType = Payload
    typealias KeyType = Key
    
    var key : KeyType
    
    init(key : KeyType) {
        self.key = key
        super.init()
        
    }
    
    init(payload: PayloadType, key: KeyType) {
        self.key = key
        super.init(payload: payload)
    }
    
    
    var leftChild : XALG_Rep_TreeNode_BinaryTree_Key? {
        get {
            return lchild as? XALG_Rep_TreeNode_BinaryTree_Key
        }
        set {
            lchild = newValue
        }
    }
    
    var rightChild : XALG_Rep_TreeNode_BinaryTree_Key? {
        get {
            return rchild as? XALG_Rep_TreeNode_BinaryTree_Key
        }
        set {
            rchild = newValue
        }
    }
    
    var parentNode : XALG_Rep_TreeNode_BinaryTree_Key?  {
        get {
            return parent as? XALG_Rep_TreeNode_BinaryTree_Key
        }
        set {
            parent = newValue
        }
    }
    
    // MARK: - Height
    
    var height = -1
    
    var balanceFactor : Int {
        let height_left = leftChild?.height ?? 0
        let height_right = rightChild?.height ?? 0
        
        return height_left - height_right
    }
}


extension XALG_Rep_TreeNode_BinaryTree_Key {

    func minimum() -> NodeType {
        return self.mostLeftDescendant!
    }
    
    func maximum() -> NodeType {
        return self.mostRightDescendant!
    }

}

//
//class XALG_Rep_TreeNode_BinarySearchTree<Payload, Key > : XALG_Rep_TreeNode_BinaryTree_Key<Payload, Key>
//where Key : Comparable
//{
//    
////    typealias NodeType_BST = XALG_Rep_TreeNode_BinarySearchTree<Payload, Key>
////    
////    func search(key : Key) -> NodeType_BST? {
////        return nil
////    }
////    
////    func insert(_ key : Key) -> NodeType_BST {
////        if key < self.key {
////            if let left = lchild as? NodeType_BST {
////                return left.insert(key)
////                
////            }else {
////                lchild = NodeType_BST(key: key)
////                
////                return lchild as! NodeType_BST
////            }
////        }else {
////            if let right = rchild as? NodeType_BST {
////                return right.insert(key)
////            }else {
////                rchild = NodeType_BST(key: key)
////                return rchild as! NodeType_BST
////            }
////        }
////    }
//    
////    var height : Int = -1
//    
//    
//}
