//
//  XALG_DS_Queue__Array.swift
//  XALG
//
//  Created by Juguang Xiao on 2/24/16 (originally).
//

import Swift


struct XALG_DS_Queue__Array <Element> : XALG_ADT_Queue {
    typealias ElementType = Element
    
    fileprivate var item_ = Array<Element>()
    
    var internalArray : Array<Element> { return item_ }
    
    mutating func enqueue(_ item : ElementType) {
        item_.append(item)
    }
    
    mutating func dequeue() -> ElementType? {
        return item_.isEmpty ? nil : item_.removeFirst()
    }
    
    var count : Int {
        return item_.count
    }
    var isEmpty : Bool { return item_.count == 0 }
}

