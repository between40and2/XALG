//
//  XALG_Tests_Stack.swift
//  XALG
//
//  Created by Juguang Xiao on 2/24/16.
//

import XCTest

class XALG_Tests_Stack: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_stack_array() {
        
        var stack = XALG_DS_Stack__Array<Int>()
        
        stack.push(1)
        stack.push(2)
        
//        if let i2 = stack.pop() {
//            
//        }
        
        XCTAssertEqual(stack.pop()!, 2)
        XCTAssertEqual(stack.pop()!, 1)
        XCTAssertNil(stack.pop())
        
    }
}
