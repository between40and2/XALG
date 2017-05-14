//
//  XALG_Sort.swift
//  XALG
//
//  Created by Juguang Xiao on 04/03/2017.
//

import Foundation

protocol XALG_Sort : class {
    associatedtype ElementType
    
//    https://developer.apple.com/reference/swift/array/1688499-sort
    func sort(_ a : inout [ElementType] ) -> Void
    
}

extension XALG_Sort {
    //  https://developer.apple.com/reference/swift/array/1688066-sorted
    func sorted(_ a : [ElementType]) -> [ElementType] {
        
        var array_internal = a
        
        sort(&array_internal)
        return array_internal
        
    }
}

class XALG_Sort_base <Element: Comparable> : NSObject, XALG_Sort {

    typealias ElementType = Element
    
    var block_beginRound : XALG_Block_Int?
    var block_endRound : ((Int, [Element]) -> Void)?
    var block_step : XALG_Block_Int_Int?
    
    override init() {
        super.init()
        
    }
    
    
    func sort(_ a: inout [Element]) -> Void {
        fatalError()
    }
    
}



typealias XALG_Block_Void = (Void) -> Void
typealias XALG_Block_Int = (Int) -> Void
typealias XALG_Block_Int_Int = (Int, Int) -> Void
