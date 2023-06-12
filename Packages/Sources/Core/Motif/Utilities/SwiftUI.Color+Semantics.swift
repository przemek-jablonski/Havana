#if canImport(UKit)
import SwiftUI

internal extension Color {
  // MARK: - System Background

  internal static var systemBackground: Color { Color(uiColor: .systemBackground) }
  internal static var secondarySystemBackground: Color { Color(uiColor: .secondarySystemBackground) }
  internal static var tertiarySystemBackground: Color { Color(uiColor: .tertiarySystemBackground) }

  // MARK: - System Grouped Background

  internal static var systemGroupedBackground: Color { Color(uiColor: .systemGroupedBackground) }
  internal static var secondarySystemGroupedBackground: Color { Color(uiColor: .secondarySystemGroupedBackground) }
  internal static var tertiarySystemGroupedBackground: Color { Color(uiColor: .tertiarySystemGroupedBackground) }

  // MARK: - System Fill

  internal static var systemFill: Color { Color(uiColor: .systemFill) }
  internal static var secondarySystemFill: Color { Color(uiColor: .secondarySystemFill) }
  internal static var tertiarySystemFill: Color { Color(uiColor: .tertiarySystemFill) }
  internal static var quaternarySystemFill: Color { Color(uiColor: .quaternarySystemFill) }

  // MARK: - Label

  internal static var label: Color { Color(uiColor: .label) }
  internal static var secondaryLabel: Color { Color(uiColor: .secondaryLabel) }
  internal static var tertiaryLabel: Color { Color(uiColor: .tertiaryLabel) }
  internal static var quaternaryLabel: Color { Color(uiColor: .quaternaryLabel) }

  // MARK: - Misc

  internal static var tintColor: Color { Color(uiColor: .tintColor) }
  internal static var link: Color { Color(uiColor: .link) }
  internal static var placeholderText: Color { Color(uiColor: .placeholderText) }
}

struct Color_Previews: PreviewProvider {
  internal static var previews: some View {
    Color.link
  }
}
#endif
