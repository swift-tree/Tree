import XCTest

#if !canImport(ObjectiveC)
  public func allTests() -> [XCTestCaseEntry] {
    [
      testCase(TreeTests.allTests + LinkedListTests.allTests),
    ]
  }
#endif
