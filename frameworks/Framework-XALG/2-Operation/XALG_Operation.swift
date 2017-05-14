//
//  XALG_Operation.swift
//  XALG
//
//  Created by Juguang Xiao on 12/03/2017.
//

import Foundation

class XALG_Operation: NSObject {

}


class XALG_Operation_Swap : XALG_Operation {
    
    var i : Int!
    var j : Int!
    
}

class XALG_Operation_Comparison : XALG_Operation {
    typealias T  = Int
    func isOrderedBefore(_ a: T,_ b: T) -> Bool {
        return false
    }
}
