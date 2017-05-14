//
//  XALG_Rep_Tree_KaryTree.swift
//  XALG
//
//  Created by Juguang Xiao on 03/03/2017.
//

import Swift

//class XALG_Rep_Tree_KaryTree: NSObject {
//
//}

struct XALG_Rep_Tree_KaryTree<PayloadType> : XALG_ADT_Tree_KaryTree {
    
    typealias NodeType = XALG_Rep_TreeNode_KaryTree<PayloadType>

    var root : NodeType?
    var child_ : [NodeType] = []
}


class TreeHeightCalcuation<TreeType>
    where TreeType : XALG_ADT_Tree_KaryTree ,
    TreeType.NodeType : Hashable,
TreeType.NodeType == TreeType.NodeType.NodeType {
    
    typealias NodeType =  TreeType.NodeType //XALG_Rep_TreeNode_KaryTree<TreeType>
    private var node_height = [NodeType : Int]()
    func height(_ n : NodeType) -> Int {
        if let h = node_height[n] {
            return h
        }
        let sublength_ = n.child_.map { height($0) }
        let max = sublength_.max() ?? 0
        let h = max + 1
        node_height[n] = h
        return h
    }
    
    func reset() { node_height = [NodeType : Int]() }
}
