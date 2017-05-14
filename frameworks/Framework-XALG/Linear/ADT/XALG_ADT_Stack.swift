//
//  XALG_ADT_Stack.swift
//  XALG
//
//  Created by Juguang Xiao on 2/24/16.
//

import Swift

protocol XALG_ADT_Stack  {

    associatedtype ElementType
    
    mutating func push(_ item: ElementType)
    mutating func pop() -> ElementType?
    
    func top() -> ElementType?
}

