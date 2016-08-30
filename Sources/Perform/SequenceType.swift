extension SequenceType {
  func first<Result>(isMatch: (Generator.Element) -> Result?) -> Result? {
    for element in self {
      if let result = isMatch(element) {
        return result
      }
    }

    return nil
  }
}
