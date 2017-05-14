//
//  XALG_Tests_KaryTree.swift
//  XALG
//
//  Created by Juguang Xiao on 16/03/2017.
//

import XCTest

class XALG_Tests_KaryTree: XCTestCase {
    
    typealias TreeType_String = XALG_Rep_Tree_KaryTree<String>
    
    private var karyTree_string : TreeType_String?
    
    override func setUp() {
        super.setUp()
        
        var karyTree = TreeType_String()
        
        let root = XALG_Rep_TreeNode_KaryTree<String>(payload: "root")
        karyTree.root = root
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
//    private var roodNode : XALG_Rep_Node_KaryTree

    
}
