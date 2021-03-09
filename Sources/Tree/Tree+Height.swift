public extension Tree {
  var height: Int { descendent.map { $0.height + 1 } ?? 0 }
}
