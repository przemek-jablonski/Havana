#if canImport(UIKit)
// TODO: support non-UIKit platforms as well (macOS, watchOS!)
public extension Haptics {
  static let shared: Haptics = uiFeedbackGenerator()
}
#endif
