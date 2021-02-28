public extension Tree {
  var height: Int { descentent.map { $0.height + 1 } ?? 0 }
}
