import Tree
import XCTest

final class TreeTests: XCTestCase {
  func test_value_get() {
    let tree = IntLinkedList.leaf(0)

    XCTAssertEqual(tree.value, 0)
  }

  func test_value_set() {
    var tree = IntLinkedList.node(value: 0, .noDescendent)

    tree.value = 1

    XCTAssertEqual(tree, .leaf(1))
  }

  func test_descendent_get() {
    let tree = IntLinkedList.node(value: 0, .init(.leaf(1)))

    XCTAssertEqual(tree.descendent, .init(.leaf(1)))
  }

  func test_descendent_set() {
    var tree = IntLinkedList.node(value: 0, .init(.leaf(1)))

    tree.descendent = .noDescendent

    XCTAssertEqual(tree, .node(value: 0, .noDescendent))
  }

  func test_height() {
    let tree = IntLinkedList.node(value: 0, .init(.leaf(1)))

    XCTAssertEqual(tree.height, 2)
  }

  static var allTests = [
    ("test_value_get", test_value_get),
    ("test_value_set", test_value_set),
    ("test_descendent_get", test_descendent_get),
    ("test_descendent_set", test_descendent_set),
    ("test_height", test_height),
  ]
}
