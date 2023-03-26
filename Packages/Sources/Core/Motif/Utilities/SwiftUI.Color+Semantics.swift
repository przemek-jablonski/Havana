#if canImport(UKit)
import SwiftUI

internal extension Color {
  // MARK: - System Background

  static var systemBackground: Color { Color(uiColor: .systemBackground) }
  static var secondarySystemBackground: Color { Color(uiColor: .secondarySystemBackground) }
  static var tertiarySystemBackground: Color { Color(uiColor: .tertiarySystemBackground) }

  // MARK: - System Grouped Background

  static var systemGroupedBackground: Color { Color(uiColor: .systemGroupedBackground) }
  static var secondarySystemGroupedBackground: Color { Color(uiColor: .secondarySystemGroupedBackground) }
  static var tertiarySystemGroupedBackground: Color { Color(uiColor: .tertiarySystemGroupedBackground) }

  // MARK: - System Fill

  static var systemFill: Color { Color(uiColor: .systemFill) }
  static var secondarySystemFill: Color { Color(uiColor: .secondarySystemFill) }
  static var tertiarySystemFill: Color { Color(uiColor: .tertiarySystemFill) }
  static var quaternarySystemFill: Color { Color(uiColor: .quaternarySystemFill) }

  // MARK: - Label

  static var label: Color { Color(uiColor: .label) }
  static var secondaryLabel: Color { Color(uiColor: .secondaryLabel) }
  static var tertiaryLabel: Color { Color(uiColor: .tertiaryLabel) }
  static var quaternaryLabel: Color { Color(uiColor: .quaternaryLabel) }

  // MARK: - Misc

  static var tintColor: Color { Color(uiColor: .tintColor) }
  static var link: Color { Color(uiColor: .link) }
  static var placeholderText: Color { Color(uiColor: .placeholderText) }
}

struct Color_Previews: PreviewProvider {
  static var previews: some View {
    Color.link
  }
}
#endif
