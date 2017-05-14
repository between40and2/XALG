//
//  XALG_BinaryTreeTraversalApplication.swift
//  XALG
//
//  Created by Juguang Xiao on 02/03/2017.
//

import Swift

class XALG_BinaryTreeTraversalApplication<TreeType>
where TreeType : XALG_ADT_Tree_BinaryTree,
TreeType.NodeType == TreeType.NodeType.NodeType
{

    typealias NodeType = TreeType.NodeType
//    private var leafCount = 0
    func countLeave(_ root: NodeType) -> Int {
        var leafCount = 0
        XALG_Algo_BinaryTree_Traversal<TreeType>.travel__recursive(root, order: .postorder) { (n) in
            if n.lchild == nil && n.rchild == nil {
                leafCount += 1
            }
        }
        return leafCount
    }
  
//    private var level = 0
    private var depth = 0
    func countDepth(_ root: NodeType, level: Int = 0 ) -> Int {
        
        if let l = root.lchild   {
            depth = countDepth(l, level: level+1)
        }
        if let r = root.rchild {
            depth = countDepth(r, level: level+1)
        }
        if level > depth { depth = level}
        return depth 
    }
    
}
