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
        header: [.avatar, .username(event.actor.login), .text("created new"), .action("Release", .release, .green)]
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
        header: [.avatar, .username(event.actor.login), .text("created a"), .action("Fork", .fork, .purple)]
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
        header: [.avatar, .username(event.actor.login), .action("Starred", .star, .yellow), .text("a repository")]
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

extension EventView {
  internal struct Member: View {
    internal var event: Octokit.Event.MemberEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .action("Joined", .joinedProject, .blue), .text("as contributor")]
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

extension EventView {
  internal struct CommitComment: View {
    internal var event: Octokit.Event.CommitCommentEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .action("Commented", .comment, .pink), .text("on commit")]
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

extension EventView {
  internal struct Create: View {
    internal var event: Octokit.Event.CreateEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .text("made a"), .action("Contribution", .contribution, .pink)]
      ) {
        VStack(alignment: .leading) {
          RepositoryView(
            name: event.repository.name,
            description: event.payload.description
          )

          Text(event.payload.refType)
            .padding(.vertical, 4)
            .padding(.horizontal)
            .lineLimit(3)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.leading)
            .maxWidth(.infinity, alignment: .leading)

          if let ref = event.payload.ref {
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

extension EventView {
  internal struct Delete: View {
    internal var event: Octokit.Event.DeleteEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .text("has"), .action("Deletion", .delete, .pink), .text("an object")]
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

extension EventView {
  internal struct Wiki: View {
    internal var event: Octokit.Event.GollumEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .text("updated"), .action("Wiki", .wiki, .pink)]
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

extension EventView {
  internal struct IssueComment: View {
    internal var event: Octokit.Event.IssueCommentEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .text("commented on an"), .action("Issue", .issue, .pink)]
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

extension EventView {
  internal struct Issue: View {
    internal var event: Octokit.Event.IssuesEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .text("updated an"), .action("Issue", .issue, .pink)]
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

extension EventView {
  internal struct Public: View {
    internal var event: Octokit.Event.PublicEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .text("made a repo"), .action("Public", .public, .pink)]
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

extension EventView {
  internal struct CommitPush: View {
    internal var event: Octokit.Event.PushEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .text("pushed some"), .action("Commits", .commit, .pink)]
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

extension EventView {
  internal struct PullRequest: View {
    internal var event: Octokit.Event.PullRequestEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .text("created a"), .action("Pull Request", .pullRequest, .pink)]
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

extension EventView {
  internal struct Sponsorship: View {
    internal var event: Octokit.Event.SponsorshipEvent
    internal let formatter: RelativeDateTimeFormatter

    internal var body: some View {
      EventView.Card(
        date: event.createdAt,
        formatter,
        header: [.avatar, .username(event.actor.login), .text("became a"), .action("Sponsor", .sponsorship, .pink)]
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
        EventView.CommitComment(
          event: .random(),
          formatter: RelativeDateTimeFormatter()
        )
        EventView.Release(
          event: .random(),
          formatter: RelativeDateTimeFormatter()
        )
        EventView.Member(
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
