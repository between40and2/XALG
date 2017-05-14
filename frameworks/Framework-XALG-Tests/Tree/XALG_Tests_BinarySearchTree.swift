//
//  XALG_Tests_BinarySearchTree.swift
//  XALG
//
//  Created by Juguang Xiao on 05/03/2017.
//

import XCTest

class XALG_Tests_BinarySearchTree: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    typealias TreeNode = XALG_Rep_Tree_BinarySearchTree<String, Int>
    
    func test_generate() {
        
        let bst = XALG_Rep_Tree_BinarySearchTree<String, Int>()
        
        [4, 6, 3, 9, 7, 1].forEach {
            let _ = bst.insert(payload: $0.description, key: $0)
        }
        
        let root = bst.rootNode!
//        print(bst.rootNode!)
        
        XCTAssertEqual(root.key, 4)
        let l = root.leftChild!
        XCTAssertEqual(l.key, 3)
        XCTAssertNil(l.rightChild)
        let l_l = l.leftChild!
        XCTAssertEqual(l_l.key, 1)
        XCTAssertNil(l_l.leftChild)
        XCTAssertNil(l_l.rightChild)
        
        
        // right arm
        let r = root.rightChild!
        XCTAssertEqual(r.key, 6)
        XCTAssertNil(r.leftChild)
        let r_r = r.rightChild!
        XCTAssertEqual(r_r.key, 9)
        let r_r_l = r_r.leftChild!
        XCTAssertEqual(r_r_l.key, 7)
        XCTAssertNil(r_r.rightChild)
        XCTAssertNil(r_r_l.leftChild)
        XCTAssertNil(r_r_l.rightChild)
        
//        bst.rootNode?.leftChild
//        
////        let inorder = XALG_Algo_BinaryTree_Traversal_inorder<TreeNode>()
////        inorde
        
        XCTAssertNil( bst.search(key: 2, usesRecursion: true))
        
        if let found = bst.search(key: 6, usesRecursion: false) {
      
            XCTAssertEqual(found.key, 6)
            let parent = found.parent! as! XALG_Rep_TreeNode_BinaryTree_Key<String, Int>
            XCTAssertEqual(parent.key, 4)
        }else {
            XCTAssertTrue(false)
        }
      
        if let found = bst.search(key: 6, usesRecursion: true) {
            
            XCTAssertEqual(found.key, 6)
            let parent = found.parent! as! XALG_Rep_TreeNode_BinaryTree_Key<String, Int>
            XCTAssertEqual(parent.key, 4)
        }else {
            XCTAssertTrue(false)
        }
        
    }
    
}
