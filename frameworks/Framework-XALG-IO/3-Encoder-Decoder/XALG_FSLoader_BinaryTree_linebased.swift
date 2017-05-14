//
//  XALG_FSLoader_BinaryTree_linebased.swift
//  XALG
//
//  Created by Juguang Xiao on 21/03/2017.
//

import Foundation

class XALG_FSLoader_BinaryTree_linebased: NSObject {


//    XALG_Rep_TreeNode_BinaryTree
    
    var named_node_ = [String: XALG_Rep_TreeNode_BinaryTree<String>]()
    
    func load() {
        let url = Bundle.main.url(forResource: "BinaryTree-sample", withExtension: "txt")!
//        let data = try! Data(contentsOf: url)
        
        let str = try! String(contentsOf: url)
        
        var lineCount = 0
        str.enumerateLines { (line: String, stop: inout Bool) in
        
            let part_ = line.components(separatedBy: .whitespaces)
            guard part_.count == 3 else { fatalError() }
            let parent = part_[0]
            let parentNode : XALG_Rep_TreeNode_BinaryTree<String>
            
            if let pN = self.named_node_[parent] {
                parentNode = pN
            }else {
                parentNode = XALG_Rep_TreeNode_BinaryTree<String>(payload: parent)
//                parentNode.content = parent
                self.named_node_[parent] = parentNode
            }
            
            lineCount += 1
        }
        
    }
    
}
