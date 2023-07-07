import Casimir
import SwiftUI

extension EventView {
  internal struct EventFooterView: View {

    internal let date: Date
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      Text(formatter.localizedString(for: date, relativeTo: .now))
        .font(.caption)
        .opacity(0.66)
        .maxWidth(.infinity, alignment: .trailing)
    }
  }
}
