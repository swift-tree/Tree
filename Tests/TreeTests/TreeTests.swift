import XCTest
import Tree

final class TreeTests: XCTestCase {
  func test_value() {
    let tree = Tree<Int, Child>.node(value: 0, .empty)

    XCTAssertEqual(tree.value, 0)
  }

  func test_children() {
    let tree = Tree<Int, Child>.node(value: 0, .next(.node(value: 1, .empty)))

    XCTAssertEqual(tree.children, .next(.node(value: 1, .empty)))
  }

  func test_height() {
    let tree = Tree<Int, Child>.node(value: 0, .next(.node(value: 1, .empty)))

    XCTAssertEqual(tree.height, 7)
  }

  static var allTests = [
    ("test_value", test_value),
    ("test_children", test_children),
    ("test_height", test_height)
  ]
}

enum Child: ChildrenProtocol, Equatable {
  indirect case next(Tree<Int, Self>)
  static let empty: Self = .next(.empty)
  var height: Int {6}
}
