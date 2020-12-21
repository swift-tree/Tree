import XCTest
import Tree

final class TreeTests: XCTestCase {
  func test_value_get() {
    let tree = Tree<Int, Child>.node(value: 0, .empty)

    XCTAssertEqual(tree.value, 0)
  }

  func test_value_set() {
    var tree = Tree<Int, Child>.node(value: 0, .empty)

    tree.value = 1

    XCTAssertEqual(tree.value, 1)
  }

  func test_children_get() {
    let tree = Tree<Int, Child>.node(value: 0, .next(.node(value: 1, .empty)))

    XCTAssertEqual(tree.children, .next(.node(value: 1, .empty)))
  }

  func test_children_set() {
    var tree = Tree<Int, Child>.node(value: 0, .next(.node(value: 1, .empty)))

    tree.children = .empty

    XCTAssertEqual(tree.children, .empty)
  }

  func test_height() {
    let tree = Tree<Int, Child>.node(value: 0, .next(.node(value: 1, .empty)))

    XCTAssertEqual(tree.height, 7)
  }

  static var allTests = [
    ("test_value_get", test_value_get),
    ("test_value_set", test_value_set),
    ("test_children_get", test_children_get),
    ("test_children_set", test_children_set),
    ("test_height", test_height)
  ]
}

enum Child: ChildrenProtocol, Equatable {
  indirect case next(Tree<Int, Self>)
  static var empty: Self { .next(.empty) }
  var height: Int {6}
}
