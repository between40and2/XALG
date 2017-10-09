//
//  XALG_Sort_ShellSort.swift
//  XALG
//
//  Created by Juguang Xiao on 06/03/2017.
//
import Swift

//https://github.com/between40and2/swift-algorithm-club/tree/master/Shell%20Sort
class XALG_Sort_ShellSort<Element: Comparable> : XALG_Sort_base<Element> {
    
    
    override func sort(_ array: inout [Element]) {
        var subCount =  array.count / 2
        var k = 0
        while subCount > 0 {
            for i in 0..<array.count {
                guard i + subCount < array.count else{
                    break
                }
                
                if array[i] > array[i+subCount] {
                    array.swapAt(i, i+subCount)
//                    swap(&array[i], &array[i+subCount] )
                }
                guard  subCount == 1 && i > 0 else {
                    continue
                }
                if array[i-1] > array[i] {
                    array.swapAt(i-1, i)
//                    swap(&array[i-1], &array[i])
                }
            }
            
            subCount = subCount / 2
            
            block_endRound?(k, array)
            
            k += 1
        }
    }
    
}
