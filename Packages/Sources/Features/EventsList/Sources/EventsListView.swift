import ComposableArchitecture
import Motif
import Octokit
import SwiftUI

public struct EventsListView: View {
  public let store: StoreOf<EventsListReducer>
  internal let formatter: RelativeDateTimeFormatter

  public init(
    _ formatter: RelativeDateTimeFormatter,
    _ store: StoreOf<EventsListReducer>
  ) {
    self.store = store
    self.formatter = formatter
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      WithLoaded(viewStore.events) { event in
        eventContents(for: event, viewStore: viewStore)
      }
    }
  }
}

private extension EventsListView {
  @ViewBuilder
  func eventContents(
    for event: Octokit.Event,
    viewStore: ViewStoreOf<EventsListReducer>
  ) -> some View {
    switch event {
      case .commitCommentEvent:
        Text("commitCommentEvent")
      case .createEvent:
        Text("createEvent")
      case .deleteEvent:
        Text("deleteEvent")
      case .forkEvent(let event):
        EventContent.Fork(
          event: event,
          formatter: formatter
        )
      case .gollumEvent:
        Text("gollumEvent")
      case .issueCommentEvent:
        Text("issueCommentEvent")
      case .issuesEvent:
        Text("issuesEvent")
      case .memberEvent(let event):
        EventContent.Member(
          event: event,
          formatter: formatter
        )
      case .publicEvent:
        Text("publicEvent")
      case .pullRequestEvent:
        Text("pullRequestEvent")
      case .pushEvent:
        Text("pushEvent")
      case .releaseEvent(let event):
        Button(
          label: EventContent.Release(
            event: event,
            formatter: formatter
          ),
          action: {
            viewStore.send(.user(.userRequestedReleaseDetails(event)))
          }
        )
        .buttonStyle(.plain)
        .contextMenu {
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
        EventContent.Watch(
          event: event,
          formatter: formatter
        )
    }
  }
}

#if DEBUG
public struct EventsListViewPreviews: PreviewProvider {
  /// Primary preview for `EventsListView`, shared with standalone preview app as well.
  public static var preview: some View {
    EventsListView(
      RelativeDateTimeFormatter(),
      Store(
        initialState: EventsListReducer.State()
      ) {
        EventsListReducer()
          ._printChanges()
      }
    )
  }

  public static var previews: some View {
    preview
  }
}
#endif
