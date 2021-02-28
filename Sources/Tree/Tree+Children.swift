public extension Tree {
  var descentent: Descendent? {
    get {
      guard case let .node(value: _, children) = self else { return nil }
      return children
    }
    set {
      guard case let .node(value: value, _) = self, let children = newValue else { return }
      self = .node(value: value, children)
    }
  }
}
