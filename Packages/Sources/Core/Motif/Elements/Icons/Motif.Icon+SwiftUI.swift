import SwiftUI

public extension Label where Title == Text, Icon == Image {
  init(
    _ titleKey: LocalizedStringKey,
    icon: Motif.Icon
  ) {
    self.init(
      titleKey,
      systemImage: icon.systemName
    )
  }

  init<S: StringProtocol>(
    _ title: S,
    icon: Motif.Icon
  ) {
    self.init(
      title,
      systemImage: icon.systemName
    )
  }
}

public extension Button {
  init(
    _ titleKey: LocalizedStringKey,
    icon: Motif.Icon,
    action: @escaping () -> Void
  ) where Label == SwiftUI.Label<Text, Image> {
    self.init(
      label: Label(
        titleKey,
        icon: icon
      ),
      action: action
    )
  }

  init<S: StringProtocol>(
    _ title: S,
    icon: Motif.Icon,
    action: @escaping () -> Void
  ) where Label == SwiftUI.Label<Text, Image> {
    self.init(
      label: Label(
        title,
        icon: icon
      ),
      action: action
    )
  }
}

public extension Image {
  init(
    icon: Motif.Icon
  ) {
    self.init(
      systemName: icon.systemName
    )
    // TODO: add rendering mode everywhere
    //    .renderingMode(.hierarchical)
  }
}

public extension Text {
  init<S: StringProtocol>(
    _ title: S,
    icon: Motif.Icon
  ) {
    // TODO: RTL support
    self = Text(Image(icon: icon)) + Text(" ") + Text(title)
  }
}
