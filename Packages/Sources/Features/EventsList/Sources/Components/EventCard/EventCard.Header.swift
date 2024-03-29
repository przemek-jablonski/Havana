import Motif
import SwiftUI

extension EventCard {
  internal struct Header: View {

    internal enum TextType: Hashable {
      case avatar
      case username(String)
      case action(String, Motif.Icon, Motif.Color)
      case text(String)
    }

    internal let texts: [TextType]

    internal init(
      _ texts: TextType...
    ) {
      self.texts = texts
    }

    internal init(
      _ texts: [TextType]
    ) {
      self.texts = texts
    }

    internal var body: some View {
      HStack(
        alignment: .center
      ) {
        ForEach(texts, id: \.self) { text in
          view(for: text)
        }
      }
    }
  }
}

extension EventCard.Header {
  @ViewBuilder
  func view(
    for text: TextType
  ) -> some View {
    switch text {
    case .avatar:
      Text(Image(systemName: "circle")).font(.body)
    case .username(let username):
      Text(username.uppercased())
        .foregroundStyle(.primary)
    case .action(let action, let icon, let color):
      Text(action.uppercased(), icon: icon)
        .foregroundColor(color.color)
    case .text(let string):
      Text(string)
    }
  }
}
