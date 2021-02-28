import XCTest

#if !canImport(ObjectiveC)
  public func allTests() -> [XCTestCaseEntry] {
    return [
      testCase(TreeTests.allTests + LinkedListTests.allTests),
    ]
  }
#endif
