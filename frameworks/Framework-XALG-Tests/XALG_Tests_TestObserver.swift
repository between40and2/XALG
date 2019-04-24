//
//  XALG_Tests_TestObserver.swift
//  XALG
//
//  Created by Juguang Xiao on 17/05/2017.
//

import XCTest

// https://developer.apple.com/videos/play/wwdc2016/409/
// https://developer.apple.com/reference/xctest/xctestobservationcenter
// https://developer.apple.com/reference/xctest/xctestobservation
class XALG_Tests_TestObserver: NSObject, XCTestObservation {

    override init() {
        super.init()
        
        XCTestObservationCenter.shared.addTestObserver(self)
        
    }
    
    
    func testBundleWillStart(_ testBundle: Bundle) {
        print("testBundleWillStart")
    }
    
    func testSuiteWillStart(_ testSuite: XCTestSuite) {
        print("testSuiteWillStart")
    }
    
    
    func testSuiteDidFinish(_ testSuite: XCTestSuite) {
        
    }
    
    func testBundleDidFinish(_ testBundle: Bundle) {
        
    }
    
}
