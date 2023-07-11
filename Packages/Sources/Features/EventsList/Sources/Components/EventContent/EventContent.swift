import Casimir
import Motif
import Octokit
import SwiftUI

internal enum EventContent {}

internal protocol EventContentProtocol {
  associatedtype Event: OctokitEventProtocol
  var event: Event { get }
  var formatter: RelativeDateTimeFormatter { get }
  var icon: Motif.Icon { get }
  var color: Motif.Color { get }
}

extension EventContent {
  internal struct Release: View, EventContentProtocol {
    internal let event: Octokit.Event.ReleaseEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.release
    internal let color = Motif.Color.release

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("created new"),
          .action("Release", icon, color)
        ]
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

extension EventContent {
  internal struct Fork: View, EventContentProtocol {
    internal var event: Octokit.Event.ForkEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.fork
    internal let color = Motif.Color.fork

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("created a"),
          .action("Fork", icon, color)
        ]
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

extension EventContent {
  internal struct Watch: View, EventContentProtocol {
    internal var event: Octokit.Event.WatchEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.watch
    internal let color = Motif.Color.watch

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .action("Starred", icon, color),
          .text("a repository")
        ]
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

extension EventContent {
  internal struct Member: View, EventContentProtocol {
    internal var event: Octokit.Event.MemberEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.joinedProject
    internal let color = Motif.Color.member

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .action("Joined", icon, color),
          .text("as contributor")
        ]
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

extension EventContent {
  internal struct CommitComment: View, EventContentProtocol {
    internal var event: Octokit.Event.CommitCommentEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.commit
    internal let color = Motif.Color.commit

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .action("Commented", icon, color),
          .text("on commit")
        ]
      ) {
        VStack(alignment: .leading) {
          RepositoryView(
            name: event.repository.name
          )

          Text(event.payload.comment.body)
            .font(.caption)
            .padding(.vertical, 4)
            .padding(.horizontal)
            .lineLimit(3)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.leading)
            .maxWidth(.infinity, alignment: .leading)
        }
      }
    }
  }
}

extension EventContent {
  internal struct Create: View, EventContentProtocol {
    internal var event: Octokit.Event.CreateEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.contribution
    internal let color = Motif.Color.create

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("made a"),
          .action("Contribution", icon, color)
        ]
      ) {
        VStack(alignment: .leading) {
          RepositoryView(
            name: event.repository.name,
            description: event.payload.description
          )

          Text("New \(event.payload.refType): ")
            .padding(.vertical, 4)
            .padding(.horizontal)
            .lineLimit(3)
            .foregroundStyle(.primary)
            .multilineTextAlignment(.leading)
            .maxWidth(.infinity, alignment: .leading)

          if let ref = event.payload.ref {
            Text(": \(ref)")
              .monospaced()
              .padding(.vertical, 4)
              .padding(.horizontal)
              .lineLimit(3)
              .foregroundStyle(.secondary)
              .multilineTextAlignment(.leading)
              .maxWidth(.infinity, alignment: .leading)
          }
        }
      }
    }
  }
}

extension EventContent {
  internal struct Delete: View, EventContentProtocol {
    internal var event: Octokit.Event.DeleteEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.delete
    internal let color = Motif.Color.delete

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("has"),
          .action("Deleted", icon, color),
          .text("an object")
        ]
      ) {
        VStack(alignment: .leading) {
          RepositoryView(
            name: event.repository.name
          )

          if let ref = event.payload.ref, !ref.isEmptyNoWhitespaces {
            Text(event.payload.refType)
              .padding(.vertical, 4)
              .padding(.horizontal)
              .lineLimit(3)
              .foregroundStyle(.secondary)
              .multilineTextAlignment(.leading)
              .maxWidth(.infinity, alignment: .leading)

            Text(ref)
              .padding(.vertical, 4)
              .padding(.horizontal)
              .lineLimit(3)
              .foregroundStyle(.secondary)
              .multilineTextAlignment(.leading)
              .maxWidth(.infinity, alignment: .leading)
          }
        }
      }
    }
  }
}

extension EventContent {
  internal struct Wiki: View, EventContentProtocol {
    internal var event: Octokit.Event.GollumEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.wiki
    internal let color = Motif.Color.wiki

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("updated"),
          .action("Wiki", icon, color)
        ]
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

extension EventContent {
  internal struct IssueComment: View, EventContentProtocol {
    internal var event: Octokit.Event.IssueCommentEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.issue
    internal let color = Motif.Color.issue

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("commented on an"),
          .action("Issue", icon, color
          )
        ]
      ) {
        VStack(alignment: .leading) {
          RepositoryView(
            name: event.repository.name
          )

          Text(event.payload.action)

          Text(event.payload.issue.title)
            .padding(.vertical, 4)
            .padding(.horizontal)
            .lineLimit(3)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.leading)
            .maxWidth(.infinity, alignment: .leading)

          if let body = event.payload.issue.body, !body.isEmptyNoWhitespaces {
            Text(body)
              .padding(.vertical, 4)
              .padding(.horizontal)
              .lineLimit(3)
              .foregroundStyle(.secondary)
              .multilineTextAlignment(.leading)
              .maxWidth(.infinity, alignment: .leading)
          }
        }
      }
    }
  }
}

extension EventContent {
  internal struct Issue: View, EventContentProtocol {
    internal var event: Octokit.Event.IssuesEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.issue
    internal let color = Motif.Color.issue

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("updated an"),
          .action("Issue", icon, color)
        ]
      ) {
        VStack(alignment: .leading) {
          RepositoryView(
            name: event.repository.name
          )

          Text(event.payload.action)

          Text(event.payload.issue.title)
            .padding(.vertical, 4)
            .padding(.horizontal)
            .lineLimit(3)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.leading)
            .maxWidth(.infinity, alignment: .leading)

          if let body = event.payload.issue.body, !body.isEmptyNoWhitespaces {
            Text(body)
              .padding(.vertical, 4)
              .padding(.horizontal)
              .lineLimit(3)
              .foregroundStyle(.secondary)
              .multilineTextAlignment(.leading)
              .maxWidth(.infinity, alignment: .leading)
          }
        }
      }
    }
  }
}

extension EventContent {
  internal struct Public: View, EventContentProtocol {
    internal var event: Octokit.Event.PublicEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.public
    internal let color = Motif.Color.public

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("made a repo"),
          .action("Public", icon, color)
        ]
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

extension EventContent {
  internal struct CommitPush: View, EventContentProtocol {
    internal var event: Octokit.Event.PushEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.commit
    internal let color = Motif.Color.commit

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("pushed some"),
          .action("Commits", icon, color)
        ]
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

extension EventContent {
  internal struct PullRequest: View, EventContentProtocol {
    internal var event: Octokit.Event.PullRequestEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.pullRequest
    internal let color = Motif.Color.pullRequest

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("created a"),
          .action("Pull Request", icon, color)
        ]
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

extension EventContent {
  internal struct Sponsorship: View, EventContentProtocol {
    internal var event: Octokit.Event.SponsorshipEvent
    internal let formatter: RelativeDateTimeFormatter
    internal let icon = Motif.Icon.sponsorship
    internal let color = Motif.Color.sponsorship

    internal var body: some View {
      EventCard(
        date: event.createdAt,
        formatter,
        header: [
          .avatar,
          .username(event.actor.login),
          .text("became a"),
          .action("Sponsor", icon, color)
        ]
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
        EventContent.CommitComment(
          event: .random(),
          formatter: RelativeDateTimeFormatter()
        )
        EventContent.Release(
          event: .random(),
          formatter: RelativeDateTimeFormatter()
        )
        EventContent.Member(
          event: .random(),
          formatter: RelativeDateTimeFormatter()
        )
        ForEach(0..<20, id: \.self) { _ in
          Button(label: EventContent.Fork(
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
