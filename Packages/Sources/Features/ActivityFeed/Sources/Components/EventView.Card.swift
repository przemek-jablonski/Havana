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
        VStack(alignment: .leading) {
          header()
            .font(.caption)
            .lineLimit(1)
            .minimumScaleFactor(0.85)
            .foregroundStyle(.secondary)

          Divider()

          content()
            .font(.body)
            .foregroundStyle(.primary)

          Divider()

          footer()
            .font(.caption)
            .lineLimit(1)
            .minimumScaleFactor(0.85)
            .foregroundStyle(.secondary)
        }
      }
    }
  }
}
