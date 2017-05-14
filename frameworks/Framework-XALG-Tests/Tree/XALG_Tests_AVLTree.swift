//
//  XALG_Tests_AVLTree.swift
//  XALG
//
//  Created by Juguang Xiao on 05/03/2017.
//

import XCTest

class XALG_Tests_AVLTree: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_generate() {
        
        let avl = XALG_Rep_Tree_AVLTree<String, Int>()
        
        [4, 6, 3, 9, 7, 1].forEach {
            let _ = avl.insert(payload: $0.description, key: $0)
        }
        
        var root = avl.rootNode!
        
        XCTAssertEqual(root.key, 4)
        // left arm 
        var l = root.leftChild!
        XCTAssertEqual(l.key, 3)
        XCTAssertNil( l.rightChild)
        var l_l = l.leftChild!
        XCTAssertEqual(l_l.key, 1)
        XCTAssertNil( l_l.leftChild)
        XCTAssertNil( l_l.rightChild)
        
        // right arm
        var r = root.rightChild!
        XCTAssertEqual(r.key, 7)
        var r_l = r.leftChild!
        XCTAssertEqual(r_l.key, 6)
        XCTAssertNil(r_l.leftChild)
        XCTAssertNil(r_l.rightChild)
        var r_r = r.rightChild!
        XCTAssertEqual(r_r.key, 9)
        XCTAssertNil(r_r.leftChild)
        XCTAssertNil(r_r.rightChild)
        
        
        
/*
     4
  3     7
1      6 9
        
*/
        let _ = avl.insert(payload: "2", key: 2)
        
        
        root = avl.rootNode!
        
        XCTAssertEqual(root.key, 4)
        // left arm - changed
        l = root.leftChild!
        XCTAssertEqual(l.key, 2)
        
        l_l = l.leftChild!
        XCTAssertEqual(l_l.key, 1)
        XCTAssertNil( l_l.leftChild)
        XCTAssertNil( l_l.rightChild)
        let l_r = l.rightChild!
        XCTAssertEqual(l_r.key, 3)
        XCTAssertNil( l_r.leftChild)
        XCTAssertNil( l_r.rightChild)
        
        
        // right arm - no change
         r = root.rightChild!
        XCTAssertEqual(r.key, 7)
         r_l = r.leftChild!
        XCTAssertEqual(r_l.key, 6)
        XCTAssertNil(r_l.leftChild)
        XCTAssertNil(r_l.rightChild)
         r_r = r.rightChild!
        XCTAssertEqual(r_r.key, 9)
        XCTAssertNil(r_r.leftChild)
        XCTAssertNil(r_r.rightChild)
/*
       4
    2     7
  1   3 6   9
 */
        
    }
}
