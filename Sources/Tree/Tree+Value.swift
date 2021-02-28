public extension Tree {
  var value: Element? {
    get {
      guard case let .node(value: value, _) = self else { return nil }
      return value
    }
    set {
      guard case let .node(value: _, children) = self, let value = newValue else { return }
      self = .node(value: value, children)
    }
  }
}
