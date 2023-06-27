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
          }
        }
      }
      .task {
        viewStore.send(.user(.userNavigatedToActivityFeed))
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
//    case .commitCommentEvent(let event):
//      return Text("commitCommentEvent")
//    case .createEvent(let event):
//      Text("createEvent")
//    case .deleteEvent(let event):
//      Text("deleteEvent")
    case .forkEvent(let event):
        EventView.Fork(
        event: event,
        formatter: formatter
      )
//    case .gollumEvent(let event):
//      Text("gollumEvent")
//    case .issueCommentEvent(let event):
//      Text("issueCommentEvent")
//    case .issuesEvent(let event):
//      Text("issuesEvent")
//    case .memberEvent(let event):
//      Text("memberEvent")
//    case .publicEvent(let event):
//      Text("publicEvent")
//    case .pullRequestEvent(let event):
//      Text("pullRequestEvent")
//    case .pushEvent(let event):
//      Text("pushEvent")
    case .releaseEvent(let event):
      EventView.Release(
        event: event,
        formatter: formatter
      )
//    case .sponsorshipEvent(let event):
//      Text("sponsorshipEvent")
//    case .watchEvent(let event):
//      Text("watchEvent")
      default:
        Text("asdf")
    }
  }
}

#if DEBUG
internal struct ActivityFeedViewPreviews: PreviewProvider {
  internal static var previews: some View {
    ActivityFeedView(
      Store(
        initialState: .init(
          user: .random(),
          publicEvents: .loaded(Octokit.Event.randoms())
        )
      ) {
        ActivityFeedReducer()
      }
    )
  }
}
#endif
