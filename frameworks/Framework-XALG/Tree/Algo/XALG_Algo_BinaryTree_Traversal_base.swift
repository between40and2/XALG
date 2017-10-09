//
//  XALG_Algo_BinaryTree_Traversal.swift
//  XALG
//
//  Created by Juguang Xiao on 17/03/2017.
//

import Swift

class XALG_Algo_BinaryTree_Traversal_base<TreeType>
where TreeType : XALG_ADT_Tree_BinaryTree,
TreeType.NodeType == TreeType.NodeType.NodeType
//TreeType.NodeType
//<KeyType : Equatable>  {
{
    typealias NodeType = TreeType.NodeType //  XALG_Rep_Node_BinaryTree<KeyType>
    typealias VisitType = XALG_Visit<NodeType>

    //    var root : XALG_Rep_Node_BinaryTree<KeyType>?
    var tree : TreeType?
    
    init() {
//        super.init()
    }
    
    
    init(tree: TreeType) {
        self.tree = tree
    }
    
    var callback_visit : ((VisitType) -> Void)?
    
    var callback_complete : (() -> Void)?
    
    func traversal() {
        _visit_ = Array<VisitType>()
        visit_recursive(tree!.rootNode!) //   root!)
        
        callback_complete?()
    }
    
    fileprivate func visit_recursive(_ n : NodeType) {
        fatalError()
    }
    
    fileprivate func process(_ n : NodeType) {
        let visit = VisitType()
        visit.object = n
        callback_visit?(visit)
        
        _visit_.append(visit)
    }
    
    private var _visit_ = Array<VisitType>()
    
    var visit_ : Array<VisitType> {
        return _visit_
    }

    
    fileprivate func visit_left( _ n : NodeType) {
        if let l = n.lchild {
            visit_recursive(l)
        }
    }
    fileprivate func visit_right(_ n : NodeType) {
        if let r = n.rchild {
            visit_recursive(r)
        }
    }
}

//final class XALG_Algo_BinaryTree_Traversal_preorder<KeyType : Equatable> :  XALG_Algo_BinaryTree_Traversal_base<KeyType> {
final class XALG_Algo_BinaryTree_Traversal_preorder<TreeType> : XALG_Algo_BinaryTree_Traversal_base<TreeType>
    where TreeType : XALG_ADT_Tree_BinaryTree,
TreeType.NodeType == TreeType.NodeType.NodeType
{
    override func visit_recursive(_ n : NodeType) {
        process(n)
        visit_left(n)
        visit_right(n)
    }
}

//final class XALG_Algo_BinaryTree_Traversal_inorder<KeyType : Equatable> :  XALG_Algo_BinaryTree_Traversal_base<KeyType> {
//}

final class XALG_Algo_BinaryTree_Traversal_inorder<TreeType> : XALG_Algo_BinaryTree_Traversal_base<TreeType>
    where TreeType : XALG_ADT_Tree_BinaryTree,
TreeType.NodeType == TreeType.NodeType.NodeType
{
    override func visit_recursive(_ n : NodeType) {
        visit_left(n)
        process(n)
        visit_right(n)
    }
}
final class XALG_Algo_BinaryTree_Traversal_postorder<TreeType> : XALG_Algo_BinaryTree_Traversal_base<TreeType>
    where TreeType : XALG_ADT_Tree_BinaryTree,
TreeType.NodeType == TreeType.NodeType.NodeType{

    
    override func visit_recursive(_ n : NodeType) {
        visit_left(n)
        visit_right(n)
        process(n)
    }
}
