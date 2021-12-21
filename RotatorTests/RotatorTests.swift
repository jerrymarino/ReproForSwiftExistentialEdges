//
//  RotatorTests.swift
//  RotatorTests
//
//  Created by Jerry Marino on 12/15/21.
//

import XCTest
@testable import Rotator
@testable import CPlumber

import CPlumber


public class Helper {
    var plumber: PlumberProvider

    // Uses an extestential:
    // this implicates dynamic dispatch and swift_getObjectType before calling methods
    public init(asExestential: PlumberProvider) {
        // It doesn't look up the type of `plumber()` on assignment because of performance reasons
        // however, it _sometimes_ calls swift_getObjectType prior to an objc_msgSend
        // 1. when on ARM at all times
        // 2. when the method doesn't hit some conditions internally ( e.g. without the if branch )
        self.plumber = asExestential.plumber()
        
        // Having this conditional here, disables swift_getObjectType call on asExestential
        // comment this out and it fails on intel
//        if "some" == "other" {
//            fatalError("adding something to trigger 'memset' codepath")
//        }
        
    }
    
    // This doesn't perform type lookup because it uses the class
    public init(asClass: Plumber) {
        self.plumber = asClass.plumber()
    }
}





class RotatorTests: XCTestCase {

    var value: Bool = false


    func testExample() throws {
        let nilTypedAsNonNil = Plumber().plumber()
        print(Helper(asClass: nilTypedAsNonNil)) // FINE ALWAYS

        print(Helper(asExestential: nilTypedAsNonNil)) // BAD on ARM

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
