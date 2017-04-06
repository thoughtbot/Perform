extension Sequence {
  func first<Result>(_ isMatch: (Iterator.Element) -> Result?) -> Result? {
    for element in self {
      if let result = isMatch(element) {
        return result
      }
    }

    return nil
  }
}
