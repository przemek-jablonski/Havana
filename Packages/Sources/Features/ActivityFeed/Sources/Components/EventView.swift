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
    internal let event: Octokit.Event.ReleaseEvent
    internal let formatter: RelativeDateTimeFormatter
    private let icon = "shippingbox"
    private let color = Color.green

    // TODO: where is the REPO NAME?!
    internal var body: some View {
      EventView.Card(
        event: event,
        formatter: formatter,
        icon: {
          Image(systemName: icon).foregroundColor(color)
        },
        text: {
          Text("RELEASE ").foregroundColor(color) +
          Text("from ") +
          Text("a_github_user").font(.system(.caption2, design: .monospaced))
        }
      ) { [release = event.payload.release] in
        VStack {
          releaseTag(for: release, color: color)
            .maxWidth(.infinity, alignment: .leading)
            .padding(.bottom, 4)

          releaseBody(for: release)
            .padding(.bottom, 4)
            .maxWidth(.infinity, alignment: .leading)
            .opacity(0.66)
        }
      }
    }
  }
}

private extension View {
  @ViewBuilder
  func releaseTag(
    for release: Octokit.Release,
    color: Color
  ) -> some View {
    HStack(alignment: .lastTextBaseline) {
      Image(systemName: "tag")
        .foregroundColor(color)
        .font(.callout)

      Text(release.name ?? release.tagName)
        .lineLimit(1)
        .font(.system(.callout, design: .monospaced))

      if release.draft {
        Text("DRAFT")
          .font(.caption2)
          .foregroundColor(.yellow)
      }
    }
    .maxWidth(.infinity, alignment: .leading)
  }

  @ViewBuilder
  func releaseBody(
    for release: Octokit.Release
  ) -> some View {
    if let body = release.body {
      Text(body)
        .lineLimit(1)

    } else {
      Text(release.htmlUrl)
    }
  }
}
//          if let body = event.payload.body {
//            Text(body)
//              .lineLimit(4)
//          } else {
//            Text(event.payload.release.htmlUrl) // TODO: style as url
//          }
//              // TODO: style as real URL
//              // TODO: cut to x lines
//              // TODO: attributed string

extension EventView {
  internal struct Fork: View {
    internal var event: Octokit.Event.Payload.ForkEventPayload
    internal let formatter: RelativeDateTimeFormatter
    internal var body: some View {
      Text("fork")
      //      EventCard(
      //        header: { [repository = event.forkee] in
      //          HStack(alignment: .center, spacing: 0) {
      //            Image(systemName: "square.on.square.dashed")
      //              .symbolRenderingMode(.hierarchical)
      //              .padding(.trailing, 4)
      //              .foregroundColor(.blue)
      //
      //            Text("some_githubs_user/a_very_super_repo")
      //              .font(.system(.caption2, design: .monospaced))
      //            +
      //            Text(" FORKED")
      //              .foregroundColor(.blue)
      //          }
      //          .maxWidth(.infinity, alignment: .leading)
      //          .font(.caption)
      //          .opacity(0.66)
      //        },
      //        content: { [repository = event.forkee] in
      //          VStack {
      //            HStack {
      //              Image(systemName: "circle.fill")
      //              VStack(alignment: .leading) {
      //                Text("a_very_super_repo")
      //                  .font(.system(.body, design: .monospaced))
      //                Text("this_another_guys_github")
      //                  .font(.system(.caption2, design: .monospaced))
      //                  .opacity(0.66)
      //              }
      //            }
      //            .maxWidth(.infinity, alignment: .leading)
      //            .padding(.bottom)
      //
      //            Text("A librar")
      //              .maxWidth(.infinity, alignment: .leading)
      //              .lineLimit(3)
      //          }
      //        },
      //        footer: { [repository = event.forkee] in
      //          HStack(alignment: .center) {
      //            Text(formatter.localizedString(for: repository.createdAt, relativeTo: .now))
      //              .font(.caption)
      //              .opacity(0.66)
      //          }
      //          .maxWidth(.infinity, alignment: .trailing)
      //        }
      //      )
    }
  }
}

#if DEBUG
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
#endif
