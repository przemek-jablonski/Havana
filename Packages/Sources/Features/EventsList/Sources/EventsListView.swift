import ComposableArchitecture
import Motif
import Octokit
import ReleaseDetailsFeature
import SwiftUI

public struct EventsListView: View {
  public let store: StoreOf<EventsListReducer>
  internal let formatter: RelativeDateTimeFormatter

  public init(
    _ store: StoreOf<EventsListReducer>
  ) {
    self.store = store
    self.formatter = RelativeDateTimeFormatter(
      dateTimeStyle: .named,
      unitsStyle: .full,
      locale: .autoupdatingCurrent,
      calendar: .autoupdatingCurrent
    )
  }

  public var body: some View {
    WithViewStore(store) { viewStore in
      WithLoaded(viewStore.events) { event in
        Button(label: eventContents(for: event, viewStore: viewStore)) {
          viewStore.send(.user(.userClickedOnEvent(event)))
        }
        .buttonStyle(.plain)
        .contextMenu {
          eventContextMenu(
            for: event,
            viewStore: viewStore
          )
        }
        .navigationDestination(
          store: self.store.scope(state: \.$navigation, action: { ._navigation($0) }),
          state: /EventsListReducer.Navigation.State.releaseDetails,
          action: EventsListReducer.Navigation.Action.releaseDetails
        ) { store in
          ReleaseDetailsView(store)
        }
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
    case .commitCommentEvent(let event):
      EventContent.CommitComment(event: event, formatter: formatter)
    case .createEvent(let event):
      EventContent.Create(event: event, formatter: formatter)
    case .deleteEvent(let event):
      EventContent.Delete(event: event, formatter: formatter)
    case .forkEvent(let event):
      EventContent.Fork(event: event, formatter: formatter)
    case .gollumEvent(let event):
      EventContent.Wiki(event: event, formatter: formatter)
    case .issueCommentEvent(let event):
      EventContent.IssueComment(event: event, formatter: formatter)
    case .issuesEvent(let event):
      EventContent.Issue(event: event, formatter: formatter)
    case .memberEvent(let event):
      EventContent.Member(event: event, formatter: formatter)
    case .publicEvent(let event):
      EventContent.Public(event: event, formatter: formatter)
    case .pullRequestEvent(let event):
      EventContent.PullRequest(event: event, formatter: formatter)
    case .pushEvent(let event):
      EventContent.CommitPush(event: event, formatter: formatter)
    case .releaseEvent(let event):
      EventContent.Release(event: event, formatter: formatter)
    case .sponsorshipEvent(let event):
      EventContent.Sponsorship(event: event, formatter: formatter)
    case .watchEvent(let event):
      EventContent.Watch(event: event, formatter: formatter)
    }
  }

  @ViewBuilder
  func eventContextMenu(
    for event: Octokit.Event,
    viewStore: ViewStoreOf<EventsListReducer>
  ) -> some View {
    switch event {
    case .commitCommentEvent(let event):
      EmptyView()
    case .createEvent(let event):
      EmptyView()
    case .deleteEvent(let event):
      EmptyView()
    case .forkEvent(let event):
      EmptyView()
    case .gollumEvent(let event):
      EmptyView()
    case .issueCommentEvent(let event):
      EmptyView()
    case .issuesEvent(let event):
      EmptyView()
    case .memberEvent(let event):
      EmptyView()
    case .publicEvent(let event):
      EmptyView()
    case .pullRequestEvent(let event):
      EmptyView()
    case .pushEvent(let event):
      EmptyView()
    case .releaseEvent(let event):
      Button(label: Label("Star Repository", icon: .star)) {
        //            viewStore.send(.user(.userRequestedRepositoryStarred(event.repository.id)))
      }

      Button(label: Label(event.repository.name, icon: .repository)) {
        //            viewStore.send(.user(.userRequestedRepositoryDetails(event.repository)))
      }

      Button(label: Label(event.actor.login, icon: .author)) {
        //            viewStore.send(.user(.userRequestedActorDetails(event.actor)))
      }

    case .sponsorshipEvent(let event):
      EmptyView()
    case .watchEvent(let event):
      EmptyView()
    }
  }
}

#if DEBUG
public struct EventsListViewPreviews: PreviewProvider {
  /// Primary preview for `EventsListView`, shared with standalone preview app as well.
  public static var preview: some View {
    EventsListView(
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
