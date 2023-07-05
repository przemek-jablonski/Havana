import Casimir
import ComposableArchitecture
import Motif
import Octokit
import ReleaseDetailsFeature
import SwiftUI
import SwiftUINavigation

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
    NavigationStack {
      WithViewStore(store) { viewStore in
        WithLoaded(viewStore.publicEvents) { event in
          eventView(
            viewStore: viewStore,
            event,
            formatter
          )
        }
        .navigationTitle("Events")
        .task {
          viewStore.send(.user(.userNavigatedToActivityFeed))
        }
        .navigationDestination(
          store: self.store.scope(state: \.$navigation, action: { ._navigation($0) }),
          state: /ActivityFeedReducer.Navigation.State.releaseDetails,
          action: ActivityFeedReducer.Navigation.Action.releaseDetails
        ) {
          ReleaseDetailsView($0)
        }
      }
    }
  }
}

private extension ActivityFeedView {
  @ViewBuilder
  func eventView(
    viewStore: ViewStoreOf<ActivityFeedReducer>,
    _ event: Octokit.Event,
    _ formatter: RelativeDateTimeFormatter
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
        Button(label: Label(event.payload.release.tagName, icon: .releaseNotes)) {
          viewStore.send(.user(.userRequestedReleaseDetails(event)))
        }

        Button(label: Label(event.repository.name, icon: .repository)) {
          viewStore.send(.user(.userRequestedRepositoryDetails(event.repository)))
        }

        Button(label: Label(event.actor.login, icon: .author)) {
          viewStore.send(.user(.userRequestedActorDetails(event.actor)))
        }

        Button(label: Label("Star Repository", icon: .star)) {
          viewStore.send(.user(.userRequestedRepositoryStarred(event.repository.id)))
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
