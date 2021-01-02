import XCTest
import TreeTests

var tests = [XCTestCaseEntry]()
tests += TreeTests.allTests()
tests += LinkedListTests.allTests()
XCTMain(tests)
