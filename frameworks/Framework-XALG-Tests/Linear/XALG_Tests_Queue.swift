//
//  XALG_Tests_Queue.swift
//  XALG
//
//  Created by Juguang Xiao on 2/24/16.
//

import XCTest

class XALG_Tests_Queue: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_queue__array() {
        var queue = XALG_DS_Queue__Array<Int>()
        
        XCTAssertTrue(queue.isEmpty)
        XCTAssertTrue(queue.count == 0)
        queue.enqueue(1)
        XCTAssertTrue(queue.count == 1)
        queue.enqueue(2)
        XCTAssertTrue(queue.count == 2)
        XCTAssertEqual(queue.dequeue()!, 1)
        XCTAssertEqual(queue.dequeue()!, 2)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.dequeue())
        
    }
}
