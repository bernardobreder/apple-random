//
//  RandomTests.swift
//  Random
//
//  Created by Bernardo Breder.
//
//

import XCTest
@testable import RandomTests

extension RandomTests {

	static var allTests : [(String, (RandomTests) -> () throws -> Void)] {
		return [
			("test", test),
		]
	}

}

XCTMain([
	testCase(RandomTests.allTests),
])

