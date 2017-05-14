//
//  XALG_Tests_Graph_CP.swift
//  XALG
//
//  Created by Juguang Xiao on 25/03/2017.
//

import XCTest

class XALG_Tests_Graph_CP: XALG_Tests_Graph_datafromfile {

    
    typealias G = XALG_Rep_Graph_Weighted<String, Int>
    
    override func setUp() {
        super.setUp()
        _graph = loadFromTxtfile_directed_weighted_stringAsVertex_intAsEdge("data-graph-aoe")!
    }
    
    private var _graph : G?
    
    func test_CritialPath() {

        let cp = XALG_Algo_Graph_CritialPath<G>()
        cp.graph = _graph!
        
        try! cp.run()
        
        assert_vertexEarly(cp)
        
/*
 < v1 ,  v3
 < v3 ,  v5
 < v5 ,  v6
 < v6 ,  v8
 */
        
        XCTAssertEqual(cp.path_!.count, 1)
        let path =    cp.path_![0]
        
        XCTAssertEqual(path.edge_.count, 4)
        
        XCTAssertEqual(path.edge_[0].vertex_[0].identifier, "v1")
        XCTAssertEqual(path.edge_[0].vertex_[1].identifier, "v3")
        XCTAssertEqual(path.edge_[1].vertex_[0].identifier, "v3")
        XCTAssertEqual(path.edge_[2].vertex_[0].identifier, "v5")
        XCTAssertEqual(path.edge_[3].vertex_[0].identifier, "v6")
        XCTAssertEqual(path.edge_[3].vertex_[1].identifier, "v8")
    }
    private struct VertexEarlyLate {
        var identifier : String
        var early : Int
        var late : Int
    }
    
    private func assert_vertexEarly(_ cp: XALG_Algo_Graph_CritialPath<G>) {
     
        let expected_ : [VertexEarlyLate] = [
            
            VertexEarlyLate(identifier: "v1", early: 0, late: 0),
            VertexEarlyLate(identifier: "v2", early: 4, late: 5),
            VertexEarlyLate(identifier: "v3", early: 7, late: 7),
            VertexEarlyLate(identifier: "v4", early: 7, late: 25),
            VertexEarlyLate(identifier: "v5", early: 15, late: 15),
            VertexEarlyLate(identifier: "v6", early: 26, late: 26),
            VertexEarlyLate(identifier: "v7", early: 20, late: 32),
            VertexEarlyLate(identifier: "v8", early: 34, late: 34)
            
        ]
        
        
    
        expected_.forEach{
            
            let v = _graph!.vertex(identifier: $0.identifier)!
            
            XCTAssertEqual(cp.v_e_[v]!, $0.early)
            XCTAssertEqual(cp.v_l_[v]!, $0.late)
            
        }
        
    }
    
    
}
