import ComposableArchitecture
import Motif
import Octokit
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
        eventContents(for: event, viewStore: viewStore)
        //        Button(
        //          label: eventContents(for: event, viewStore: viewStore)
        //        ) {
        //          viewStore.send(.user(.userClickedOnEvent(event)))
        //        }
        //        .contextMenu {
        //
        //        }
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
    case .sponsorshipEvent(let event):
      EventContent.Sponsorship(event: event, formatter: formatter)
    case .watchEvent(let event):
      EventContent.Watch(event: event, formatter: formatter)
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
