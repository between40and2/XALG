//
//  XALG_FSLoader_Graph__linebased.swift
//  XALG
//
//  Created by Juguang Xiao on 12/04/2017.
//

import Foundation

class XALG_FSLoader_Graph__linebased: NSObject {

    func linesFromTxtFile(_ filename : String) -> [String] {
        
        
        let b = Bundle(for: type(of: self))
        let url = b.url(forResource: filename, withExtension: "txt")!
        let str = try! String(contentsOf: url)
        var line_ = [String]()
        str.enumerateLines { (s: String, stop: inout Bool) in
            line_.append(s)
        }
        return line_
    }
    
}


class XALG_Encoder_Graph__linebased : NSObject {
    
  
    
}

class _XALG_Decoder__linebased : NSObject {
    
    
    var inputLine_ : [String]?
    
    enum Separator {
        case whitespace
        case character(String)
    }
    
    var sep =  Separator.whitespace
    
    
    func breakLineIntoSeguments(_ line: String) -> [String] {
        
        let raw_ : [String]
        switch self.sep {
        case .whitespace:
            raw_ =  line.components(separatedBy: CharacterSet.whitespaces)
        case .character(let s) :
            raw_ =  line.components(separatedBy: s)
        }
        
        return
            raw_.map { $0.trimmingCharacters(in: CharacterSet.whitespaces) }.filter{ $0.characters.count > 0 }
        
    }
    
}


enum XALG_Enum_Graph_Weightness <Weight : XALG_WeightType> {
    case weighted(Weight)
    case unweighed
}

