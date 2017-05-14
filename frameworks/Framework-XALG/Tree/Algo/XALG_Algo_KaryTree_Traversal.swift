//
//  XALG_Algo_KaryTree_Traversal.swift
//  XALG
//
//  Created by Juguang Xiao on 04/03/2017.
//

import Swift

class XALG_Algo_KaryTree_Traversal_base<TreeType>
    where TreeType : XALG_ADT_Tree_KaryTree ,
    TreeType.NodeType == TreeType.NodeType.NodeType {
    
    typealias NodeType = TreeType.NodeType
    
    var callback_visit : ((NodeType, Int) -> Void)?
    var callback_visitNode : ((NodeType) -> Void)?
    
    
    var tree: TreeType?
    
    func run() throws {
        guard let root = tree?.root else { return }
        
        
        runRoot(root)
        
        
    }
    
    func runRoot(_ root : NodeType) {
        
    }
}



class TreeTraveral_preorder<TreeType> : XALG_Algo_KaryTree_Traversal_base<TreeType>
    where TreeType : XALG_ADT_Tree_KaryTree,
    TreeType.NodeType == TreeType.NodeType.NodeType
{
    
    func start(root : NodeType) {
        visitNode(root, index: 0, parent:  nil)
    }
    
    var callback_visitNode_index_parent: ((NodeType, Int,  NodeType?) -> Void)?
    
    func visitNode(_ n : NodeType, index: Int, parent: NodeType?) {
        // Visit first.
        callback_visitNode_index_parent?(n, index, parent)
        callback_visitNode?(n)
        //
        n.child_.enumerated().forEach  {
            
            let p = n 
            let c = $0.element 
            self.visitNode(c, index: $0.offset, parent: p)
            
//            visitNode(  $0.element, index: $0.offset, parent: n  )
        }
    }
}

class TreeTraveral_levelorder<TreeType> : XALG_Algo_KaryTree_Traversal_base<TreeType> where TreeType : XALG_ADT_Tree_KaryTree ,  TreeType.NodeType == TreeType.NodeType.NodeType ,TreeType.NodeType :  Hashable {
    
    typealias NodeType = TreeType.NodeType
    
    private let treeCalc = TreeHeightCalcuation<TreeType>()
    
    private var currentLevel = 0
    func levelorder(root : NodeType) {
        let h = treeCalc.height(root)
        for i in 1...h {
            currentLevel = i
            givenOrder(root, level: i)
        }
    }
    
    private func givenOrder(_ n : NodeType, level : Int) {
        
        switch level {
        case 0: return
        case 1 :
            
            var node_ = level_nodes_[self.currentLevel] ?? []
            print("************* \(node_.count)")
            node_.append(n)
            level_nodes_[self.currentLevel] = node_
            
            callback_visit?(n, self.currentLevel) //   print(n.object)
        default:
            n.child_.map{ $0 }.forEach{
                (c: NodeType) in
                givenOrder(c, level: level-1)
            }

            
//            n.child_.forEach {
//                (c: NodeType) in
//                givenOrder(c, level: level-1)
//            }
        }
    }
    
    var level_nodes_ = [Int : Array<NodeType>]()
}
