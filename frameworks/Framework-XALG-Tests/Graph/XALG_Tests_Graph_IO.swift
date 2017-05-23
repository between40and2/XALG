//
//  XALG_Tests_Graph_IO.swift
//  XALG
//
//  Created by Juguang Xiao on 25/03/2017.
//

import XCTest

/*
 a1 - b
 a2 - b
 b - (20) - c
*/

class XALG_Tests_Graph_datafromfile : XCTestCase {

    private let fsloader = XALG_FSLoader_Graph__linebased()
    
    func loadFromTxtfile_directed_weighted_stringAsVertex_intAsEdge(_ filename : String) -> XALG_Rep_Graph_Weighted<String, Int>? {
        let line_ = fsloader.linesFromTxtFile(filename)
        
        let decoder = XALG_Decoder_Graph__linebased<String, Int>()
        
        decoder.callback_identifierFromSymbol = { return $0 }
        decoder.callback_weightFromSymbol = { return Int($0) ?? 0 }
        
        decoder.weightness = XALG_Enum_Graph_Weightness<Int>.weighted(1)
        decoder.isDirected = true
        decoder.sep = .character("-")
        
        decoder.inputLine_ = line_
        
        try! decoder.decode()
        
        guard let g = decoder.graph_weighted else{
            
            XCTAssert(false)
            return nil
        }
        
        return g
    }
    
    func loadFromTxtfile_undirected_unweighted_stringAsVertex(_ filename: String) -> XALG_Rep_Graph<String>? {
        let line_ = fsloader.linesFromTxtFile(filename)
        
        // fix-it, unweighted does not need WeightType, here Int.
        let decoder = XALG_Decoder_Graph__linebased<String, Int>()
        decoder.callback_identifierFromSymbol = { return $0 }
        decoder.weightness = XALG_Enum_Graph_Weightness<Int>.unweighed
        
        decoder.sep = .character("-")
        decoder.inputLine_ = line_
        
        try! decoder.decode()
        
        guard let g = decoder.graph else {
            XCTAssert(false)
            return nil
        }
        return g
    }
}

class XALG_Tests_Graph_IO: XALG_Tests_Graph_datafromfile {
    
    typealias VertexType = XALG_DS_GraphVertex<String>
    
    func test_loadLinebased() {
        
        guard let g = loadFromTxtfile_directed_weighted_stringAsVertex_intAsEdge("data-graph") else {
            XCTAssert(false)
            return
        }

        print(g.vertex_.count)
        print(g.edge_.count)
        
        for v in g.vertex_ {
            print(v.identifier)
        }
        
        for e  in g.edge_ {
            let e_w = e as! XALG_DS_GraphEdge_Weight< VertexType,  Int>
            
            print(e_w.weight, e_w.vertex_[0].identifier)
        }
        
        let e_ = g.edge_.filter {
            let e_w = $0 as! XALG_DS_GraphEdge_Weight< VertexType,  Int>
            
            return e_w.weight == 20 && e_w.vertex_[0].identifier == "b" &&  e_w.vertex_[1].identifier == "c"
        }
        
        XCTAssert(e_.count == 1)
        
    }
}
