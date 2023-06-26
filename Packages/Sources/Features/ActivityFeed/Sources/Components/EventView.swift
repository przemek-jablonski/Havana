import Casimir // TODO: remove
import Motif
import Octokit
import SwiftUI

// TODO: public and private repos
// TODO: regular and pro users
// TODO: licence
// TODO: WatchEvent's payload is UNIMPLEMENTED IN OCTOKIT!


internal enum EventView {}

extension EventView {
  internal struct Release: View {
    internal var event: Octokit.Event.Payload.ReleaseEventPayload
    internal let formatter: RelativeDateTimeFormatter
    // TODO: where is the REPO NAME?!
    internal var body: some View {
      EventCard(
        header: {
          HStack(alignment: .center, spacing: 0) {
            Image(systemName: "shippingbox")
              .symbolRenderingMode(.hierarchical)
              .padding(.trailing, 4)
              .foregroundColor(.green)

            Text("RELEASE ")
              .foregroundColor(.green)
            +
            Text("from ")
            +
            Text("a_github_user")
              .font(.system(.caption2, design: .monospaced))
          }
          .maxWidth(.infinity, alignment: .leading)
          .font(.caption)
          .opacity(0.66)
        },
        content: { [release = event.release] in
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
        footer: { [release = event.release] in
          HStack(alignment: .center) {
            Text(formatter.localizedString(for: release.publishedAt, relativeTo: .now))
              .font(.caption)
              .opacity(0.66)
          }
          .maxWidth(.infinity, alignment: .trailing)
        }
      )
    }
  }
}

extension EventView {
  internal struct Fork: View {
    internal var event: Octokit.Event.Payload.ForkEventPayload
    internal let formatter: RelativeDateTimeFormatter
    internal var body: some View {
      EventCard(
        header: { [repository = event.forkee] in
          HStack(alignment: .center, spacing: 0) {
            Image(systemName: "square.on.square.dashed")
              .symbolRenderingMode(.hierarchical)
              .padding(.trailing, 4)
              .foregroundColor(.blue)

            Text("some_githubs_user/a_very_super_repo")
              .font(.system(.caption2, design: .monospaced))
            +
            Text(" FORKED")
              .foregroundColor(.blue)
          }
          .maxWidth(.infinity, alignment: .leading)
          .font(.caption)
          .opacity(0.66)
        },
        content: { [repository = event.forkee] in
          VStack {
            HStack {
              Image(systemName: "circle.fill")
              VStack(alignment: .leading) {
                Text("a_very_super_repo")
                  .font(.system(.body, design: .monospaced))
                Text("this_another_guys_github")
                  .font(.system(.caption2, design: .monospaced))
                  .opacity(0.66)
              }
            }
            .maxWidth(.infinity, alignment: .leading)
            .padding(.bottom)

            Text("A librar")
              .maxWidth(.infinity, alignment: .leading)
              .lineLimit(3)
          }
        },
        footer: { [repository = event.forkee] in
          HStack(alignment: .center) {
            Text(formatter.localizedString(for: repository.createdAt, relativeTo: .now))
              .font(.caption)
              .opacity(0.66)
          }
          .maxWidth(.infinity, alignment: .trailing)
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

private struct EventCard<Header: View, Content: View, Footer: View>: View {
  private var header: () -> Header
  private var content: () -> Content
  private var footer: () -> Footer

  internal init(
    @ViewBuilder header: @escaping () -> Header,
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
          Button(label: EventView.Release(
            event: .random(),
            formatter: RelativeDateTimeFormatter()
          )) {}
          ForEach(0..<20, id: \.self) { _ in
            Button(label: EventView.Fork(
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
