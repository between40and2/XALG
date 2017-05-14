//
//  XALG_ADT_PriorityQueue.swift
//  XALG
//
//  Created by Juguang Xiao on 03/03/2017.
//

import Swift


protocol XALG_ADT_PriorityQueue {
    associatedtype T
    
    var isEmpty : Bool { get }
    var count : Int { get }
    func peak() -> T?
    mutating func enqueue(_ element : T)
    
    mutating func dequeue() -> T?
    
    mutating func changePriority(index i : Int, value: T)
    
    init(sort : @escaping (T, T) -> Bool)
}


