//
//  GKRandomSource+XALG.swift
//  XALG
//
//  Created by Juguang Xiao on 05/03/2017.
//

import GameplayKit
extension  GKRandomSource {
    func intArray(count: Int, upperBound: Int = 100) -> [Int] {
        let range = 0..<count
        let int_ = range.map { (i: Int) -> Int in  return self.nextInt(upperBound: upperBound) }
        
        print (int_)
        return int_
    }
}
