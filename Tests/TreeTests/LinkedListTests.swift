import Tree
import XCTest

final class LinkedListTests: XCTestCase {
  private typealias IntLinkedList = LinkedList<Int>

  func test_height() {
    let tree = IntLinkedList.node(value: 0, .init(.node(value: 1, .init(.node(value: 2, .init(.leaf(3)))))))

    XCTAssertEqual(tree.height, 4)
  }

  func test_next() {
    let tree = IntLinkedList.node(value: 0, .init(.node(value: 1, .init(.node(value: 2, .init(.leaf(3)))))))

    XCTAssertEqual(tree.next, .init([1, 2, 3]))
    XCTAssertEqual(tree.next.next, .init([2, 3]))
    XCTAssertEqual(tree.next.next.next, .init([3]))
    XCTAssertEqual(tree.next.next.next.next, .empty)
  }

  func test_insert_node() {
    let tree = IntLinkedList.node(value: 0, .init(.leaf(1)))

    XCTAssertEqual(tree.insert(2), .init([0, 1, 2]))
  }

  func test_insert_empty() {
    let tree = IntLinkedList.empty

    XCTAssertEqual(tree.insert(2), .init([2]))
    XCTAssertEqual(tree.insert(2).insert(3), .init([2, 3]))
  }

  func test_insert_empty_array_literal() {
    XCTAssertEqual(.init([]), IntLinkedList.empty)
  }

  func test_inserting_empty() {
    var tree = IntLinkedList.empty
    tree.inserting(2)

    XCTAssertEqual(tree, .init([2]))

    tree.inserting(3)
    XCTAssertEqual(tree, .init([2, 3]))
  }

  func test_insert_value() {
    let tree = IntLinkedList.empty.insert(1)

    XCTAssertEqual(tree.value, 1)
  }

  func test_insert_children() {
    let tree = IntLinkedList.empty.insert(1)

    XCTAssertEqual(tree.descentent, .init(.empty))
  }

  static var allTests = [
    ("test_next", test_next),
    ("test_height", test_height),
    ("test_insert_node", test_insert_node),
    ("test_insert_empty", test_insert_empty),
    ("test_insert_empty_array_literal", test_insert_empty_array_literal),
    ("test_inserting_empty", test_inserting_empty),
    ("test_insert_value", test_insert_value),
    ("test_insert_children", test_insert_children),
  ]
}
