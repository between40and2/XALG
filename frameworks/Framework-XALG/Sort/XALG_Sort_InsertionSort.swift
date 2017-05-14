//
//  XALG_Sort_InsertionSort.swift
//  XALG
//
//  Created by Juguang Xiao on 05/03/2017.
//

import Swift

class XALG_Sort_InsertionSort<Element: Comparable> : XALG_Sort_base<Element>  {
    
    override func sort(_ array: inout [Element]) -> Void {
        for i in 1..<array.count {
            block_beginRound?(i)
            let temp = array[i]
            var j  : Int = i
            //            for j in (0...i).reversed() {
            while j > 0 && temp > array[j-1] {
                
                array[j] = array[j-1]
                j -= 1
                
            }
            //            if i != j_last {  }
            array[j] = temp
            block_endRound?(i, array )
        }
        
    }
    
    //    var array : [Element]?
    
    var original : [Element]?
    //    func work(array: inout [Element]) {
    //
    //
    //
    //    }
    //    func workOnArray<T: Comparable> (input : [T]) {
    //
    //    }
    
}

// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Insertion%20Sort
extension Array {
    
    mutating func sort_insert( by areInIncreasingOrder: (Element, Element) -> Bool)// -> [Element] {
    {
        //        var j : Int = 0
        for i in 1..<count {
            let temp = self[i]
            var j  : Int = i
            //            for j in (0...i).reversed() {
            while j > 0 && areInIncreasingOrder(temp, self[j-1]) {
                
                self[j] = self[j-1]
                j -= 1
                
            }
            //            if i != j_last {  }
            self[j] = temp
        }
    }
}
