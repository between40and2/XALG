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
    func tryToAdd(_ ident : String) throws {
        v_s = try g.addVertex(identifier: ident)
    }
    
    func testExample() {

        XCTAssertNoThrow( try tryToAdd("s") )
        XCTAssertThrowsError( try tryToAdd("s") ){
            print($0)
        }
        let v_0 : XALG_Rep_Graph<String>.VertexType
        do {
            v_0 = try g.addVertex(identifier: "0")
        }catch { v_0 = try! g.addVertex(identifier: UUID().description) }
        
        
        
        let e_s_0 = try! g.addEdge(between: v_s, and: v_0)
        
        XCTAssert(g.vertex_.count == 2)
        XCTAssert(g.edge_.count == 1)
        XCTAssert(e_s_0!.vertex_.count == 2)
        
    }
   
}
