//
//  XALG_Sort_QuickSort.swift
//  XALG
//
//  Created by Juguang Xiao on 06/03/2017.
//

import Swift
//https://github.com/between40and2/swift-algorithm-club/blob/master/Quicksort/Quicksort.swift
class XALG_Sort_QuickSort {

}



class XALG_Sort_QuickSort_partition<Element: Comparable> : XALG_Sort_base<Element> {
    
    internal func partition(_ a: inout [Element], low: Int, high : Int) -> Int {
        fatalError()
    }
    
    private func sort_lowHight(_ a: inout [Element],low: Int, high : Int) {
        guard low < high else {
            return
        }
        
        let p = partition(&a, low: low, high: high)
        sort_lowHight(&a, low: low, high: p-1)
        sort_lowHight(&a, low: p+1, high: high)
    }
    
    override func sort(_ a: inout [Element]) {
        
        sort_lowHight(&a, low: 0, high: a.count)
    }
    
    
}


class XALG_Sort_QuickSort_Lomuto<Element: Comparable> : XALG_Sort_QuickSort_partition<Element> {
    
    
    internal override func partition(_ a: inout [Element], low: Int, high : Int) -> Int {
        let pivot = a[high]
        var i = low
        for j in low..<high {
            if a[j] <= pivot {
                (a[i], a[j]) = (a[j], a[i])
                i += 1
            }
            
        }
        (a[i], a[high]) = (a[high], a[i])
        return i
    }
    
    
}

class XALG_Sort_QuickSort_Hoare<Element: Comparable> : XALG_Sort_QuickSort_partition<Element> {
    
    
    override func partition(_ a: inout [Element], low: Int, high: Int) -> Int {
        let pivot = a[low]
        var i = low - 1
        var j = high + 1
        
        while true {
            repeat { j -= 1} while a[j] > pivot
            repeat { i += 1} while a[i] < pivot
            
            if i < j {
                swap(&a[i], &a[j])
            }else {
                return j
            }
        }
    }
}
