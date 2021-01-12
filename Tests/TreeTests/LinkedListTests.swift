import XCTest
import Tree

final class LinkedListTests: XCTestCase {
  func test_height() {
    let tree = LinkedList<Int>.node(value: 0, .init(.node(value: 1, .init(.node(value: 2, .init(.node(value: 3, .noChildren)))))))

    XCTAssertEqual(tree.height, 4)
  }

  func test_next() {
    let tree = LinkedList<Int>.node(value: 0, .init(.node(value: 1, .init(.node(value: 2, .init(.node(value: 3, .noChildren)))))))

    XCTAssertEqual(tree.next, .node(value: 1, .init(.node(value: 2, .init(.node(value: 3, .noChildren))))))
    XCTAssertEqual(tree.next?.next, .node(value: 2, .init(.node(value: 3, .noChildren))))
    XCTAssertEqual(tree.next?.next?.next, .node(value: 3, .noChildren))
    XCTAssertNil(tree.next?.next?.next?.next)
  }

  static var allTests = [
    ("test_next", test_next),
    ("test_height", test_height)
  ]
}
