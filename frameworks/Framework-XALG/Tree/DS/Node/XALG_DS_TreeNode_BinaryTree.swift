//
//  XALG_DS_TreeNode_BinaryTree.swift
//  XALG
//
//  Created by Juguang Xiao on 08/05/2017.
//

import Swift

class XALG_DS_TreeNode_BinaryTree<Payload, TreeNode>: XALG_ADT_TreeNode_BinaryTree
where TreeNode : XALG_ADT_TreeNode_BinaryTree ,  TreeNode == TreeNode.NodeType
{

    typealias PayloadType = Payload
    typealias NodeType = TreeNode
    
    
    var lchild: TreeNode?
    var rchild: TreeNode?
    weak var parent: TreeNode?
    
    
}

//class XALG_DS_TreeNode_BinaryTree


class XALG_DS_TreeNode_BinaryTree_Key<Payload, Key, TreeNode> :
    XALG_DS_TreeNode_BinaryTree<Payload, TreeNode>,
XALG_ADT_TreeNode_BinarySearchTree
where Key : Comparable,
    TreeNode : XALG_ADT_TreeNode_BinarySearchTree ,
    TreeNode == TreeNode.NodeType
{
    
    typealias KeyType = Key
    typealias NodeType = TreeNode
    
    var key : KeyType
    
    init(key k: KeyType) {
        key = k
        
    }
    
    // MARK: - Height
    
    var height = -1
    
    var balanceFactor : Int {
        let height_left = lchild?.height ?? 0
        let height_right = rchild?.height ?? 0
        
        return height_left - height_right
    }
}
