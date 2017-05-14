//
//  XALG_ADT_Tree_KaryTree.swift
//  XALG
//
//  Created by Juguang Xiao on 05/03/2017.
//

import Swift

protocol XALG_ADT_Tree_OrderedTree {
    associatedtype NodeType
    
//    var child_ : [NodeType] { get set }
}


protocol XALG_ADT_Tree_KaryTree: XALG_ADT_Tree_OrderedTree {

    associatedtype NodeType : XALG_ADT_TreeNode_KaryTree
    
    var root : NodeType? { get set }
}

