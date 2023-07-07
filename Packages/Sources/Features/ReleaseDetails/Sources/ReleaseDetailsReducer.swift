import ComposableArchitecture
import Foundation
import Octokit

public struct ReleaseDetailsReducer: ReducerProtocol {
  public struct State: Equatable {
    internal var release: Octokit.Event.ReleaseEvent

    public init(release: Octokit.Event.ReleaseEvent) {
      self.release = release
    }
  }

  public enum Action: Equatable {
    public enum User: Equatable {}

    public enum Local: Equatable {}

    public enum Delegate: Equatable {}

    case user(User)
    case local(Local)
    case delegate(Delegate)
  }

  public init() {}

  public var body: some ReducerProtocolOf<Self> {
    Reduce<State, Action> { _, action in
      switch action {
      case .user, .local, .delegate:
        return .none
      }
    }
  }
}
