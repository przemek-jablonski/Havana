import ComposableArchitecture
import ReleaseDetailsFeature
import RepositoryViewFeature

public extension EventsListReducer {
  struct Navigation: ReducerProtocol {
    public enum State: Equatable {
      case releaseDetails(ReleaseDetailsReducer.State)
      case repository(RepositoryReducer.State)
    }

    public enum Action: Equatable {
      case releaseDetails(ReleaseDetailsReducer.Action)
      case repository(RepositoryReducer.Action)
    }

    public var body: some ReducerProtocolOf<Self> {
      Scope(
        state: /State.releaseDetails,
        action: /Action.releaseDetails
      ) {
        ReleaseDetailsReducer()
      }

      Scope(
        state: /State.repository,
        action: /Action.repository
      ) {
        RepositoryReducer()
      }
    }
  }
}
