//
//  XALG_ADT_Tree_BinarySearchTree.swift
//  XALG
//
//  Created by Juguang Xiao on 17/03/2017.
//

import Swift

protocol XALG_ADT_Tree_BinarySearchTree : XALG_ADT_Tree_BinaryTree{
    associatedtype NodeType : XALG_ADT_TreeNode_BinarySearchTree
//    associatedtype NodeType : XALG_ADT_TreeNode_BinaryTree_Key
    associatedtype PayloadType
    associatedtype KeyType : Comparable
    
    
//    var isOrderedBefore : ((PayloadType, PayloadType) -> Bool)? { get set }
    
    
    // possible to throw error??
//    func insert(payload: PayloadType, key: KeyType) -> NodeType
//    
//    func delete(node : NodeType)
//    func delete(key: KeyType)
//    func search(key: KeyType) -> PayloadType?
//    func searchNode(key: KeyType) -> NodeType?
//    
//    func searchNode(key: KeyType, fromNode node : NodeType) -> NodeType?
}
