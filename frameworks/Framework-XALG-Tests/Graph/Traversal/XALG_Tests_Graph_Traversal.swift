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
    
    private let expected_DFS_ : [String] = [
       
        
    ]
    
    func test_DFS() {
        
        let dfs = XALG_Algo_Graph_DFS<G>()
        dfs.usesRecursion = false 
        dfs.graph = _graph
        dfs.startVertex = _graph!.vertex(identifier: "v1")
        dfs.callback_visit = {
            print($0.vertex!.identifier, $0.depth ?? -1)
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
    class Level {
        var queue = Array<String>()
        var index : Int = 0
        
        init(index i: Int) {
            index = i
        }
    }
    func test_LevelBFS() {
        
        var expected_index_level_ = Dictionary<Int, Level>()
        
        expected_.forEach {
            
            var l_ = expected_index_level_[ $0.1 ] ??  Level(index: $0.1)
            
            l_.queue.append($0.0)
            
            expected_index_level_[ $0.1 ] = l_
        }
        // po index_level_.sorted{$0.0.key < $0.1.key }.map { ( $0.key , $0.value.queue.count )}
        
        let expected_level =
        expected_index_level_.sorted{$0.0.key < $0.1.key }.map { ( $0.key , $0.value.queue.count )}
        
//        let expected_index_level_ = 
        
        print(expected_level)
        
        let level_bfs = XALG_Algo_Graph_LevelBFS<G>()
        level_bfs.graph =  _graph
        level_bfs.startVertex = _graph!.vertex(identifier: "v1")
        
        try! level_bfs.travel()
        
        let actual_level_ = level_bfs.level_
        
        
        // Now Comparison
        XCTAssertEqual(expected_index_level_.count, actual_level_.count)
        
        actual_level_.forEach {
            
            let l = expected_index_level_[$0.index]!
            
            XCTAssertEqual(l.index, $0.index)
            XCTAssertEqual(l.queue.count,  $0.queue.count)
            for i in 0..<l.queue.count {
                XCTAssertEqual(l.queue[i], $0.queue.internalArray[i].identifier)
            }
            
//            print($0.index, $0.queue.count)
        }
        
    }
}
