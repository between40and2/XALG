//
//  XALG_Tests_Graph_Traversal.swift
//  XALG
//
//  Created by Juguang Xiao on 26/04/2017.
//

import XCTest


class XALG_Tests_Graph_Traversal: XALG_Tests_Graph_datafromfile {
    typealias G = XALG_Rep_Graph<String>
    
    override func setUp() {
        super.setUp()
        let g = loadFromTxtfile_undirected_unweighted_stringAsVertex("data-graph-traversal")!
        _graph = g
    }
    
    private var _graph : G?
    
    func test_DFS() {
        
        let dfs = XALG_Algo_Graph_DFS<G>()
        dfs.graph = _graph
        dfs.startVertex = _graph!.vertex(identifier: "v1")
        dfs.callback_visit = {
            print($0.vertex!.identifier, $0.depth!)
        }
        try! dfs.travel()
        
        /*
         v1
         v2
         v3
         v6
         v8
         v9
         v4
         
         5 7 are missing. it seems to be treated as directed graph!!!!!
         */
    }
    
    private let expected_ : [(String, Int)] = [
        ("v1", 0),
        ("v2", 1), ("v3", 1), ("v4", 1),
        ("v5", 2), ("v6", 2),
        ("v7", 3), ("v8", 3),
        ("v9", 4)
    ]
    
    
    func test_BFS() {
        let bfs = XALG_Algo_Graph_BFS<G>()
        bfs.graph = _graph
        bfs.startVertex = _graph!.vertex(identifier: "v1")
        var index = 0
        bfs.callback_visit = {
//            print($0.vertex!.identifier, $0.depth!)
            let e = self.expected_[index]
            XCTAssertEqual(e.0,  $0.vertex!.identifier )
            XCTAssertEqual(e.1, $0.depth!)
            index += 1
        }
        
        try! bfs.travel()
        

        // expected vs actual
        for (e, a) in zip(expected_, bfs.visit_) {
            
            XCTAssertEqual(e.0,  a.vertex!.identifier )
            XCTAssertEqual(e.1, a.depth!)
        }
        
    }

}
