#if canImport(UIKit)
// TODO: support non-UIKit platforms as well (macOS, watchOS!)
import UIKit

internal extension Haptics {
  static func uiFeedbackGenerator() -> Haptics {
    let softFeedbackGenerator = UIImpactFeedbackGenerator(style: .soft)
    let regularFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    let heavyFeedbackGenerator = UIImpactFeedbackGenerator(style: .rigid)
    return Haptics(
      lightNudge: { action in
        switch action {
        case .prepare: softFeedbackGenerator.prepare()
        case .trigger: softFeedbackGenerator.impactOccurred()
        }
      },
      lightClick: { action in
        switch action {
        case .prepare: regularFeedbackGenerator.prepare()
        case .trigger: regularFeedbackGenerator.impactOccurred(intensity: 0.66)
        }
      },
      heavyClick: { action in
        switch action {
        case .prepare: heavyFeedbackGenerator.prepare()
        case .trigger: heavyFeedbackGenerator.impactOccurred()
        }
      }
    )
  }
}
#endif
