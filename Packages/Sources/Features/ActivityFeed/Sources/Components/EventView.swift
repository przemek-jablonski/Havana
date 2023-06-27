import Casimir // TODO: remove
import Motif
import Octokit
import SwiftUI

// TODO: public and private repos
// TODO: regular and pro users
// TODO: licence
// TODO: WatchEvent's payload is UNIMPLEMENTED IN OCTOKIT!

internal enum EventView {}

internal struct EventHeadlineView: View {
  internal let color: Color
  internal let icon: String
  internal let name: String

  internal var body: some View {
    HStack(alignment: .lastTextBaseline, spacing: 0) {
      Image(systemName: icon)
        .symbolRenderingMode(.hierarchical)
        .font(.caption)
        .foregroundColor(color)
        .padding(.trailing, 4) // TODO: ScaledMetric

      Text(name)
        .font(.caption)
        .foregroundColor(color)
    }
    .maxWidth(.infinity, alignment: .leading)
  }
}

internal struct EventFooterView: View {
  internal let date: Date
  internal let formatter: RelativeDateTimeFormatter

  internal var body: some View {
    HStack(alignment: .lastTextBaseline, spacing: 0) {
      Text(formatter.localizedString(for: date, relativeTo: .now))
        .font(.caption)
        .opacity(0.66)
    }
    .maxWidth(.infinity, alignment: .trailing)
  }
}

extension EventView {
  internal struct Release: View {
    internal let event: Octokit.Event.ReleaseEvent
    internal let formatter: RelativeDateTimeFormatter

    // TODO: where is the REPO NAME?!
    internal var body: some View {
      EventView.Card { [release = event.payload.release] in
        VStack {
          releaseTag(for: release, color: .green)
            .maxWidth(.infinity, alignment: .leading)
            .padding(.bottom, 4)

          releaseBody(for: release)
            .padding(.bottom, 4)
            .maxWidth(.infinity, alignment: .leading)
            .opacity(0.66)
          //              // TODO: style as real URL
          //              // TODO: cut to x lines
          //              // TODO: attributed string
        }
      } header: {
        EventHeadlineView(
          color: .green,
          icon: "shippingbox",
          name: "NEW RELEASE"
        )
      } footer: {
        EventFooterView(
          date: event.createdAt,
          formatter: formatter
        )
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

extension EventView {
  internal struct Fork: View {
    internal var event: Octokit.Event.ForkEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card { [forkee = event.payload.forkee] in
        VStack {
          HStack {
            Image(systemName: "circle.fill")
            VStack(alignment: .leading) {
              Text(forkee.fullName)
                .font(.system(.body, design: .monospaced))
              Text(forkee.owner.name ?? forkee.owner.login)
                .font(.system(.caption2, design: .monospaced))
                .opacity(0.66)
            }
          }
          .maxWidth(.infinity, alignment: .leading)
          .padding(.bottom)

          Text(forkee.description ?? forkee.url)
            .maxWidth(.infinity, alignment: .leading)
            .lineLimit(3)
        }
      } header: {
        EventHeadlineView(
          color: .purple,
          icon: "square.on.square.dashed",
          name: "FORK"
        )
      } footer: {
        EventFooterView(
          date: event.createdAt,
          formatter: formatter
        )
      }
    }
  }
}

extension EventView {
  internal struct Watch: View {
    internal var event: Octokit.Event.WatchEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card {
        VStack {
          Text(event.actor.login)
          Text(event.repository.name)
        }
        //        VStack {
        //          HStack {
        //            Image(systemName: "circle.fill")
        //            VStack(alignment: .leading) {
        //              Text(forkee.fullName)
        //                .fontDesign(.monospaced)
        //                .font(.system(.body, design: .monospaced))
        //              Text(forkee.owner.name ?? forkee.owner.login)
        //                .font(.system(.caption2, design: .monospaced))
        //                .opacity(0.66)
        //            }
        //          }
        //          .maxWidth(.infinity, alignment: .leading)
        //          .padding(.bottom)
        //
        //          Text(forkee.description ?? forkee.url)
        //            .maxWidth(.infinity, alignment: .leading)
        //            .lineLimit(3)
        //        }
      } header: {
        EventHeadlineView(
          color: .blue,
          icon: "person.2",
          name: "WATCH"
        )
      } footer: {
        EventFooterView(
          date: event.createdAt,
          formatter: formatter
        )
      }
    }
  }
}

#if DEBUG
internal struct EventViewPreviews: PreviewProvider {
  internal static var previews: some View {
    NavigationView {
      List {
        EventView.Release(
          event: .random(),
          formatter: RelativeDateTimeFormatter()
        )
        ForEach(0..<20, id: \.self) { _ in
          Button(label: EventView.Fork(
            event: .random(),
            formatter: RelativeDateTimeFormatter()
          )) {}
        }
        .listRowSeparator(.hidden)
      }
      .listStyle(.plain)
      .navigationTitle("Events")
    }
  }
}
#endif
