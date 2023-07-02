import SwiftUI

public extension Label where Title == Text, Icon == Image {

  /// Creates a label with an icon image and a title generated from a
  /// localized string.
  ///
  /// - Parameters:
  ///    - titleKey: A title generated from a localized string.
  ///    - icon: One of the icons from the Motif Design System
  init(
    _ titleKey: LocalizedStringKey,
    icon: Motif.Icon
  ) {
    self.init(
      titleKey,
      systemImage: icon.systemName
    )
  }

  /// Creates a label with an icon image and a title generated from a string.
  ///
  /// - Parameters:
  ///    - title: A string used as the label's title.
  ///    - icon: One of the icons from the Motif Design System
  init<S>(
    _ title: S,
    icon: Motif.Icon
  ) where S: StringProtocol {
    self.init(
      title,
      systemImage: icon.systemName
    )
  }
}
