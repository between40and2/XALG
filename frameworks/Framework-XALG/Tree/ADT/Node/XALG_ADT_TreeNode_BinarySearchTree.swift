//
//  XALG_ADT_TreeNode_BinarySearchTree.swift
//  XALG
//
//  Created by Juguang Xiao on 06/03/2017.
//

import Swift

protocol XALG_ADT_TreeNode_BinarySearchTree : XALG_ADT_TreeNode_BinaryTree  {

    associatedtype KeyType : Comparable
    
    var key : KeyType { get set }
    
    var height : Int { get set }
}
