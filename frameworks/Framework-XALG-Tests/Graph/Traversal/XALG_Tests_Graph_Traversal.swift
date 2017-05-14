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
            print($0.vertex!.identifier)
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
    
    func test_BFS() {
        let bfs = XALG_Algo_Graph_BFS<G>()
        bfs.graph = _graph
        bfs.startVertex = _graph!.vertex(identifier: "v1")
        bfs.callback_visit = {
            print($0.vertex!.identifier)
        }
        try! bfs.travel()
    }
    /*v1
     v2
     v3
     v4 (v5)
     v6 (v7)
     v8
     v9
     */
}
