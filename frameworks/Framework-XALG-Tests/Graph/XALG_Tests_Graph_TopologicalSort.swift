//
//  XALG_Tests_Graph_TopologicalSort.swift
//  XALG
//
//  Created by Juguang Xiao on 26/03/2017.
//

import XCTest

class XALG_Tests_Graph_TopologicalSort: XALG_Tests_Graph_datafromfile {
    
    typealias G = XALG_Rep_Graph<String>
    
    override func setUp() {
        super.setUp()
        let g = loadFromTxtfile_undirected_unweighted_stringAsVertex("data-graph-aov-topsort")!
        _graph = g
    }
    
    private var _graph : G?
    
    
    func test_TopologicalSort() {
        
        let topsort = XALG_Algo_Graph_TopologicalSorting__Queue<G>()
        
        topsort.graph = _graph!
        try! topsort.run()
        let sorted_ = topsort.sorted_!
        print(topsort.sorted_!.map { $0.identifier })
        
        assert_array( sorted_ , ident_a: "v1", isPriorTo: "v6")
        
        // ["v1", "v2", "v3", "v5", "v6", "v7", "v4", "v8"]
    }
    
    private func assert_array(_ arr : [G.VertexType], ident_a: G.VertexType.VertexIdentifier, isPriorTo ident_b : G.VertexType.VertexIdentifier) {
    
        let vertex_a = _graph!.vertex(identifier: ident_a)!
        let vertex_b = _graph!.vertex(identifier: ident_b)!
        
        let index_a = arr.index(of: vertex_a)!
        let index_b = arr.index(of: vertex_b)!
        
        
        XCTAssertLessThan(index_a, index_b)

    }
}
