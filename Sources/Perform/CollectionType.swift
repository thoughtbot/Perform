extension CollectionType {
  var second: Generator.Element? {
    guard case let index = startIndex.successor() where indices.contains(index) else { return nil }
    return self[index]
  }
}
