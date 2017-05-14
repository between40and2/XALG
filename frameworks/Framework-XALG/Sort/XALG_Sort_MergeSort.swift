//
//  XALG_Sort_MergeSort.swift
//  XALG
//
//  Created by Juguang Xiao on 06/03/2017.
//

import Swift
//https://github.com/between40and2/swift-algorithm-club/blob/master/Merge%20Sort/MergeSort.swift
// HighEducationPress book, 7.3.3, p241

class XALG_Sort_MergeSort {
    
    //    var isOrderedBefore: ((T, T) -> Bool)?
    
    func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    private func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedPile = [T]()
        
        func leftForward() {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        func rightForward() {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        if orderedPile.capacity < leftPile.count + rightPile.count {
            orderedPile.reserveCapacity(leftPile.count + rightPile.count)
        }
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                leftForward()
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                rightForward()
            } else {
                leftForward()
                rightForward()
            }
        }
        
        while leftIndex < leftPile.count {
            leftForward()
        }
        while rightIndex < rightPile.count {
            rightForward()
        }
        return orderedPile
    }
}
