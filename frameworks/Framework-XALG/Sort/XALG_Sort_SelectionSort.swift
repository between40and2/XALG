//
//  XALG_Sort_SelectionSort.swift
//  XALG
//
//  Created by Juguang Xiao on 05/03/2017.
//

import Swift
// https://github.com/between40and2/swift-algorithm-club/blob/master/Selection%20Sort/SelectionSort.swift
class XALG_Sort_SelectionSort<Element: Comparable> : XALG_Sort_base<Element> {
    
    override func sort(_ array: inout [Element]) -> Void {
        guard  array.count > 1 else {
            return
            //            return array
        }
        
        for i in 0..<array.count-1 {
            var lowest = i
            for j in i+1 ..< array.count {
                if array[j] < array[lowest] {
                    lowest = j
                }
            }
            
            if i != lowest {
                swap(&array[i], &array[lowest])
            }
            
            block_endRound?(i, array)
            
        }
        
    }
}
