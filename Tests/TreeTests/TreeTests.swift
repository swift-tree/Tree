import XCTest
import Tree

final class TreeTests: XCTestCase {
  func test_value_get() {
    let tree = LinkedList<Int>.node(value: 0, .noDescendent)

    XCTAssertEqual(tree.value, 0)
  }

  func test_value_set() {
    var tree = LinkedList<Int>.node(value: 0, .noDescendent)

    tree.value = 1

    XCTAssertEqual(tree, .node(value: 1, .noDescendent))
  }

  func test_children_get() {
    let tree = LinkedList<Int>.node(value: 0, .init(.node(value: 1, .noDescendent)))

    XCTAssertEqual(tree.descentent, .init(.node(value: 1, .noDescendent)))
  }

  func test_children_set() {
    var tree = LinkedList<Int>.node(value: 0, .init(.node(value: 1, .noDescendent)))

    tree.descentent = .noDescendent

    XCTAssertEqual(tree, .node(value: 0, .noDescendent))
  }

  func test_height() {
    let tree = LinkedList<Int>.node(value: 0, .init(.node(value: 1, .noDescendent)))

    XCTAssertEqual(tree.height, 2)
  }

  static var allTests = [
    ("test_value_get", test_value_get),
    ("test_value_set", test_value_set),
    ("test_children_get", test_children_get),
    ("test_children_set", test_children_set),
    ("test_height", test_height)
  ]
}
