//
//  XALG_Tests_BinaryTree.swift
//  XALG
//
//  Created by Juguang Xiao on 17/03/2017.
//

import XCTest

class XALG_Tests_BinaryTree: XCTestCase {

    typealias NodeType_String = XALG_Rep_TreeNode_BinaryTree<String>
    typealias NodeType_Int = XALG_Rep_TreeNode_BinaryTree<Int>
    
    typealias TreeType_String = XALG_Rep_Tree_BinaryTree<String>
    
    var rootNode : NodeType_String?
    
    var tree : TreeType_String?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
        let bundle = Bundle(for : type(of: self)) // not using Bundle.main, which is main app, not unit test bundle.
        let url = bundle.url(forResource: "data-binarytree", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let dict = try! PropertyListSerialization.propertyList(from: data , options: [], format: nil) as! [String : Any]
        
        print(dict)
        
        rootNode = node(from: dict)!
        tree = TreeType_String()
        tree!.rootNode = rootNode
    }
    
    func node(from d : [String: Any]) -> NodeType_String? {
        
        let key = d["key"] as! String
        let n = NodeType_String(payload: key)
        
        if let l = d["left"] {
            switch l {
            case let s as String:
                let left = NodeType_String(payload: s)
                n.lchild = left
            case let d as [String:Any] :
                let left = node(from: d)
                n.lchild = left
            default: break
            }
        }
        
        if let r = d["right"] {
            switch r {
            case let s as String:
                let right = NodeType_String(payload: s)
                n.rchild = right
            case let d as [String : Any] :
                let right = node(from: d)
                n.rchild = right
            default: break
            }
        }
        
        return n
    }
    
    func test_construct() {
        
        
        let root = NodeType_Int(payload: 2)
        
        
        XCTAssert(root.countNode() == 1)
        XCTAssertTrue(root.isLeaf)
        let left = NodeType_Int(payload: 3)
        root.lchild = left
        XCTAssert(left.countNode() == 1)
        XCTAssert(root.countNode() == 2)
        XCTAssertFalse(root.isLeaf)
        XCTAssertTrue(left.isLeaf)
        
        // add right
        let right = NodeType_Int(payload: 4)
        root.rchild = right
        XCTAssert(root.countNode() == 3)
        
    }
    
    // http://stackoverflow.com/questions/19151420/load-files-in-xcode-unit-tests
    func test_preorder() {
        
        
        let traveral = XALG_Algo_BinaryTree_Traversal_preorder<TreeType_String>()
        var array_visited = [String]()
        traveral.callback_visit = {
//            print($0.object!.payload)
//            $0.object!.payload
            let payload = $0.object!.payload!
            array_visited.append(payload)
        }
        traveral.callback_complete = {
            
            print(array_visited)
//            XCTAssert(false)
            XCTAssert(array_visited == ["root", "1", "2", "3"])
            
        }
//        traveral.root = self.rootNode!
        traveral.tree = self.tree
        traveral.traversal()
        //        print(n)
        
        
    }
    
    func test_inorder() {
        let inorder = XALG_Algo_BinaryTree_Traversal_inorder<TreeType_String>() // (root: self.rootNode! )
        inorder.callback_complete = {
            print("inorder: ", inorder.visit_.map { $0.object!.payload! } )
        }
        inorder.tree = tree
        inorder.traversal()
        
//        print("inorder after called: ", inorder.visit_.map { $0.object!.key } )
        
        XCTAssertEqual(inorder.visit_.map { $0.object!.payload! }, ["1", "root", "3", "2"])
    }
    
    
}
