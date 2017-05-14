//
//  XALG_ADT_Heap.swift
//  XALG
//
//  Created by Juguang Xiao on 06/03/2017.
//

import Swift

protocol XALG_ADT_Heap  {
    associatedtype T
    
    var element_ : [T] { get }
    var isOrderedBefore : (T, T) -> Bool { get set }
    
//    mutating func element_append(_ t : T)
//    mutating func shiftUp(_ index: Int)
}


extension XALG_ADT_Heap {
    public var isEmpty: Bool {
        return element_.isEmpty
    }
    
    public var count: Int {
        return element_.count
    }
    public func peek() -> T? {
        return element_.first
    }
        
}
