//
//  XALG_ADT_Queue.swift
//  XALG
//
//  Created by Juguang Xiao on 2/24/16.
//

protocol XALG_ADT_Queue {
    associatedtype ElementType
    mutating func dequeue() -> ElementType?
    mutating func enqueue(_ item : ElementType)
    var isEmpty : Bool { get }
}

