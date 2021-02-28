public enum Tree<Element, Descendent: DescendentProtocol> {
  case empty
  indirect case node(value: Element, Descendent)
}

extension Tree: Equatable where Element: Equatable, Descendent: Equatable {}
extension Tree: Hashable where Element: Hashable, Descendent: Hashable {}
