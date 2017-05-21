//
//  XALG_Tests_Heap.swift
//  XALG
//
//  Created by Juguang Xiao on 17/03/2017.
//

import XCTest

class XALG_Tests_Heap: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_minHeap() {
        var  h = XALG_Rep_Heap<Int>( < )
        
        h.insert(2)
        h.insert(3)
        h.insert(1)
        
        XCTAssert(h.remove()! == 1)
        XCTAssert(h.remove()! == 2)
        XCTAssert(h.remove()! == 3)
        XCTAssertNil(h.remove())
    }
    
    func test_maxHeap() {
        var  h = XALG_Rep_Heap<Int>( > )
        
        h.insert(2)
        h.insert(3)
        h.insert(1)
        
   
        XCTAssert(h.remove()! == 3)
        XCTAssert(h.remove()! == 2)
        XCTAssert(h.remove()! == 1)
        XCTAssertNil(h.remove())
        
    }
    
}
