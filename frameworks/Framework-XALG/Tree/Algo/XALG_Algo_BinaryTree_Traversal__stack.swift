//
//  XALG_BinaryTreeTraversal__stack.swift
//  XALG
//
//  Created by Juguang Xiao on 02/03/2017.
//

import Swift


class XALG_BinaryTreeTraversal__stack<TreeType> : XALG_Algo_BinaryTree_Traversal<TreeType>
where TreeType : XALG_ADT_Tree_BinaryTree,
TreeType.NodeType == TreeType.NodeType.NodeType
{
    typealias NodeType = TreeType.NodeType
    
    static func travel__stack(_ root: NodeType?, order : TraversalOrder = .preorder, visit : XALG_Block_BinaryTreeNode ) {
        
        if order == .postorder {
            travel_postorder__stack(root, visit: visit)
            return
        }
        
        var stack = XALG_DS_Stack__Array<NodeType>()

//            XStack_ArrayBacked<
        var p = root
        while p != nil ||  stack.count != 0 {
            if let n = p {
                if order == .preorder { visit(n) }
                stack.push(n)
                p = n.lchild
            }else {
                let pp = stack.pop()
                if order == .inorder { visit(pp!) }
                p = pp?.rchild
            }
        }
    }
    
    private struct VisitCount {
        var node : NodeType
        var count : Int = 1
        
    }
    
    private static func travel_postorder__stack(_ root: NodeType?, visit: XALG_Block_BinaryTreeNode) {
//        guard var r = root else { return }
        var stack = XALG_DS_Stack__Array<VisitCount>()
        var p = root
        while p != nil || stack.count != 0 {
            if p != nil {
                let vc = VisitCount(node: p!, count: 1)
                stack.push(vc)
                p = p?.lchild
            }else {
                var temp = stack.pop()!
                if temp.count == 1 {
                    temp.count = 2
                    stack.push(temp)
                    p = temp.node.rchild
                }else {
                    visit(temp.node)
                    p = nil
                }
            }
        }
    }
    
    static func travel_level__queue(_ root: NodeType?, visit : XALG_Block_BinaryTreeNode) {
        guard let r = root else { return }
        var queue =
            XALG_DS_Queue__Array<NodeType>()
        queue.enqueue(r)
        while queue.count != 0 {
            
            if let t = queue.dequeue() {
                visit(t)
                if let l = t.lchild { queue.enqueue(l) }
                if let r = t.rchild { queue.enqueue(r) }
            }
        }
    }
}
