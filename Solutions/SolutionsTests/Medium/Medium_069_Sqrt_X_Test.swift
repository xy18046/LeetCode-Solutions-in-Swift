//
//  Medium_069_Sqrt_X_Test.swift
//  Solutions
//
//  Created by Di Wu on 7/23/15.
//  Copyright © 2015 diwu. All rights reserved.
//

import XCTest

class Medium_069_Sqrt_X_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: Int = 9
        let expected: Int = 3
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: Int = 0
        let expected: Int = 0
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: Int = 5
        let expected: Int = 2
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: Int = Int(sqrt(Double(Int.max)))
        let expected: Int = Int(sqrt(sqrt(Double(Int.max))))
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: Int, expected: Int) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Medium_069_Sqrt_X.mySqrt(input)
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
