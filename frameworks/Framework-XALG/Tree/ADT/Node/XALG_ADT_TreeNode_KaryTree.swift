//
//  XALG_ADT_TreeNode_KaryTree.swift
//  XALG
//
//  Created by Juguang Xiao on 05/03/2017.
//

import Swift


protocol XALG_ADT_TreeNode_KaryTree {
    associatedtype NodeType : Self
    var child_ : [NodeType] { get set }
    
    associatedtype IndexType : Hashable
    var index: IndexType { get }
    
    
    associatedtype PayloadType : Hashable
    var payload : PayloadType { get } 
}
//extension XALG_ADT_Node_KaryTree : Hashable, Equatable {
//    var hashValue: Int {
//        return index.hashValue
//    }
//
//    static func == (x: XALG_ADT_Node_KaryTree, y: XALG_ADT_Node_KaryTree) -> Bool {
//        return x.hashValue == y.hashValue
//    }
//
//
//}
