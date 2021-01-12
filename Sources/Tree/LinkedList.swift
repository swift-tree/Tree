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
