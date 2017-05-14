//
//  XALG_ADT_Tree_BinaryTree.swift
//  XALG
//
//  Created by Juguang Xiao on 02/03/2017.
//

import Swift

protocol XALG_ADT_Tree_BinaryTree
    //: XALG_ADT_Tree_KaryTree {
{
    
    associatedtype NodeType : XALG_ADT_TreeNode_BinaryTree
    
    var rootNode : NodeType? { get set }
}


class XALG_Rep_Tree_BinaryTree <NodeContentType>:
    //    XALG_Rep_Tree_KaryTree<NodeContentType> ,
    XALG_ADT_Tree_BinaryTree
    //where Self.NodeType == XALG_Rep_TreeNode_BinaryTree<NodeContentType>{
{
    
    typealias NodeType = XALG_Rep_TreeNode_BinaryTree<NodeContentType>
    
    var rootNode : NodeType?
    
    //    var child_ : [NodeTyp = []e] = []
}


//typealias XALG_BinaryTree = XALG_Rep_Tree_BinaryTree
