//import Motif
//import Octokit
//import SwiftUI
//
//extension EventView {
//  internal struct Card<
//    Content: View,
//    Header: View,
//    Footer: View
//  >: View {
//
//    internal var content: () -> Content
//    internal var header: () -> Header
//    internal var footer: () -> Footer
//
//    private let headerLineLimit = 1
//    private let footerLineLimit = 1
//    private let contentMinimumScalingFactor = 0.85
//
//    internal init(
//      date: Date,
//      _ formatter: RelativeDateTimeFormatter,
//      header: [HeaderView.TextType],
//      content: @escaping () -> Content
//    ) where Header == HeaderView, Footer == FooterView {
//      self.content = content
//      self.header = {
//        HeaderView(
//          header
//        )
//      }
//      self.footer = {
//        FooterView(
//          date: date,
//          formatter: formatter
//        )
//      }
//    }
//
//    internal var body: some View {
//      CardView {
//        VStack(alignment: .leading) {
//          header()
//            .font(.caption)
//            .lineLimit(headerLineLimit)
//            .foregroundStyle(.secondary)
//
//          Divider()
//
//          content()
//            .font(.body)
//            .foregroundStyle(.primary)
//
//          Divider()
//
//          footer()
//            .font(.caption)
//            .lineLimit(footerLineLimit)
//            .foregroundStyle(.secondary)
//        }
//      }
//    }
//  }
//}
