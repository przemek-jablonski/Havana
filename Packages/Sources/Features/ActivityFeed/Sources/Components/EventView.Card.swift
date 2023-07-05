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
            .maxWidth(.infinity, alignment: .leading)

          Divider()

          content()
            .font(.body)
            .maxWidth(.infinity, alignment: .leading)

          Divider()

          footer()
            .font(.caption)
            .maxWidth(.infinity, alignment: .trailing)
        }
      }
    }
  }
}
