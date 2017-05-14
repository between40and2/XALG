//
//  XALG_DS_Stack.swift
//  XALG
//
//  Created by Juguang Xiao on 2/24/16 (originally).
//

import Swift


struct XALG_DS_Stack__Array <Element> : XALG_ADT_Stack {
    
    typealias ElementType = Element
    
    var item_ : Array<ElementType>
    
    init() {
        item_ =  Array<ElementType>()
    }
    
    
    mutating func push(_ item: ElementType) {
        item_.append(item)
    }
    mutating func pop() -> ElementType? {
        return item_.isEmpty ? nil : item_.removeLast()
        
    }
    
    
    func top() -> ElementType? {
        if item_.count > 0 {
            return item_.last
        }else {
            return nil
        }
    }
    
    mutating func resetBottom(_ e: Element) {
        item_ = [Element]()
        push(e)
    }
    
    var count : Int {
        return item_.count
    }
}
