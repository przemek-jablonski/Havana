import Casimir // TODO: remove
import Motif
import Octokit
import SwiftUI

internal enum EventView {}

extension EventView {
  internal struct Release: View {
    internal var event: Octokit.Event.ReleaseEvent
    internal let formatter: RelativeDateTimeFormatter
    internal var body: some View {
      EventCard(
        header: {
          EventHeader(
            Image(systemName: "shippingbox"),
            .green,
            "NEW RELEASE from xxx"
          )
        },
        content: { [release = event.payload.release] in
          VStack {
            HStack(alignment: .lastTextBaseline) {
              Image(systemName: "tag")
                .foregroundColor(.green)
              Text("1.1.0-alpha02") // or tag
                .foregroundColor(.green)

              if release.draft {
                Text("DRAFT")
                  .font(.caption)
                  .foregroundColor(.yellow)
              }

              if release.prerelease {
                Text("PRERELEASE")
                  .font(.caption)
                  .foregroundColor(.orange)
              }
            }
            .maxWidth(.infinity, alignment: .leading)
            .padding(.bottom, 4) // TODO: ScaledMetric

            HStack {
              if let body = release.body {
                Text(body)
                  .lineLimit(3)
              } else {
                // TODO: style as real URL
                // TODO: cut to x lines
                // TODO: attributed string
                Text(release.htmlUrl)
              }
            }
            .maxWidth(.infinity, alignment: .leading)
          }
          .maxWidth(.infinity, alignment: .leading)

        },
        footer: { [release = event.payload.release] in
          HStack(alignment: .center) {
            Text(
              formatter.localizedString(for: release.publishedAt,
                                        relativeTo: .now)
            )
            .font(.caption)
          }
          .maxWidth(.infinity, alignment: .trailing) // maybe this in line with header?
        }
      )
    }
  }
}

///
/// - event description                                              more
/// - author circular avatar (`release.author.avatarUrl`), xxx
/// - repository name (`release.htmlUrl -> extract`) xxxx
/// - tag (icon) name (1.1.0-alpha02) `release.name`
/// - draft / prerelease `release.draft / release.prerelease`
/// - body (cut to first x letters / "no description" if nil)  `release.body`
///
/// - timestamp (relative)

private struct EventHeader: View {
  internal let icon: Image
  internal let color: Color
  internal let name: String

  internal init(
    _ icon: Image,
    _ color: Color,
    _ name: String
  ) {
    self.icon = icon
    self.color = color
    self.name = name
  }

  internal var body: some View {
    HStack(alignment: .center) {
      icon
        .padding(4)
        .foregroundColor(color)
      Text(name)
    }
    .maxWidth(.infinity, alignment: .leading)
    .font(.caption)
    .opacity(0.66)
  }
}

private struct EventCard<Content: View, Footer: View>: View {
  private var header: () -> EventHeader
  private var content: () -> Content
  private var footer: () -> Footer

  internal init(
    @ViewBuilder header: @escaping () -> EventHeader,
    @ViewBuilder content: @escaping () -> Content,
    @ViewBuilder footer: @escaping () -> Footer
  ) {
    self.header = header
    self.content = content
    self.footer = footer
  }

  var body: some View {
    CardView {
      header()
      Divider()
      content()
      Divider()
      footer()
    }
  }
}

internal struct EventViewPreviews: PreviewProvider {
  internal static var previews: some View {
    NavigationView {
      Group {
        List {
          ForEach(0..<20, id: \.self) { _ in
            Button(label: EventView.Release(
              event: .random(),
              formatter: RelativeDateTimeFormatter()
            )) {}
          }
          .listRowSeparator(.hidden)
        }
      }
      .listStyle(.plain)
      .navigationTitle("Events")
    }
  }
}
