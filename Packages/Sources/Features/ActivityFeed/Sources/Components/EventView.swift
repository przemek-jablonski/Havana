import Casimir
import Motif
import Octokit
import SwiftUI

internal enum EventView {}
extension EventView {
  internal struct Release: View {
    internal let event: Octokit.Event.ReleaseEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .regular("created new"), .action("Release", .green)]
      ) { [release = event.payload.release] in
        VStack(alignment: .leading) {
          RepositoryView(
            name: event.repository.name
          )

          HStack {
            Image(icon: .tag)
              .font(.caption)
              .foregroundColor(.green)
            Text(release.tagName)
              .font(.body.monospaced())
              .scaleEffect(0.90)
              .foregroundColor(.green)
          }

          if !(release.body?.isEmptyNoWhitespaces ?? true), let body = try? release.body?.markdown {
            Text(body)
              .font(.caption)
              .padding(.vertical, 4)
              .padding(.horizontal)
              .lineLimit(7)
              .foregroundStyle(.secondary)
              .multilineTextAlignment(.leading)
              .maxWidth(.infinity, alignment: .leading)
          }
        }
      }
    }
  }
}

extension EventView {
  internal struct Fork: View {
    internal var event: Octokit.Event.ForkEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .action("Forked", .purple), .regular("a repository")]
      ) { [forkee = event.payload.forkee] in
        VStack(alignment: .leading) {
          RepositoryView(
            name: forkee.fullName,
            description: forkee.description
          )

          VStack(alignment: .trailing) {
            Text("Forked from")
              .font(.caption)
              .foregroundStyle(.secondary)
            Text(event.repository.name)
              .font(.body.monospaced())
              .foregroundStyle(.primary)
              .foregroundColor(.purple)
              .scaleEffect(0.90)
          }
          .padding(.top, 4)
          .maxWidth(.infinity, alignment: .trailing)
        }

      }
    }
  }
}

extension EventView {
  internal struct Watch: View {
    internal var event: Octokit.Event.WatchEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .action("Starred", .blue), .regular("a repository")]
      ) {
        VStack(alignment: .leading) {
          RepositoryView(
            name: event.repository.name
          )
        }
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
