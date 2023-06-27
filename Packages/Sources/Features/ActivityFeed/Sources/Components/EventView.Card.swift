import Octokit
import Motif
import SwiftUI

internal extension EventView {
  struct Card<
    Content: View,
    HeaderImage: View,
    HeaderText: View,
    Event: OctokitEventProtocol
  >: View {
    internal let event: Event
    internal let formatter: RelativeDateTimeFormatter
    internal let icon: () -> HeaderImage
    internal let text: () -> HeaderText
    internal var content: () -> Content

    internal var body: some View {
      CardView {
        header(icon: icon, text: text)
        Divider()
        content()
        Divider()
        footer(for: event, formatter: formatter)
      }
    }
  }
}

private extension View {
  @ViewBuilder
  func header<
    HeaderImage: View,
    HeaderText: View
  >(
    icon: () -> HeaderImage,
    text: () -> HeaderText
  ) -> some View {
    HStack(alignment: .lastTextBaseline, spacing: 0) {
      icon()
        .symbolRenderingMode(.hierarchical)
        .font(.caption)
        .padding(.trailing, 4) // TODO: ScaledMetric

      text()
        .font(.caption)
        .opacity(0.66)
    }
    .maxWidth(.infinity, alignment: .leading)
  }
}

private extension View {
  @ViewBuilder
  func footer(
    for event: any OctokitEventProtocol,
    formatter: RelativeDateTimeFormatter
  ) -> some View {
    HStack(alignment: .lastTextBaseline) {
      Text(formatter.localizedString(for: event.createdAt, relativeTo: .now))
        .font(.caption)
        .opacity(0.66)
    }
    .maxWidth(.infinity, alignment: .trailing)
  }
}
