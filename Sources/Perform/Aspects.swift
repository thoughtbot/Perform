import Aspects

extension NSObject {
  @nonobjc final func aspect_hook(selector: Selector, options: AspectOptions, body: @convention(block) (AspectInfo) -> Void) throws -> AspectToken {
    return try aspect_hookSelector(selector, withOptions: options, usingBlock: unsafeBitCast(body, AnyObject.self))
  }
}
