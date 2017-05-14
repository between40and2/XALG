//
//  XALG_Sort_MergeSort__iterative.swift
//  XALG
//
//  Created by Juguang Xiao on 06/03/2017.
//

import Swift

class XALG_Sort_MergeSort__iterative{
    /*
     This is an iterative bottom-up implementation. Instead of recursively splitting  up the array into smaller sublists, it immediately starts merging the individual  array elements.
     As the algorithm works its way up, it no longer merges individual elements but  larger and larger subarrays, until eventually the entire array is merged and   sorted.
     To avoid allocating many temporary array objects, it uses double-buffering with   just two arrays.
     */
    func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
        let n = a.count
        var z = [a, a]   // the two working arrays
        var d = 0        // z[d] is used for reading, z[1 - d] for writing
        var width = 1
        while width < n {
            
            var i = 0
            while i < n {
                
                var j = i
                var l = i
                var r = i + width
                
                let lmax = min(l + width, n)
                let rmax = min(r + width, n)
                
                while l < lmax && r < rmax {
                    if isOrderedBefore(z[d][l], z[d][r]) {
                        z[1 - d][j] = z[d][l]
                        l += 1
                    } else {
                        z[1 - d][j] = z[d][r]
                        r += 1
                    }
                    j += 1
                }
                while l < lmax {
                    z[1 - d][j] = z[d][l]
                    j += 1
                    l += 1
                }
                while r < rmax {
                    z[1 - d][j] = z[d][r]
                    j += 1
                    r += 1
                }
                
                i += width*2
            }
            
            width *= 2   // in each step, the subarray to merge becomes larger
            d = 1 - d    // swap active array
        }
        return z[d]
    }
}
