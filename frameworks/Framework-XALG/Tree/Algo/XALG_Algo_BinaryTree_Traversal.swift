//
//  XALG_Algo_BinaryTree_Traversal.swift
//  XALG
//
//  Created by Juguang Xiao on 02/03/2017.
//

import Swift






class XALG_Algo_BinaryTree_Traversal<TreeType>
where TreeType : XALG_ADT_Tree_BinaryTree, 
TreeType.NodeType == TreeType.NodeType.NodeType
{
    typealias NodeType = TreeType.NodeType
    typealias XALG_Block_BinaryTreeNode = (NodeType) -> Void
    
    
    enum TraversalOrder {
        case preorder
        case inorder
        case postorder
        //        case levelorder
    }
    
  
    static func travel__recursive(_ root: NodeType? , order : TraversalOrder = .preorder, visit : XALG_Block_BinaryTreeNode) {
        
        guard  let n = root else {
            return
        }
        
        switch order {
        case .preorder:
            visit(n)
            travel__recursive(n.lchild, order: order, visit: visit)
            travel__recursive(n.rchild, order: order, visit: visit)
        case .inorder :
            travel__recursive(n.lchild, order: order, visit: visit)
            visit(n)
            travel__recursive(n.rchild, order: order, visit: visit)
        case .postorder :
            travel__recursive(n.lchild, order: order, visit: visit)
            travel__recursive(n.rchild, order: order, visit: visit)
            visit(n)
        }
    }
    

}
