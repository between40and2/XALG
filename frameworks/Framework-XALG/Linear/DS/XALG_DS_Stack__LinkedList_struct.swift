//
//  XALG_DS_Stack__LinkedList_struct.swift
//  XALG
//
//  Created by Juguang Xiao on 03/03/2017.
//

import Swift

private struct XALG_Rep_LinkedNode<Element> {
    
    var element : Element
    var next : UnsafePointer<XALG_Rep_LinkedNode<Element>>?
    
    init(element e: Element, next n : UnsafePointer<XALG_Rep_LinkedNode<Element>>? = nil) {
        element = e
        next = n
    }
}


struct XALG_Rep_Stack__LinkedList_struct<Element> : XALG_ADT_Stack {
    
    typealias ElementType = Element
    
    func top() -> Element? {
        guard let p = _top else {
            return nil
        }
        
        let node = p.pointee
        return node.element
    }
    
    mutating func pop() -> Element? {
        guard let t = _top else {
            return nil
        }
        
        let node = t.pointee
        let ele = node.element
        return ele
    }
    
    mutating func push(_ item: Element) {
        var node = XALG_Rep_LinkedNode<Element>(element: item, next: _top)
        //        let p = &node
//        _top = UnsafeMutablePointer<XALG_Rep_LinkedNode<Element>>(&node)
        
        //        [].withUnsafeBufferPointer { (UnsafeBufferPointer<Any>) -> R in
        
        //        }
    }
    
    //    deinit {
    //
    //        _top!
    //    }
    
    init() {
        _top = nil
    }
    
    private var _top : UnsafeMutablePointer<XALG_Rep_LinkedNode<Element>>? = nil
}
