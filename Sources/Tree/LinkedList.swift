public typealias LinkedList<T> = Tree<T, Child<T>>

public struct Child<T>: DescendentProtocol {
  public let next: Tree<T, Self>
  public init(_ next: Tree<T, Self>) { self.next = next }
  public static var noDescendent: Self { .init(.empty) }
  public var height: Int { next.height }
}

extension Child: Equatable where T: Equatable {}
extension Child: Hashable where T: Hashable {}

public extension LinkedList where Children == Child<Element> {
  var next: Tree? {
    switch self {
    case .empty:
      return nil
    case let .node(value: _, child):
      return child.next
    }
  }
}

extension LinkedList: ExpressibleByArrayLiteral where Children == Child<Element>, Element: Equatable {
  public init(_ elements: [Element]) {
    var linkedList: Self = .empty
    elements.forEach{linkedList.inserting($0)}
    self = linkedList
  }

  public init(arrayLiteral elements: Element...) {
    self = LinkedList(elements)
  }

  public mutating func inserting(_ e: Element) {
    self = insert(e)
  }

  public func insert(_ e: Element) -> Self {
    switch self {
    case .empty:
      return .node(value: e, .noDescendent)
    case .node(value: let value, .noDescendent):
      return .node(value: value, .init(.node(value: e, .noDescendent)))
    case let .node(value: value, children):
      return .node(value: value, .init(children.next.insert(e)))
    }
  }
}
