//
//  XALG_Rep_PriorityQueue__CFBinaryHeap.swift
//  XALG
//
//  Created by Juguang Xiao on 03/03/2017.
//

import CoreFoundation
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Priority%20Queue

class XALG_Rep_PriorityQueue__CFBinaryHeap: NSObject {

}



//class XALG_PriorityQueue<Type>: NSObject {
//
//    class Element<Type> : NSObject {
//        var priority : Int = 0
//        var content : Type!
//    }
//
//
////    let heap : CFBinaryHeapRef
//}


class Task : Comparable, CustomStringConvertible {
    var priority : Int
    var name: String
    init(priority: Int, name: String) {
        self.priority = priority
        self.name = name
    }
    var description: String {
        
        return "\(priority), \(name)"
    }
}
func ==(t1: Task, t2: Task) -> Bool {
    return t1.priority == t2.priority
}
func <(t1: Task, t2: Task) -> Bool {
    return t1.priority < t2.priority
}
//
//struct TaskPriorityQueue {
//    let heap : CFBinaryHeap = {
//        var callBacks = CFBinaryHeapCallBacks(version: 0, retain: {
//             Unmanaged<Task>.fromOpaque( OpaquePointer($1)).retain()
//        }, release: {
//            Unmanaged<Task>.fromOpaque(OpaquePointer($1)).release()
//        }, copyDescription: nil, compare: { (ptr1, ptr2, _) in
//            let t1 : Task = Unmanaged<Task>.fromOpaque(COpaquePointer(ptr1)).takeUnretainedValue()
//            let t2 : Task = Unmanaged<Task>.fromOpaque(COpaquePointer(ptr2)).takeUnretainedValue()
//            return t1 == t2 ? CFComparisonResult.CompareEqualTo : t1 < t2 ? CFComparisonResult.CompareLessThan : CFComparisonResult.CompareGreaterThan
//        })
//        return CFBinaryHeapCreate(nil, 0, &callBacks, nil)
//    }()
//    var count : Int { return CFBinaryHeapGetCount(heap) }
//    mutating func push(t: Task) {
//        CFBinaryHeapAddValue(heap, UnsafePointer(Unmanaged.passUnretained(t).toOpaque()))
//    }
//    func peek() -> Task {
//        return Unmanaged<Task>.fromOpaque(CFBinaryHeapGetMinimum(heap)).takeUnretainedValue()
//    }
//    mutating func pop() -> Task {
//        let result = Unmanaged<Task>.fromOpaque(OpaquePointer(CFBinaryHeapGetMinimum(heap))).takeUnretainedValue()
//        CFBinaryHeapRemoveMinimumValue(heap)
//        return result
//    }
//}
