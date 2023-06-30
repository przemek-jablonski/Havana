import Casimir
import ComposableArchitecture
import Motif
import Octokit
import SwiftUI

public struct ActivityFeedView: View {
  public let store: StoreOf<ActivityFeedReducer>
  private let formatter: RelativeDateTimeFormatter

  public init(
    _ store: StoreOf<ActivityFeedReducer>
  ) {
    self.store = store
    self.formatter = RelativeDateTimeFormatter()
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      WithLoading(data: viewStore.publicEvents) { events in
        List {
          ForEach(events) { event in
            eventView(
              event: event,
              formatter: formatter
            )
            .padding()
          }
          .listRowSeparator(.hidden)
          .listRowInsets(.zero)
        }
        .listStyle(.plain)
        .navigationTitle("Events")
      }
      .task {
        viewStore.send(
          .user(
            .userNavigatedToActivityFeed
          )
        )
      }
    }
  }
}

private extension View {
  @ViewBuilder
  func eventView(
    event: Octokit.Event,
    formatter: RelativeDateTimeFormatter
  ) -> some View {
    switch event {
    case .commitCommentEvent:
      Text("commitCommentEvent")
    case .createEvent:
      Text("createEvent")
    case .deleteEvent:
      Text("deleteEvent")
    case .forkEvent(let event):
      EventView.Fork(
        event: event,
        formatter: formatter
      )
    case .gollumEvent:
      Text("gollumEvent")
    case .issueCommentEvent:
      Text("issueCommentEvent")
    case .issuesEvent:
      Text("issuesEvent")
    case .memberEvent:
      Text("memberEvent")
    case .publicEvent:
      Text("publicEvent")
    case .pullRequestEvent:
      Text("pullRequestEvent")
    case .pushEvent:
      Text("pushEvent")
    case .releaseEvent(let event):
      EventView.Release(
        event: event,
        formatter: formatter
      )
      .contextMenu {
        NavigationLink(Label("Release Notes", systemImage: "list.dash"), destination: Text("asdasd"))
        NavigationLink("navi") {
          Text("loooo;")
        }

        Button(label: Label("Release Notes", systemImage: "list.dash")) { }
        // maybe actual repo name instead of static "Repository" string?
        Button(label: Label(event.repository.name, systemImage: "folder")) { }
        // maybe actual user name instead of static "User" string?
        Button(label: Label(event.actor.displayLogin, systemImage: "person")) { }
        Button {
          // Add this item to a list of favorites.
        } label: {
          Label("Add to Favorites", systemImage: "heart")
        }
      }
    case .sponsorshipEvent:
      Text("sponsorshipEvent")
    case .watchEvent(let event):
      EventView.Watch(
        event: event,
        formatter: formatter
      )
    }
  }
}

#if DEBUG
internal struct ActivityFeedViewPreviews: PreviewProvider {
  internal static var previews: some View {
    ActivityFeedView(
      Store(
        initialState: .init(user: .random()),
        reducer: { ActivityFeedReducer() }
      )
    )
  }
}
#endif
