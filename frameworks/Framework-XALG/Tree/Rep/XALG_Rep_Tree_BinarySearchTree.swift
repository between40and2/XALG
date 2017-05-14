//
//  XALG_Rep_Tree_BinarySearchTree.swift
//  XALG
//
//  Created by Juguang Xiao on 06/03/2017.
//

import Swift

class XALG_Rep_Tree_BinarySearchTree<Payload, Key>: XALG_ADT_Tree_BinarySearchTree
where Key : Comparable
{

    typealias NodeType = XALG_Rep_TreeNode_BinaryTree_Key<Payload, Key>
//    typealias NodeType = XALG_DS_TreeNode_BinaryTree_Key<Payload, Key, NodeType>
    
    typealias PayloadType = Payload
    typealias KeyType = Key
    
    var rootNode : NodeType?
    
    func insert(payload: Payload, key: Key) -> NodeType {
        
        if let r = rootNode {
            return _insert(payload: payload, key: key, node: r)
        }else {
            let node = NodeType(key: key)
            node.payload = payload
            
            rootNode = node
            return node
        }
    }
    
    // for BST, it does nothing. for AVL, it does important thing to maintain AVL property.
    func balance(_ n : NodeType) {
        
    }
    
    private func _insert(payload: PayloadType?, key: KeyType, node : NodeType) -> NodeType {
        if key < node.key {
            if let child = node.leftChild {
                return _insert(payload: payload, key: key, node: child)
            }else {
                let child = NodeType(key: key)
                child.payload = payload
                child.parent = node
                node.leftChild  = child
                balance(child)
                return child
            }
        }else {
            if let child = node.rightChild {
                return _insert(payload: payload, key: key, node: child)
            }else {
                let child = NodeType(key: key)
                child.payload = payload
                child.parent = node
                node.rightChild = child
                balance(child)
                return child
            }
        }
    }
    
    func search(key: KeyType, usesRecursion : Bool) -> NodeType? {
        return usesRecursion ? _search_recursive(key: key) : _search_iterative(key: key)
    }
    
    private func _search_iterative(key : KeyType) -> NodeType? {
        var node = rootNode
        while let n = node {
            if key < n.key {
                node = n.leftChild
            }else if key > n.key {
                node = n.rightChild
            }else {
                return node
            }
        }
        return nil
    }
    
    private func _search_recursive(key : KeyType) -> NodeType? {
        guard let r = rootNode else { return nil }
        return _search_recursive_core(key: key, node: r)
    }
    
    private func _search_recursive_core(key : KeyType, node : NodeType?) -> NodeType? {
        
        guard  let n = node else { return nil }
        
        if key == n.key { return n }
        if key < n.key { return _search_recursive_core(key: key, node: n.leftChild) }
        return _search_recursive_core(key: key, node: n.rightChild)
        
    }
}


class XALG_Rep_Tree_AVLTree<Payload, Key> : XALG_Rep_Tree_BinarySearchTree<Payload, Key>
where Key : Comparable
//Self.NodeType == Self.NodeType.NodeType
{
    
    typealias NodeType = XALG_Rep_TreeNode_BinaryTree_Key<Payload, Key>
    
    
    private func updateHeightUpwards(_ n : NodeType?) {
        guard let n = n else {
            return
        }
        
        let height_left = n.leftChild?.height ?? 0
        let height_right = n.rightChild?.height ?? 0
        n.height = max(height_left, height_right) + 1
        if let parent = n.parent as? NodeType {
            updateHeightUpwards(parent)
        }
        
    }

    override func balance(_ node: NodeType?) {
        
        guard let n = node else { return }
        
        updateHeightUpwards(n.leftChild)
        updateHeightUpwards(n.rightChild)

        var t0 : NodeType? = nil
        
        var t1_ : [NodeType?] = Array<NodeType?>.init(repeating: nil, count: 2) // was named  node_
        
        var t2_ = Array<NodeType?>.init(repeating: nil, count: 4) // was named subtree_
        
        let parent = n.parent as? NodeType
        
        switch n.balanceFactor {
        case let bf where bf > 1 :
            if n.leftChild!.balanceFactor > 0 {
                // left-left 
                let A = n
                let B = A.leftChild
//                let BL = B?.leftChild
                t0 = B?.leftChild
                t1_ = [A, n.leftChild?.leftChild] // , n.leftChild] // A, BL, B
                t2_ = [t1_[1]?.leftChild, t1_[1]?.rightChild, B?.rightChild, A.rightChild]
            }else {
                // left-right
                let A = n
                let B = n.leftChild
                let C = B?.rightChild
                t0 = B?.rightChild
                t1_ = [n, n.leftChild] // n.leftChild?.rightChild] // A, B, BR(C)
                t2_ = [B?.leftChild, C?.leftChild, C?.rightChild, A.rightChild]
            }
        case let bf where bf < -1 :
            if n.rightChild!.balanceFactor < 0 {
                // right-right 
                let A = n
                let B = A.rightChild
                let BR = A.rightChild
                t0 = B
                t1_ = [BR, A, B]
                t2_ = [A.leftChild, B?.leftChild, B?.rightChild?.leftChild, B?.rightChild?.rightChild]
                
            }else {
                // right-left 
                let A = n
                let B = A.rightChild
                let C = B?.leftChild
                t0 = C
                t1_ = [B  , A]
                t2_ = [A.leftChild, C?.leftChild, C?.rightChild, B?.rightChild]
            }
        default:
            balance(parent)
            return
        }
        
        /////// Round 2: re-weaving the relationships among above defined nodes. 
        
        // 2.1 between new t0 and its parent
        if n.isRoot {
            self.rootNode = t0
            self.rootNode?.parent = nil
        }else if n.isLeftChild  {
            parent?.lchild = t0
            t0?.parentNode = parent
            
        }else if n.isRightChild {
            parent?.rightChild = t0
            t0?.parentNode = parent
        }
        
        /// 2.2 between t0 and t1_
        t0?.leftChild = t1_[1]
        t1_[1]?.parentNode = t0
        t0?.rightChild = t1_[0]
        t1_[0]?.parentNode = t0
        
        /// 2.3 between t1_ and t2_
        t1_[1]?.leftChild = t2_[0]
        t2_[0]?.parentNode = t1_[1]
        t1_[1]?.rightChild = t2_[1]
        t2_[1]?.parentNode = t1_[1]
        
        t1_[0]?.leftChild = t2_[2]
        t2_[2]?.parentNode = t1_[0]
        t1_[0]?.rightChild = t2_[3]
        t2_[3]?.parentNode = t1_[0]
        
        
        /// Round 3
        t1_.forEach{ updateHeightUpwards($0) }
        
        balance(t0?.parentNode)
    }

    
}
