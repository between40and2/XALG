//
//  XALG_Tests_HuffmanTree.swift
//  XALG
//
//  Created by Juguang Xiao on 03/03/2017.

//

import XCTest

class XALG_Tests_HuffmanTree: XCTestCase {

    typealias TreeNode = XALG_Rep_TreeNode_HuffmanTree<String>
    
    func test_construct() {
        
        let huffmanTree = XALG_Rep_Tree_HuffmanTree<String>()
        huffmanTree.buildTree(elements: ["Z", "B", "P", "A", "X", "E"], weights: [2, 10, 24, 32, 32, 110])
        
        
        guard let root = huffmanTree.rootNode else {
            
            XCTAssert(false)
            
            return
        }

        
        
        examineBranch(root, weight: 210)
        
        print("xxxxxxxxxxxxxxxxxxxxxxx")
        print(root.rchild!)
        
        let r_r = root.rchild! as! TreeNode
        examineLeaf(r_r, content: "E", weight: 110)
        let r_l = root.lchild! as! TreeNode
        examineBranch(r_l, weight: 100)

        
        
        let r_l_l = r_l.lchild! as! TreeNode
        examineBranch(r_l_l, weight: 36)
        let r_l_r = r_l.rchild! as! TreeNode
        examineBranch(r_l_r, weight: 64)
    }
    
    private func examineLeaf(_ n : TreeNode , content : String, weight : Int) {
        
        XCTAssertEqual(n.payload, content)
        XCTAssertEqual(n.weight, weight)
        
    }
    
    private func examineBranch(_ n : TreeNode, weight : Int) {
        XCTAssertNil(n.payload)
        XCTAssertEqual(n.weight, weight)
    }
}
