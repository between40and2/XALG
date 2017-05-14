//
//  XALG_Tests_Graph_SSSP.swift
//  XALG
//
//  Created by Juguang Xiao on 25/03/2017.
//
import XCTest

class XALG_Tests_Graph_SSSP: XALG_Tests_Graph_datafromfile {
    
    typealias G = XALG_Rep_Graph_Weighted<String, Int>
    private var g : G!
    override func setUp() {
        super.setUp()
        g = loadFromTxtfile_directed_weighted_stringAsVertex_intAsEdge("data-graph-directed-weighted-1")!
    }
    
    
    
//    func executeSSSP(_ sssp ) {
//        
//    }
    
    func test_BellmanFord() {

        
        let bellmanFord = XALG_Algo_Graph_BellmanFord<G>()
        
        bellmanFord.graph = g
        bellmanFord.sourceVertex = g.vertex_[0]
        
        try! bellmanFord.run()
        
        assert_SSSP(bellmanFord, g:  g)

    }
    
    
    func test_Dijkstra() {
        
        let sssp = XALG_Algo_Graph_Dijkstra<G>()
        
        sssp.graph = g
        sssp.sourceVertex = g.vertex_[0]
        
        try! sssp.run()
        
        assert_SSSP(sssp, g:  g)
    }
    
/*
0 0 ["0"]
1 10 ["0", "1"]
4 55 ["0", "3", "2", "4"]
3 25 ["0", "3"]
2 45 ["0", "3", "2"]
*/
    
    private var _checkingSssp : XALG_Algo_Graph_SSSP<G>?
    private var _checkingG : G?
    
    private func assert_SSSP(_ sssp : XALG_Algo_Graph_SSSP<G>, g: G) {
        _checkingSssp = sssp
        _checkingG = g
//        for v in g.vertex_ {
//            let d = sssp.distance(to: v)!
//            let p = sssp.path(to: v)!
//            print(v.identifier, d, p.map { $0.identifier})
//        }
        
        assert_Vertex(ident: "0", expectedDistance: 0, expectedSPIdent_: ["0"])
        assert_Vertex(ident: "1", expectedDistance: 10, expectedSPIdent_: ["0", "1"])
        assert_Vertex(ident: "2", expectedDistance: 45, expectedSPIdent_: ["0", "3", "2"])
        assert_Vertex(ident: "3", expectedDistance: 25, expectedSPIdent_: ["0", "3"])
        assert_Vertex(ident: "4", expectedDistance: 55, expectedSPIdent_: ["0", "3", "2", "4"])
    }
    
    private func assert_Vertex(ident : String, expectedDistance : Int, expectedSPIdent_ : [String]) {
        
        let v = _checkingG!.vertex(identifier: ident)!
        
        
        let d = _checkingSssp!.distance(to: v)!
        let p = _checkingSssp!.path(to: v)!.map { $0.identifier }
        
        
        XCTAssertEqual(d,expectedDistance)
        XCTAssertEqual(p, expectedSPIdent_)
        
    }
}
