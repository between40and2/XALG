//
//  XALG_Tests_Graph.swift
//  XALG
//
//  Created by Juguang Xiao on 14/03/2017.
//

import XCTest

class XALG_Tests_Graph: XCTestCase {

    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_emptyGraph() {
        let g = XALG_Rep_Graph<Int>()
        XCTAssertFalse(g.directed)
        XCTAssert(g.vertex_.count == 0)
        XCTAssert(g.edge_.count == 0 )
    }
    
    var v_s : XALG_Rep_Graph<String>.VertexType!
    let g = XALG_Rep_Graph<String>()
    
    // to test with NoThrow or ThrowsError, a no-return func must be present.
    private func _tryToAdd(_ ident : String) throws {
        v_s = try g.addVertex(identifier: ident)
    }
    
    func testExample() {

        XCTAssertNoThrow( try _tryToAdd("s") )
        XCTAssertThrowsError( try _tryToAdd("s") ){
            print($0)
        }
        let v_0 : XALG_Rep_Graph<String>.VertexType
        do {
            v_0 = try g.addVertex(identifier: "0")
        }catch {
            v_0 = try! g.addVertex(identifier: UUID().description)
        }
        
        // this same pair of vertex for a edge cannot be added more than once.
    
        let e_s_0 = try! self.g.addEdge(between: self.v_s, and: v_0)
        print("first edge added.")
        g.allows_addingEdge_samePairOfVertex = false
        
        XCTAssertThrowsError(  //{ // DON'T enclose the statement with {} !!!!
            try self.g.addEdge(between: self.v_s, and: v_0)
        )
        XCTAssert(g.vertex_.count == 2)
        XCTAssert(g.edge_.count == 1)
        
        // Now enable it.
        g.allows_addingEdge_samePairOfVertex = true
        
        XCTAssertNoThrow( try self.g.addEdge(between: self.v_s, and: v_0))

        XCTAssert(g.vertex_.count == 2)
        XCTAssert(g.edge_.count == 2) // 1 more added
//        XCTAssert(e_s_0!.vertex_.count == 2)
        
    }
   
    // 20-c23
    // https://hybridcattt.com/blog/how-to-test-throwing-code-in-swift/
    func test_create_directional_weighted() {
        
        let g = XALG_Rep_Graph_Weighted<Int, Double>(directed: true)
        XCTAssertTrue(g.directed)
        XCTAssert(g.vertex_.count == 0)
        XCTAssert(g.edge_.count == 0 )
        
        
        XCTAssertThrowsError(try g.addEdge(between: 1, and: 2)) {
            print($0)
            // directedGraph_callingAddEdgeBetweenAnd
            XCTAssertNotEqual($0 as! XALG_Error_Graph, XALG_Error_Graph.defaultWeightMissing)
            XCTAssertEqual($0 as! XALG_Error_Graph, XALG_Error_Graph.directedGraph_callingAddEdgeBetweenAnd)
            
        }
        XCTAssertThrowsError(try g.addEdge(from: 1, to: 2)) {
            print($0) // defaultWeightMissing
            
            XCTAssertEqual($0 as! XALG_Error_Graph, XALG_Error_Graph.defaultWeightMissing, "error = defaultWeightMissing")
        }
        
        g.defaultWeight = 10
        XCTAssertNoThrow(try g.addEdge(from: 1, to: 2))
        
        XCTAssert(g.vertex_.count == 2)
        XCTAssert(g.edge_.count == 1)
        
        
        
    }
}
