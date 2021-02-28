public extension Tree {
  static func leaf(_ e: Element) -> Self { .node(value: e, .noDescendent) }
}
