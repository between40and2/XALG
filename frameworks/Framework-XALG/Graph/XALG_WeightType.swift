//
//  XALG_WeightType.swift
//  XALG
//
//  Created by Juguang Xiao on 26/03/2017.
//

import Swift

protocol XALG_WeightType : Comparable{
    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static var max : Self { get }
    static var min : Self { get }
    static var zero: Self { get }
}

extension Double : XALG_WeightType {
    static var min: Double {
        return -Double.infinity
    }
    
    static var max: Double {
        return Double.infinity
    }
    
    static var zero : Double {
        return 0.0
    }
    
}
extension Int : XALG_WeightType {
    static var zero: Int {
        return 0
    }
    
}
