public typealias LinkedList<T> = Tree<T, Child<T>>

public struct Child<T>: ChildrenProtocol {
  public let next: Tree<T, Self>
  public init(_ next: Tree<T, Self>) { self.next = next }
  public static var noChildren: Self { .init(.empty) }
  public var height: Int { next.height }
}

extension Child: Equatable where T: Equatable {}
extension Child: Hashable where T: Hashable {}

public extension Tree where Children == Child<Element>, Element: Equatable {
  var next: Tree? {
    switch self {
    case .empty, .node(value: _, .noChildren):
      return nil
    case let .node(value: _, child):
      return child.next
    }
  }
}

public extension LinkedList where Children == Child<Element>, Element: Equatable {
  mutating func inserting(_ e: Element) {
    self = insert(e)
  }

  func insert(_ e: Element) -> Self {
    switch self {
    case .empty:
      return .node(value: e, .noChildren)
    case .node(value: let value, .noChildren):
      return .node(value: value, .init(.node(value: e, .noChildren)))
    case let .node(value: value, children):
      return .node(value: value, .init(children.next.insert(e)))
    }
  }
}
