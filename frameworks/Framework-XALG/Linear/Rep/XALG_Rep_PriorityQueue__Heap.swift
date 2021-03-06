//
//  XALG_Rep_PriorityQueue__Heap.swift
//  XALG
//
//  Created by Juguang Xiao on 03/03/2017.
//

import Swift

// https://en.wikipedia.org/wiki/Priority_queue

/*
 There are at least 2 ways to specify the priority of each element.
 
 - using external sorter to tell which one of any two element has higher priority. this below is in such way.
 - element comes with its priority in pair as input. the priority may be part of element or it comes with element side by side.
 */
struct XALG_Rep_PriorityQueue__Heap<Type> : XALG_ADT_PriorityQueue {
    
    
    typealias T = Type
    
    private var heap : XALG_Rep_Heap<T>
    
    init(sort : @escaping (T, T) -> Bool) {
        heap = XALG_Rep_Heap<T>(sort)
    }
    
    func peak() -> Type? {
        
        fatalError()
//        return peak()
    }
    
    var count: Int { return heap.count }
    
    var isEmpty: Bool { return heap.isEmpty }
    
    
    
    mutating func enqueue(_ element: Type) {
        heap.insert(element)
    }
    
    mutating func dequeue() -> Type? {
        return heap.remove()
    }
    
    mutating func changePriority(index i: Int, value: Type) {
        heap.replace(index: i, value: value)
    }
}
