import TreeTests
import XCTest

var tests = [XCTestCaseEntry]()
tests += TreeTests.allTests()
tests += LinkedListTests.allTests()
XCTMain(tests)
