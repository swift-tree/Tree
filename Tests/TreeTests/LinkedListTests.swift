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

  func test_insert_node() {
    let tree = LinkedList<Int>.node(value: 0, .init(.node(value: 1, .noChildren)))

    XCTAssertEqual(tree.insert(2), .node(value: 0, .init(.node(value: 1,  .init(.node(value: 2, .noChildren))))))
  }

  func test_insert_empty() {
    let tree = LinkedList<Int>.empty

    XCTAssertEqual(tree.insert(2), .node(value: 2, .noChildren))
    XCTAssertEqual(tree.insert(2).insert(3), .node(value: 2, .init(.node(value: 3,  .noChildren))))
  }

  func test_insert_value() {
    let tree = LinkedList<Int>.empty.insert(1)

    XCTAssertEqual(tree.value, 1)
  }

  func test_insert_children() {
    let tree = LinkedList<Int>.empty.insert(1)

    XCTAssertEqual(tree.children, .init(.empty))
  }

  static var allTests = [
    ("test_next", test_next),
    ("test_height", test_height),
    ("test_insert_node", test_insert_node),
    ("test_insert_empty", test_insert_empty)
  ]
}
