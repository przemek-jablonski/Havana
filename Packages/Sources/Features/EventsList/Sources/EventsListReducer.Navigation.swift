import ComposableArchitecture
import ReleaseDetailsFeature

public extension EventsListReducer {
  struct Navigation: ReducerProtocol {
    public enum State: Equatable {
      case releaseDetails(ReleaseDetailsReducer.State)
    }

    public enum Action: Equatable {
      case releaseDetails(ReleaseDetailsReducer.Action)
    }

    public var body: some ReducerProtocolOf<Self> {
      Scope(
        state: /State.releaseDetails,
        action: /Action.releaseDetails
      ) {
        ReleaseDetailsReducer()
      }
    }
  }
}
