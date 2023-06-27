import Motif
import Octokit
import SwiftUI

internal extension EventView {
  struct Card<
    Content: View,
    Header: View,
    Footer: View
  >: View {
    internal var content: () -> Content
    internal var header: () -> Header
    internal var footer: () -> Footer
    internal var body: some View {
      CardView {
        VStack {
          header()
            .font(.caption)
            .maxWidth(.infinity, alignment: .leading)

          //        Divider()

          content()
            .font(.body)
            .maxWidth(.infinity, alignment: .leading)

          //        Divider()

          footer()
            .font(.caption)
            .maxWidth(.infinity, alignment: .trailing)
        }
      }
    }
  }
}
//
// private extension View {
//  @ViewBuilder
//  func header<
//    HeaderImage: View,
//    HeaderText: View
//  >(
//    icon: () -> HeaderImage,
//    text: () -> HeaderText
//  ) -> some View {
//    HStack(alignment: .lastTextBaseline, spacing: 0) {
//      icon()
//        .symbolRenderingMode(.hierarchical)
//        .font(.caption)
//        .padding(.trailing, 4) // TODO: ScaledMetric
//
//      text()
//        .font(.caption)
//        .opacity(0.66)
//    }
//    .maxWidth(.infinity, alignment: .leading)
//  }
// }
//
// private extension View {
//  @ViewBuilder
//  func footer(
//    for event: any OctokitEventProtocol,
//    formatter: RelativeDateTimeFormatter
//  ) -> some View {
//    HStack(alignment: .lastTextBaseline) {
//      Text(formatter.localizedString(for: event.createdAt, relativeTo: .now))
//        .font(.caption)
//        .opacity(0.66)
//    }
//    .maxWidth(.infinity, alignment: .trailing)
//  }
// }
