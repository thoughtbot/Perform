import Aspects

extension NSObject {
  @nonobjc final func aspect_hook(_ selector: Selector, options: AspectOptions, body: @convention(block) @escaping (AspectInfo) -> Void) throws -> AspectToken {
    return try self.aspect_hook(selector, with: options, usingBlock: unsafeBitCast(body, to: NSObject.self))
  }
}
