extension Collection {
  var second: Iterator.Element? {
    return index(startIndex, offsetBy: 1, limitedBy: endIndex).map { self[$0] }
  }
}
