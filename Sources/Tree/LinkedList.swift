public typealias LinkedList<T> = Tree<T, Child<T>>

public struct Child<T>: DescendentProtocol {
  public let next: Tree<T, Self>
  public init(_ next: Tree<T, Self>) { self.next = next }
  public static var noDescendent: Self { .init(.empty) }
  public var height: Int { next.height }
}

extension Child: Equatable where T: Equatable {}
extension Child: Hashable where T: Hashable {}

public extension LinkedList where Descendent == Child<Element> {
  init(_ elements: [Element]) {
    var linkedList: Self = .empty
    elements.forEach { linkedList.inserting($0) }
    self = linkedList
  }

  init(arrayLiteral elements: Element...) {
    self = LinkedList(elements)
  }

  mutating func inserting(_ e: Element) {
    self = insert(e)
  }

  func insert(_ e: Element) -> Self {
    switch self {
    case .empty:
      return .node(value: e, .noDescendent)
    case let .node(value: value, children):
      return .node(value: value, .init(children.next.insert(e)))
    }
  }

  var next: Tree {
    switch self {
    case .empty:
      return .empty
    case let .node(value: _, child):
      return child.next
    }
  }
}
