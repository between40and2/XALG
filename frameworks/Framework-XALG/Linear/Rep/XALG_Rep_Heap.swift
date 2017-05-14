//
//  XALG_Rep_Heap.swift
//  XALG
//
//  Created by Juguang Xiao on 06/03/2017.
//

import Swift
// https://github.com/between40and2/swift-algorithm-club/blob/master/Heap/Heap.swift
struct XALG_Rep_Heap<Type>: XALG_ADT_Heap {
    typealias  T = Type
    fileprivate var _element_ = [T]()
    
    var element_ : [T] {
        return _element_
    }
    var isOrderedBefore : (T, T) -> Bool
    
    init(_ sort : @escaping (T, T) -> Bool) {
        isOrderedBefore = sort
    }
    
    fileprivate mutating func buildHeap(fromArray array: [T]) {
        _element_ = array
        for i in stride(from: (element_.count/2 - 1), through: 0, by: -1) {
            shiftDown(i, heapSize: _element_.count)
        }
    }
    
    @inline(__always) func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    @inline(__always) func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    
    @inline(__always) func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = element_[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && isOrderedBefore(child, element_[parentIndex]) {
            _element_[childIndex] = element_[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        _element_[childIndex] = child
    }
    
    mutating func shiftDown() {
        shiftDown(0, heapSize: element_.count)
    }
    
    mutating func shiftDown(_ index: Int, heapSize: Int) {
        var parentIndex = index
        
        while true {
            let leftChildIndex = self.leftChildIndex(ofIndex: parentIndex)
            let rightChildIndex = leftChildIndex + 1
            
            // Figure out which comes first if we order them by the sort function:
            // the parent, the left child, or the right child. If the parent comes
            // first, we're done. If not, that element is out-of-place and we make
            // it "float down" the tree until the heap property is restored.
            var first = parentIndex
            if leftChildIndex < heapSize && isOrderedBefore(element_[leftChildIndex], element_[first]) {
                first = leftChildIndex
            }
            if rightChildIndex < heapSize && isOrderedBefore(element_[rightChildIndex], element_[first]) {
                first = rightChildIndex
            }
            if first == parentIndex { return }
            
            swap(&_element_[parentIndex], &_element_[first])
            parentIndex = first
        }
    }
}

extension XALG_Rep_Heap{
    public mutating func insert(_ value: T) {
        _element_.append(value)
        shiftUp(element_.count - 1)
    }
    
    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }

    public mutating func replace(index i: Int, value: T) {
        guard i < element_.count else { return }
        
        assert(isOrderedBefore(value, element_[i]))
        _element_[i] = value
        shiftUp(i)
    }
    @discardableResult public mutating func remove() -> T? {
        if element_.isEmpty {
            return nil
        } else if element_.count == 1 {
            return _element_.removeLast()
        } else {
            // Use the last node to replace the first one, then fix the heap by
            // shifting this new first node into its proper position.
            let value = element_[0]
            _element_[0] = _element_.removeLast()
            shiftDown()
            return value
        }
    }
    public mutating func removeAt(_ index: Int) -> T? {
        guard index < element_.count else { return nil }
        
        let size = element_.count - 1
        if index != size {
            swap(&_element_[index], &_element_[size])
            shiftDown(index, heapSize: size)
            shiftUp(index)
        }
        return _element_.removeLast()
    }
    

}

extension XALG_Rep_Heap where T: Equatable {
    /**
     * Searches the heap for the given element. Performance: O(n).
     */
    func index(of element: T) -> Int? {
        return index(of: element, 0)
    }
    
    fileprivate func index(of element: T, _ i: Int) -> Int? {
        if i >= count { return nil }
        if isOrderedBefore(element, element_[i]) { return nil }
        if element == element_[i] { return i }
        if let j = index(of: element, self.leftChildIndex(ofIndex: i)) { return j }
        if let j = index(of: element, self.rightChildIndex(ofIndex: i)) { return j }
        return nil
    }
}

//https://github.com/between40and2/swift-algorithm-club/blob/master/Heap%20Sort/HeapSort.swift

extension XALG_Rep_Heap {
    public mutating func sort() -> [T] {
        for i in stride(from: (element_.count - 1), through: 1, by: -1) {
            swap(&_element_[0], &_element_[i])
            shiftDown(0, heapSize: i)
        }
        return element_
    }
}
