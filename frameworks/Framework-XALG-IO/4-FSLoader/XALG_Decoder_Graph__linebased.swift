//
//  XALG_Decoder_Graph__linebased.swift
//  XALG
//
//  Created by Juguang Xiao on 24/04/2017.
//

import Swift
import Foundation

enum XALG_Error_Decoder_Graph : Error {
    
}

protocol _XALG_Decoder_Graph {
    func decode() throws
}

class XALG_Decoder_Graph__linebased<VertexIdentifier , Weight > : _XALG_Decoder__linebased
    where VertexIdentifier : Hashable, Weight : XALG_WeightType
{
    
    var weightness : XALG_Enum_Graph_Weightness = XALG_Enum_Graph_Weightness<Weight>.unweighed
    
    private var isWeighted : Bool {
        switch weightness {
        case .unweighed: return false
        case .weighted( _) : return true
        }
    }
    var isDirected : Bool = false
    
    private var g : XALG_Rep_Graph<VertexIdentifier>?
    private var g_w : XALG_Rep_Graph_Weighted<VertexIdentifier, Weight>?
    
    var graph : XALG_Rep_Graph<VertexIdentifier>? {
        return g
    }
    
    var graph_weighted : XALG_Rep_Graph_Weighted<VertexIdentifier, Weight>? {
        return g_w
    }
    
    func decode() throws {
        
        switch weightness {
        case .unweighed:
            g = XALG_Rep_Graph<VertexIdentifier>(directed: isDirected)
        case .weighted(let w ):
            g_w  = XALG_Rep_Graph_Weighted<VertexIdentifier, Weight>(directed: isDirected)
            g_w?.defaultWeight = w
        }
        
        for l in inputLine_! {
            
            let _ = try processLine(l)
            
        }
        
    }
    
    var callback_identifierFromSymbol : ((String) -> VertexIdentifier)?
    
    private func vertexSymbol(_ str : String) -> VertexIdentifier {
        if let callback = callback_identifierFromSymbol {
            return callback(str)
        }else {
            fatalError()
        }
    }
    
    var callback_weightFromSymbol : ((String) -> Weight)?
    
    private func weightSymbol(_ str: String) -> Weight {
        if let callback = callback_weightFromSymbol {
            return callback(str)
        }
        fatalError()
    }
    
    private func processLine(_ str: String) throws -> Any? {
        
        let c_ =  breakLineIntoSeguments(str)
        //        guard  c_.count > 0 else {
        //            return nil
        //        }
        
        switch c_.count {
        case 0: return nil
            
        case 1: // single vertex
            try self.branch_1(c_[0], isWeighted: isWeighted)
        case 2: // 2 vertices, no edge weight
            try self.branch_2(c_, isWeighted: isWeighted)
        case 3 :
            if self.isWeighted {
                try self.branch_weighted_3(c_)
            }else {
                fatalError()
            }
            
        default: break
        }
        
        return nil
    }
    private func branch_1(_ c : String, isWeighted: Bool ) throws -> Void {
        
    }
    private func branch_2(_ c_ : [String], isWeighted : Bool) throws -> Void {
        
        let gg = isWeighted ? g_w! : g!
        
        let s0 = vertexSymbol(c_[0])
        let v0 = try gg.findOrCreateVertex(identifier: s0)
        let s1 = vertexSymbol(c_[1])
        let v1 = try gg.findOrCreateVertex(identifier: s1)
        
        if isWeighted { 
//            let _ = try g_w?.addEdge(between: v0, and: v1)
            let _ = try g_w?.addEdge(from: v0, to: v1)
        }else {
            let _ = try g?.addEdge(between: v0, and: v1)
        }
    }
    
    private func branch_weighted_3(_ c_ : [String]) throws {
        let cs_brackets = CharacterSet(charactersIn: "()")
        let weight_str = c_[1].trimmingCharacters(in: cs_brackets)
        let w = weightSymbol(weight_str)
        
        let s0 = vertexSymbol(c_[0])
        let v0 = try g_w!.findOrCreateVertex(identifier: s0 )
        let s1 = vertexSymbol(c_[2])
        let v1 = try g_w!.findOrCreateVertex(identifier: s1)
        
        //            let w =
        
        let _ = try! g_w?.addEdge(between: v0, and: v1, weight: w)
    }
    
}
