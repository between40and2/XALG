//
//  XALG_Tests_Graph_Weighted.swift
//  XALG
//
//  Created by Juguang Xiao on 18/03/2017.
//

import XCTest

class XALG_Tests_Graph_Weighted: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_graph() {
        
        let graph = XALG_Rep_Graph_Weighted<String, Double>()
        
        
        let vs = try! graph.addVertex(identifier: "S")
        let v0 = try! graph.addVertex(identifier: "0")

        
        let e_s_0 = try! graph.addEdge(between: vs, and: v0, weight: 20.3)
        
        let w = graph.weight(onEdge: e_s_0!)
        
        XCTAssert(w == 20.3)
    }
    
    func test_Performance() {

        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
